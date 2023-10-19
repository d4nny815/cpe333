`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Daniel Gutierrez
// 
// Create Date: 10/18/2023 10:12:13 PM
// Design Name: 
// Module Name: PIPELINED_OTTER_CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module OTTER_MCU(
    input CLK,
    input INTR,
    input RESET,
    input [31:0] IOBUS_IN,
    output [31:0] IOBUS_OUT,
    output [31:0] IOBUS_ADDR,
    output logic IOBUS_WR 
    );       

    // Fetch (Instruction Memory) Stage
    logic [31:0] PC_i, PC_instr_F, PC_plus4_F, Instr_F;
    assign PC_plus4_F = PC_instr_F + 4;

    mux_4t1_nb #(.n(32)) PC_4t1_mux (
        .SEL            (pcSource_E),
        .D0             (PC_plus4_F), 
	    .D1             (jalr_E), 
	    .D2             (branch_E), 
	    .D3             (jal_E), 
        .D_OUT          (PC_i)
    );

    reg_nb #(.n(32)) Program_Counter (
        .data_in        (PC_i), 
        .ld             (1'b1), //TODO: pcWrite; HARDWIRED
        .clk            (CLK), 
        .clr            (RESET), 
        .data_out       (PC_instr_F)
    );

    Memory OTTER_MEMORY (
        .MEM_CLK        (CLK),
        .MEM_RDEN1      (1'b1),   //TODO: memRead1; HARDWIRED
        .MEM_RDEN2      (), 
        .MEM_WE2        (),
        .MEM_ADDR1      (PC_instr_F),
        .MEM_ADDR2      (),
        .MEM_DIN2       (),  
        .MEM_SIZE       (),
        .MEM_SIGN       (),
        .IO_IN          (),
        .IO_WR          (),
        .MEM_DOUT1      (Instr_F),
        .MEM_DOUT2      ()  
    ); 

    // Decode (Register File) stage
    logic [31:0] Instr_D, PC_instr_D, PC_plus4_D;
    logic [31:0] rs1_D, rs2_D, Utype_D, IType_D, Stype_D, Jtype_D, Btype_D;
    logic regWrite_D, memWrite_D, memRead2_D, alu_srcA;
    logic [1:0] alu_srcB, rf_wr_sel_D;
    logic [2:0] alu_fun_D; 

    Pipeline_reg_fetch_decode pipeline_reg_F_D(
        .CLK            (CLK),
        .Instr_F        (Instr_F), 
        .PC_instr_F     (PC_instr_F),
        .PC_plus4_F     (PC_plus4_F),
        .Instr_D        (Instr_D),
        .PC_instr_D     (PC_instr_D),
        .PC_plus4_D     (PC_plus4_D)
    );

    //TODO: implement
    Decoder Control_Unit (
        .instr          (Instr_D),
        .regWrite       (regWrite_D),
        .memWrite       (memWrite_D),
        .memRead2       (memRead2_D),
        .alu_fun        (alu_fun_D),
        .alu_srcA       (alu_srcA),
        .alu_srcB       (alu_srcB),
        .rf_wr_sel      (rf_wr_sel_D)
    );

    RegFile OTTER_reg_file (
        .wd             (),
        .clk            (CLK), 
        .en             (),
        .adr1           (Instr_D[19:15]),
        .adr2           (Instr_D[24:20]),
        .wa             (),
        .rs1            (rs1), 
        .rs2            (rs2)  
    );

    mux_2t1_nb #(.n(32)) srcA_2t1_mux (
        .SEL            (alu_srcA),
        .D0             (rs1), 
	    .D1             (Utype_D), 
        .D_OUT          (rs1_D)
    );

    immed_gen immed_gen_D (
        .ir             (Instr_D),
        .U_type         (Utype_D),
        .I_type         (IType_D), 
        .S_type         (Stype_D), 
        .J_type         (Jtype_D),
        .B_type         (Btype_D)
    );

    mux_4t1_nb #(.n(32)) srcB_4t1_mux (
        .SEL            (alu_srcB),
        .D0             (rs2), 
	    .D1             (Itype_D), 
	    .D2             (Stype_D), 
	    .D3             (PC_instr_D), 
        .D_OUT          (rs2_D)
    );  

    // Execute (ALU) Stage
    logic regWrite_E, memWrite_E, memRead2_E;
    logic [1:0] rf_wr_sel_E, pcSource_E;
    logic [2:0] alu_fun_E;
    logic [31:0] PC_instr_E, rs1_E, rs2_E, Utype_E, IType_E, Stype_E, Jtype_E, Btype_E, ALU_result_E;
    logic [31:0] jalr_E, branch_E, jal_E;
    Pipeline_reg_decode_execute pipeline_D_E (
        .CLK            (CLK),
        .PC_instr_D     (PC_instr_D),
        .regWrite_D     (regWrite_D),
        .memWrite_D     (memWrite_D),
        .memRead2_D     (memRead2_D),
        .alu_fun_D      (alu_fun_D),
        .rf_wr_sel_D    (rf_wr_sel_D),
        .rs1_D          (rs1_D),
        .rs2_D          (rs2_D),
        .Jtype_D        (Jtype_D),
        .Btype_D        (Btype_D),
        .Itype_D        (Itype_D),
        .PC_instr_E     (PC_instr_E),
        .regWrite_E     (regWrite_E),
        .memWrite_E     (memWrite_E),
        .memRead2_E     (memRead2_E),
        .alu_fun_E      (alu_fun_E),
        .rf_wr_sel_E    (rf_wr_sel_E),
        .rs1_E          (rs1_E),
        .rs2_E          (rs2_E),
        .Jtype_E        (Jtype_E),
        .Btype_E        (Btype_E),
        .Itype_E        (Itype_E)
    );

    branch_addr_gen branch_gen_E(
        .PC             (PC_instr_E), 
        .J_type         (Jtype_E), 
        .B_type         (Btype_E),
        .I_type         (Instr_E), 
        .rs1            (rs1_E),
        .jal            (jal_E), 
        .jalr           (jalr_E), 
        .branch         (branch_Es)
    );

    //TODO: implement maybe correct inputs
    Branch_cond_gen Branch_cond_gen_E(
        .instr          (PC_instr_E),
        .pcSource       (pcSource_E)
    );
    ALU OTTER_ALU(
        .alu_fun        (alu_fun_E),
        .srcA           (rs1_E), 
        .srcB           (rs2_E), 
        .result         (ALU_result_E),
        .zero           ()
    );

// Data Memory



// WriteBack



            
endmodule
