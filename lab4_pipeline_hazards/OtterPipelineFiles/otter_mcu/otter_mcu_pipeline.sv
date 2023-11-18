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


module OTTER_MCU (  
    input CLK,
    input INTR,   
    input RESET,  
    input [31:0] IOBUS_IN, 
    output [31:0] IOBUS_OUT, 
    output [31:0] IOBUS_ADDR,
    output logic IOBUS_WR  
    );       

//*********************************************************************************************************************
// Fetch (Instruction Memory) Stage
// ********************************************************************************************************************
    logic [31:0] PC_i, PC_F, PC_plus4_F, Instr_F;
    assign PC_plus4_F = PC_F + 4;
    
    mux_2t1_nb #(.n(32)) PC_2t1_mux (
        .SEL            (pcSource_E),
        .D0             (PC_plus4_F),
        .D1             (PC_target_addr_E),
        .D_OUT          (PC_i)
    );

    reg_nb #(.n(32)) Program_Counter (
        .data_in        (PC_i), 
        .ld             (stall_F), 
        .clk            (CLK), 
        .clr            (RESET), 
        .data_out       (PC_F)
    );

    Memory OTTER_MEMORY (
        .MEM_CLK        (CLK),
        .MEM_RDEN1      (1'b1),   
        .MEM_RDEN2      (memRead2_M),    
        .MEM_WE2        (memWrite_M),
        .MEM_ADDR1      (PC_F[15:2]),
        .MEM_ADDR2      (ALU_result_M),
        .MEM_DIN2       (write_data_M),  
        .MEM_SIZE       (memWrite_size_M[1:0]),
        .MEM_SIGN       (memWrite_size_M[2]),
        .IO_IN          (IOBUS_IN),
        .IO_WR          (IOBUS_WR),
        .MEM_DOUT1      (Instr_F),
        .MEM_DOUT2      (memRead_data_M)  
    ); 
    
    assign IOBUS_OUT = write_data_M;

//*********************************************************************************************************************
// Decode (Register File) stage
// ********************************************************************************************************************
    logic [31:0] Instr_D, PC_D, PC_plus4_D; // from pipeline reg
    logic [31:0] rs1_D, rs2_D, immed_ext_D; // for pipeline reg
    // control unit outputs
    logic regWrite_D, memWrite_D, memRead2_D, alu_srcA_D, alu_srcB_D, jump_D, branch_D, br_eq, br_lt, br_ltu;
    logic [1:0] rf_wr_sel_D;
    logic [2:0] immed_sel;
    logic [3:0] alu_fun_D; 

    Pipeline_reg_fetch_decode pipeline_reg_F_D(
        .CLK            (CLK),
        .stall_D        (stall_D),
        .flush_D        (flush_D),
        .Instr_F        (Instr_F), 
        .PC_F           (PC_F),
        .PC_plus4_F     (PC_plus4_F),
        .Instr_D        (Instr_D),
        .PC_D           (PC_D),
        .PC_plus4_D     (PC_plus4_D)
    );

    Decoder Control_Unit (
        .instr          (Instr_D),
        .regWrite       (regWrite_D),
        .memWrite       (memWrite_D),
        .memRead2       (memRead2_D),
        .jump           (jump_D),
        .branch         (branch_D),
        .alu_fun        (alu_fun_D),
        .alu_src        (alu_src_D),
        .alu_srcB       (alu_srcB_D),
        .immed_sel      (immed_sel),
        .rf_wr_sel      (rf_wr_sel_D)
    );

    RegFile OTTER_reg_file (
        .wd             (rf_write_data_W),
        .clk            (CLK), 
        .en             (regWrite_W),
        .adr1           (Instr_D[19:15]),
        .adr2           (Instr_D[24:20]),
        .wa             (rd_W),
        .rs1            (rs1_D), 
        .rs2            (rs2_D)  
    );

    immed_gen immed_gen_D (
        .ir             (Instr_D),
        .immed_sel      (immed_sel),
        .immed_ext      (immed_ext_D)
    );

// ********************************************************************************************************************
// Execute (ALU) Stage
// ********************************************************************************************************************
    // pipeline reg signals
    logic regWrite_E, memWrite_E, memRead2_E, alu_src_E, alu_srcB_E, jump_E, branch_E;
    logic [1:0] rf_wr_sel_E;
    logic [3:0] alu_fun_E;
    logic [31:0] PC_E, rs1_E, rs2_E, immed_ext_E, ALU_result, ALU_result_E, Instr_E;

    // internal stage signals
    logic [31:0] ALU_srcA_data, ALU_srcB_data, PC_target_addr_E, PC_plus4_E;
    logic ALU_zero_E, pcSource_E, branch_conditional_E;

    Pipeline_reg_decode_execute pipeline_reg_D_E (
        .CLK            (CLK),
        .flush_E        (flush_E),
        .PC_D           (PC_D),
        .Instr_D        (Instr_D),
        .regWrite_D     (regWrite_D),
        .memWrite_D     (memWrite_D),
        .memRead2_D     (memRead2_D),
        .jump_D         (jump_D),
        .branch_D       (branch_D),
        .alu_fun_D      (alu_fun_D),
        .alu_src_D      (alu_src_D),
        .alu_srcB_D     (alu_srcB_D),
        .rf_wr_sel_D    (rf_wr_sel_D),
        .rs1_D          (rs1_D),
        .rs2_D          (rs2_D),
        .immed_ext_D    (immed_ext_D),
        .PC_plus4_D     (PC_plus4_D),
        //
        .PC_E           (PC_E),
        .Instr_E        (Instr_E),
        .regWrite_E     (regWrite_E),
        .memWrite_E     (memWrite_E),
        .memRead2_E     (memRead2_E),
        .jump_E         (jump_E),
        .branch_E       (branch_E),
        .alu_fun_E      (alu_fun_E),
        .alu_src_E      (alu_src_E),
        .alu_srcB_E     (alu_srcB_E),
        .rf_wr_sel_E    (rf_wr_sel_E),
        .rs1_E          (rs1_E),
        .rs2_E          (rs2_E),
        .immed_ext_E    (immed_ext_E),
        .PC_plus4_E     (PC_plus4_E)
    );

    branch_cond_gen branch_conditional(
        .rs1            (ALU_forward_muxA),
        .rs2            (ALU_forward_muxB),
        .instr          (Instr_E[14:12]),
        .branch         (branch_conditional_E)
    );

    logic [31:0] ALU_forward_muxA, ALU_forward_muxB; 
    mux_4t1_nb #(.n(32)) forwardA_mux (
        .SEL            (forwardA_E),
        .D0             (rs1_E), 
	    .D1             (rf_write_data_W), 
	    .D2             (ALU_result_M), 
	    .D3             (0), 
        .D_OUT          (ALU_forward_muxA)
    ); 

    mux_4t1_nb #(.n(32)) forwardB_mux (
        .SEL            (forwardB_E),
        .D0             (rs2_E), 
	    .D1             (rf_write_data_W), 
	    .D2             (ALU_result_M), 
	    .D3             (0), 
        .D_OUT          (ALU_forward_muxB)
   ); 

    mux_2t1_nb #(.n(32)) ALU_srcB_mux (
        .SEL            (alu_srcB_E),
        .D0             (ALU_forward_muxB),
        .D1             (immed_ext_E),
        .D_OUT          (ALU_srcB_data)
    );

    ALU OTTER_ALU(
        .alu_fun        (alu_fun_E),
        .srcA           (ALU_forward_muxA), 
        .srcB           (ALU_srcB_data), 
        .result         (ALU_result),
        .zero           (ALU_zero_E)
    );

    mux_2t1_nb #(.n(32)) ALU_mux (
        .SEL            (alu_src_E),
        .D0             (ALU_result),
        .D1             (PC_target_addr_E),
        .D_OUT          (ALU_result_E)
    );

    assign pcSource_E = (branch_E & branch_conditional_E) | jump_E;
    assign PC_target_addr_E = (Instr_E[6:0] == 7'b1100111) ? ALU_result_E : PC_E + immed_ext_E ;


// ********************************************************************************************************************
// Memory (Data Memory) stage 
// ********************************************************************************************************************
    // pipeline register signals
    logic regWrite_M, memWrite_M, memRead2_M;
    logic [1:0] rf_wr_sel_M;
    logic [2:0] memWrite_size_M;
    logic [4:0] rd_M;
    logic [31:0] ALU_result_M, write_data_M, PC_plus4_M;

    // internal stage signals
    logic [31:0] memRead_data_M; 

    Pipeline_reg_execute_memory pipeline_reg_E_M (
        .CLK            (CLK),
        .regWrite_E     (regWrite_E),
        .memWrite_E     (memWrite_E),
        .memRead2_E     (memRead2_E),
        .rf_wr_sel_E    (rf_wr_sel_E),
        .ALU_result_E   (ALU_result_E),
        .write_data_E   (ALU_forward_muxB),
        .rd_E           (Instr_E[11:7]),
        .memWrite_size_E(Instr_E[14:12]),
        .PC_plus4_E     (PC_plus4_E),
        .regWrite_M     (regWrite_M),
        .memWrite_M     (memWrite_M), 
        .memRead2_M     (memRead2_M),
        .rf_wr_sel_M    (rf_wr_sel_M),
        .ALU_result_M   (ALU_result_M),
        .write_data_M   (write_data_M),
        .rd_M           (rd_M),
        .memWrite_size_M(memWrite_size_M),
        .PC_plus4_M     (PC_plus4_M)
    ); 
    
    assign IOBUS_ADDR = ALU_result_M;

// ********************************************************************************************************************
// Write (Write Back) stage
// ********************************************************************************************************************
    //pipeline register signals
    logic regWrite_W;
    logic [1:0] rf_wr_sel_W;
    logic [4:0] rd_W;
    logic [31:0] ALU_result_W, memRead_data_W, PC_plus4_W, rf_write_data_W;

    Pipeline_reg_memory_writeback pipeline_reg_M_W (
        .CLK            (CLK),
        .regWrite_M     (regWrite_M),
        .rf_wr_sel_M    (rf_wr_sel_M),
        .rd_M           (rd_M),
        .ALU_result_M   (ALU_result_M),
        .memRead_data_M (memRead_data_M),
        .PC_plus4_M     (PC_plus4_M),
        .regWrite_W     (regWrite_W),
        .rf_wr_sel_W    (rf_wr_sel_W),
        .rd_W           (rd_W),
        .ALU_result_W   (ALU_result_W),
        .memRead_data_W (memRead_data_W),
        .PC_plus4_W     (PC_plus4_W)
    );

    mux_4t1_nb #(.n(32)) rf_write_data_mux (
        .SEL            (rf_wr_sel_W),
        .D0             (ALU_result_W ), 
	    .D1             (memRead_data_W), 
	    .D2             (PC_plus4_W), 
	    .D3             (32'd0), 
        .D_OUT          (rf_write_data_W)
    );           


// ********************************************************************************************************************
// HAZARD UNUT
// ********************************************************************************************************************
    logic [1:0] forwardA_E, forwardB_E;
    logic stall_F, stall_D, flush_E, flush_D;
    Hazard_Unit hazard_unit (
        .rs1_D          (Instr_D[19:15]),
        .rs2_D          (Instr_D[24:20]),
        .rs1_E          (Instr_E[19:15]),
        .rs2_E          (Instr_E[24:20]),
        .rd_E           (Instr_E[11:7]),
        .rd_M           (rd_M),
        .rd_W           (rd_W),
        .rf_wr_sel_E    (rf_wr_sel_E),
        .regWrite_M     (regWrite_M),
        .regWrite_W     (regWrite_W),
        .forwardA_E     (forwardA_E),
        .forwardB_E     (forwardB_E),
        .stall_F        (stall_F),
        .stall_D        (stall_D),
        .flush_E        (flush_E),
        .pcSource_E     (pcSource_E),
        .flush_D        (flush_D)
    );


endmodule