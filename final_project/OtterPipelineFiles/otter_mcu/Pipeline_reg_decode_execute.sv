`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 11:37:56 PM
// Design Name: 
// Module Name: Pipeline_reg_decode_execute
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


module Pipeline_reg_decode_execute(
    input CLK,
    input flush_E,
    input [31:0] PC_D,
    input [31:0] Instr_D,
    input regWrite_D,
    input memWrite_D,
    input memRead2_D,
    input jump_D,
    input branch_D,
    input [4:0] alu_fun_D,
    input alu_src_D,
    input alu_srcB_D,
    input [1:0] rf_wr_sel_D,
    input [31:0] rs1_D,
    input [31:0] rs2_D,
    input [31:0] immed_ext_D,
    input [31:0] PC_plus4_D,
    output logic [31:0] PC_E,
    output logic [31:0] Instr_E,
    output logic regWrite_E,
    output logic memWrite_E,
    output logic memRead2_E,
    output logic jump_E,
    output logic branch_E,
    output logic [4:0] alu_fun_E,
    output logic alu_src_E,
    output logic alu_srcB_E,
    output logic [1:0] rf_wr_sel_E,
    output logic [31:0] rs1_E,
    output logic [31:0] rs2_E,
    output logic [31:0] immed_ext_E,
    output logic [31:0] PC_plus4_E
    );

    always_ff @(posedge CLK ) begin 
        if (flush_E == 1) begin
            PC_E <= 0;
            Instr_E <= 0;
            regWrite_E <= 0;
            memWrite_E <= 0;
            memRead2_E <= 0;
            jump_E <= 0;
            branch_E <= 0;
            alu_fun_E <= 0;
            alu_src_E <= 0;
            alu_srcB_E <= 0;
            rf_wr_sel_E <= 0;
            rs1_E <= 0;
            rs2_E <= 0;
            immed_ext_E <= 0;
            PC_plus4_E <= 0;
        end
        else begin
            PC_E <= PC_D;
            Instr_E <= Instr_D;
            regWrite_E <= regWrite_D;
            memWrite_E <= memWrite_D;
            memRead2_E <= memRead2_D;
            jump_E <= jump_D;
            branch_E <= branch_D;
            alu_fun_E <= alu_fun_D;
            alu_src_E <= alu_src_D;
            alu_srcB_E <= alu_srcB_D;
            rf_wr_sel_E <= rf_wr_sel_D;
            rs1_E <= rs1_D;
            rs2_E <= rs2_D;
            immed_ext_E <= immed_ext_D;
            PC_plus4_E <= PC_plus4_D;
        end
    end

endmodule
