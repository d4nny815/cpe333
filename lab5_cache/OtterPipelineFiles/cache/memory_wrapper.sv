`timescale 1ns / 1ps
module MemoryWrapper (
    input RST,
    input MEM_CLK,
    input MEM_RDEN1,                // read enable Instruction
    input MEM_RDEN2,                // read enable data
    input MEM_WE2,                  // write enable.
    input [13:0] MEM_ADDR1,         // Instruction Memory word Addr (Connect to PC[15:2])
    input [31:0] MEM_ADDR2,         // Data Memory Addr
    input [31:0] MEM_DIN2,          // Data to save
    input [1:0] MEM_SIZE,           // 0-Byte, 1-Half, 2-Word
    input MEM_SIGN,                 // 1-unsigned 0-signed
    input [31:0] IO_IN,             // Data from IO     
    output logic IO_WR,             // IO 1-write 0-read
    output logic [31:0] MEM_DOUT1,  // Instruction
    output logic [31:0] MEM_DOUT2,  // Data
    output logic memValid1,
    output logic memValid2
    );

    // IM L1 wires
    logic IM_hit;
    logic [13:0] IM_addr_i;
    logic [31:0] IM_addr_o, IM_data_o;

    // Cache adapter wires
    logic [31:0] adt_addr_i, adt_data_i, adt_addr_o, adt_data_o;

    // Cache FSM wires
    logic we_IM, we_apt_cache, we_apt_mem, dir, next, full, dirty_adt, MM_re1, apt_clr;

    // Main Memory wires
    logic MM_CLK;
    logic [31:0] MM_instruction;


    Cache_FSM CACHE_FSM(
        .CLK            (MEM_CLK),
        .RST            (RST),
        .read           (MEM_RDEN1),
        .hit            (IM_hit),
        .full           (full),
        .MM_clk         (MM_memValid1),
        .dirty_apt      (dirty_adt),
        .dirty_DM       (1'b0),
        .memValid1      (memValid1),
        .we_IM          (we_IM),
        .we_DM          (),
        .we_apt_cache   (we_apt_cache),
        .we_apt_mem     (we_apt_mem),
        .we_MM          (),
        .dir            (dir),
        .next           (next),
        .MM_re1         (MM_re1),
        .apt_clr        (apt_clr)
    );
     
    assign IM_addr_i = dir == 1 ? adt_addr_o[15:2] : MEM_ADDR1;
    instr_cache IM_L1(
        .CLK            (MEM_CLK),
        .RST            (RST),
        .WE             (we_IM),
        .addr_i         (IM_addr_i),
        .data_i         (adt_data_o),
        .hit            (IM_hit),
        .addr_o         (IM_addr_o),
        .data_o         (IM_data_o)
    ); 
    assign MEM_DOUT1 = IM_data_o; 

    assign adt_data_i = dir == 1 ? MM_instruction : IM_data_o;
    cache_adapter CACHE_ADAPTER(
        .CLK            (MEM_CLK),
        .CLR            (apt_clr),
        .addr_i         ({16'b0, MEM_ADDR1, 2'b0}),
        .data_i         (adt_data_i),
        .we_cache       (we_apt_cache),
        .we_mem         (we_apt_mem),
        .dir            (dir),
        .next           (next),
        .addr_o         (adt_addr_o),
        .data_o         (adt_data_o),
        .full           (full),
        .dirty          (dirty_adt)
    );

    Memory MAIN_MEMORY(
        .RST            (apt_clr),
        .MEM_CLK        (MEM_CLK),
        .MEM_RDEN1      (MM_re1),    // read enable Instruction
        .MEM_RDEN2      (MEM_RDEN2),    // read enable data
        .MEM_WE2        (MEM_WE2),      // write enable.
        .MEM_ADDR1      (adt_addr_o[15:2]),    // Instruction Memory word Addr (Connect to PC[15:2])
        .MEM_ADDR2      (MEM_ADDR2),    // Data Memory Addr
        .MEM_DIN2       (MEM_DIN2),     // Data to save
        .MEM_SIZE       (MEM_SIZE),     // 0-Byte, 1-Half, 2-Word
        .MEM_SIGN       (MEM_SIGN),     // 1-unsigned 0-signed
        .IO_IN          (32'b0),        // Data from IO     
        .IO_WR          (),        // IO 1-write 0-read
        .MEM_DOUT1      (MM_instruction),    // Instruction
        .MEM_DOUT2      (MEM_DOUT2),     // Data
        .memValid1      (MM_memValid1)
    ); 
    
endmodule