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
    input [31:0] PC_instr_D,
    input regWrite_D,
    input memWrite_D,
    input memRead2_D,
    input [2:0] alu_fun_D,
    input [1:0] rf_wr_sel_D,
    input [31:0] rs1_D,
    input [31:0] rs2_D,
    input [31:0] Jtype_D,
    input [31:0] Btype_D,
    input [31:0] Itype_D,
    output [31:0] PC_instr_E,
    output regWrite_E,
    output memWrite_E,
    output memRead2_E,
    output [2:0] alu_fun_E,
    output [1:0] rf_wr_sel_E,
    output [31:0] rs1_E,
    output [31:0] rs2_E,
    output [31:0] Jtype_E,
    output [31:0] Btype_E,
    output [31:0] Itype_E

    );

    always_ff @(posedge CLK ) begin 
        regWrite_E <= regWrite_D;
        memWrite_E <= memWrite_D;
        memRead2_E <= memRead2_D;
        alu_fun_E <= alu_fun_D;
        rf_wr_sel_E <= rf_wr_sel_D;
        rs1_E <= rs1_D;
        rs2_E <= rs2_D;
        Jtype_E <= Jtype_D;
        Btype_E <= Btype_D;
    end

endmodule
