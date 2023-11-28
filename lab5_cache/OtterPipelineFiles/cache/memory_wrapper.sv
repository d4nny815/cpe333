`timescale 1ns / 1ps
module MemoryWrapper (
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

    

    Cache_FSM FSM(
        .CLK        (CLK),
        .RST        (),
        .hit        (),
        .fill       (),
        .done       (),
        .read       (),
        .d_cache    (),
        .d_apt      (),
        .we_IM      (),
        .we_DM      (),
        .we_apt     (),
        .we_MM      ()
    );

    instr_cache IM(
        .clk        (CLK),
        .addr_i     (),
        .data_i     (),
        .reset      (),
        .hit        (),
        .data_o     (),
        .addr_o     (),
        .dirty_o    ()
    );  

    cache_adapter adapter(
        .clk       (CLK),
        .addr_i    (),
        .data_i    (),
        .clr       (),
        .we_c      (),
        .we_d      (),
        .addr_o    (),
        .data_o    (),
        .fill      (),
        .dirty     ()
    );

    logic MEM_CLK;
    clk_2n_div_test #(.n(4)) MY_DIV (
        .clockin   (CLK), 
        .fclk_only (1),          
        .clockout  (MEM_CLK)   
    );  
    // memory clock gets divided down to add an artificial delay
    Memory OTTER_MEMORY(
        .MEM_CLK    (MEM_CLK),
        .MEM_RDEN1  (MEM_RDEN1),    // read enable Instruction
        .MEM_RDEN2  (MEM_RDEN2),    // read enable data
        .MEM_WE2    (MEM_WE2),      // write enable.
        .MEM_ADDR1  (MEM_ADDR1),    // Instruction Memory word Addr (Connect to PC[15:2])
        .MEM_ADDR2  (MEM_ADDR2),    // Data Memory Addr
        .MEM_DIN2   (MEM_DIN2),     // Data to save
        .MEM_SIZE   (MEM_SIZE),     // 0-Byte, 1-Half, 2-Word
        .MEM_SIGN   (MEM_SIGN),     // 1-unsigned 0-signed
        .IO_IN      (IO_IN),        // Data from IO     
        .IO_WR      (IO_WR),        // IO 1-write 0-read
        .MEM_DOUT1  (MEM_DOUT1),    // Instruction
        .MEM_DOUT2  (MEM_DOUT2)     // Data
    ); 
     

endmodule