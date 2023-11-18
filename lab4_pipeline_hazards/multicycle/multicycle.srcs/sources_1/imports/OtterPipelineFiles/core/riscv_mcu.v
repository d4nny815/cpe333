`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Danny Gutierrez
// 
// Create Date: 05/31/2023 11:17:48 AM
// Design Name: 
// Module Name: riscv_mcu
// Project Name:  
// Target Devices:  
// Tool Versions:  
// Description: 
//  This is a RISC-V MCU that implements the RV32I ISA. 
// 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module OTTER_MCU( 
    input RST, 
    input intr,
    input [31:0] iobus_in, 
    input clk, 
    output iobus_wr,
    output [31:0] iobus_out, 
    output [31:0] iobus_addr
    );

    // PC wires
    wire [31:0] pc, mux_pc;

    // memory wires
    wire [31:0] ir, dout2;

    // register file wires
    wire [31:0] mux_regfile, rs1, rs2;

    // immediate generation wires
    wire [31:0] u_type, i_type, s_type, b_type, j_type;

    // branch address generation wires
    wire [31:0] jalr, jal, branch;

    // ALU wires
    wire [31:0] alu_out, mux_srcA, mux_srcB;

    // branch condition generation wires
    wire br_eq, br_lt, br_ltu;

    // control unit FSM wires
    wire pcWrite, regWrite, memWE2, memRDEN1, memRDEN2, reset;

    // control unit DCDR wires
    wire [1:0] rf_wr_sel, alu_srcA;
    wire [2:0] alu_srcB, pcSource;
    wire [3:0] alu_fun;

    // CSR wires
    wire [31:0] mepc, mtvec, csr_RD;
    wire mret_exec, int_taken, csr_WE, csr_mstatus_mie;
    
    CSR  my_csr (
        .CLK        (clk),
        .RST        (reset),
        .MRET_EXEC  (mret_exec),
        .INT_TAKEN  (int_taken),
        .ADDR       (ir[31:20]),
        .PC         (pc),
        .WD         (alu_out),
        .WR_EN      (csr_WE), 
        .RD         (csr_RD),
        .CSR_MEPC   (mepc),  
        .CSR_MTVEC  (mtvec), 
        .CSR_MSTATUS_MIE (csr_mstatus_mie)    
    ); 

    mux_8t1_nb  #(.n(32)) my_8t1_mux_PC  (
        .SEL   (pcSource), 
        .D0    (pc + 4), 
        .D1    (jalr), 
        .D2    (branch), 
        .D3    (jal),
        .D4    (mtvec),
        .D5    (mepc),
        .D6    (0),
        .D7    (0),
        .D_OUT (mux_pc) 
    );     
    
    reg_nb_sclr #(.n(32)) MY_PC (
        .data_in  (mux_pc), 
        .ld       (pcWrite),
        .clk      (clk), 
        .clr      (reset),    // synchronous reset
        .data_out (pc)        // PC 
    );

    Memory OTTER_MEMORY (
        .MEM_CLK   (clk),
        .MEM_RDEN1 (memRDEN1), 
        .MEM_RDEN2 (memRDEN2), 
        .MEM_WE2   (memWE2),
        .MEM_ADDR1 (pc[15:2]),  // remove the LSB
        .MEM_ADDR2 (alu_out),
        .MEM_DIN2  (rs2),  
        .MEM_SIZE  (ir[13:12]),
        .MEM_SIGN  (ir[14]),
        .IO_IN     (iobus_in),
        .IO_WR     (iobus_wr),
        .MEM_DOUT1 (ir),
        .MEM_DOUT2 (dout2)  
    );
    
    mux_4t1_nb  #(.n(32)) my_4t1_mux_REG_FILE (
        .SEL   (rf_wr_sel), 
        .D0    (pc + 4),         
        .D1    (csr_RD),          
        .D2    (dout2),        
        .D3    (alu_out),      
        .D_OUT (mux_regfile)
    );  
    
    RegFile my_regfile (
        .wd       (mux_regfile),
        .clk      (clk), 
        .en       (regWrite),
        .adr1     (ir[19:15]),
        .adr2     (ir[24:20]),
        .wa       (ir[11:7]),
        .rs1      (rs1), 
        .rs2      (rs2)  
    );
    assign iobus_out = rs2; 

    immed_gen my_immed_gen (
        .ir       (ir[31:7]),
        .U_type   (u_type), 
        .I_type   (i_type), 
        .S_type   (s_type), 
        .J_type   (j_type), 
        .B_type   (b_type)
    );

    branch_addr_gen my_branch_addr_gen (
        .PC       (pc), 
        .J_type   (j_type), 
        .B_type   (b_type), 
        .I_type   (i_type), 
        .rs       (rs1),
        .jal      (jal), 
        .jalr     (jalr), 
        .branch   (branch)
    );

    mux_4t1_nb  #(.n(32)) my_4t1_mux_alu_srcA (
        .SEL   (alu_srcA), 
        .D0    (rs1),       
        .D1    (u_type),       
        .D2    (~rs1),       
        .D3    (0),       
        .D_OUT (mux_srcA)
    );
    
    mux_8t1_nb  #(.n(32)) my_8t1_mux_alu_srcB  (
        .SEL   (alu_srcB), 
        .D0    (rs2), 
        .D1    (i_type), 
        .D2    (s_type), 
        .D3    (pc),
        .D4    (csr_RD),
        .D5    (0),
        .D6    (0),
        .D7    (0),
        .D_OUT (mux_srcB) 
    );    

    alu my_alu (
        .alu_fun  (alu_fun),
        .srcA     (mux_srcA), 
        .srcB     (mux_srcB), 
        .result   (alu_out)
    );
    assign iobus_addr = alu_out; 

    branch_cond_gen my_branch_cond_gen(
        .rs1    (rs1),
        .rs2    (rs2),
        .br_eq  (br_eq),
        .br_lt  (br_lt),
        .br_ltu (br_ltu)
    );

    CU_FSM my_fsm (
       .intr      (intr  && csr_mstatus_mie),
       .clk       (clk),
       .RST       (RST),
       .opcode    (ir[6:0]),    // ir[6:0]
       .func3     (ir[14:12]),  // ir[14:12]
       .pcWrite   (pcWrite),
       .regWrite  (regWrite),
       .memWE2    (memWE2),
       .memRDEN1  (memRDEN1),
       .memRDEN2  (memRDEN2),
       .reset     (reset),
       .csr_WE    (csr_WE),
       .int_taken (int_taken),
       .mret_exec (mret_exec)   
    );
    
    CU_DCDR my_cu_dcdr (
        .br_eq     (br_eq), 
        .br_lt     (br_lt), 
        .br_ltu    (br_ltu),
        .opcode    (ir[6:0]),   //-  ir[6:0]
        .func7     (ir[30]),    //-  ir[30]
        .func3     (ir[14:12]), //-  ir[14:12]
        .int_taken (int_taken), 
        .alu_fun   (alu_fun),
        .pcSource  (pcSource),
        .alu_srcA  (alu_srcA),
        .alu_srcB  (alu_srcB), 
        .rf_wr_sel (rf_wr_sel)   
    );
endmodule
