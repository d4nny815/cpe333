`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 11:37:56 PM
// Design Name: 
// Module Name: Pipeline_reg_memory_writeback
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

module Pipeline_reg_memory_writeback(
    input CLK,
    input stall_W,
    input regWrite_M,
    input [1:0] rf_wr_sel_M,
    input [4:0] rd_M,
    input [31:0] ALU_result_M,
    input [31:0] memRead_data_M,
    input [31:0] PC_plus4_M,
    output logic regWrite_W,
    output logic [1:0] rf_wr_sel_W,
    output logic [4:0] rd_W,
    output logic [31:0] ALU_result_W,
    output logic [31:0] memRead_data_W,
    output logic [31:0] PC_plus4_W
    );

    always_ff @(posedge CLK ) begin
        if (stall_W == 0) begin
            regWrite_W <= regWrite_M;
            rf_wr_sel_W <= rf_wr_sel_M;
            rd_W <= rd_M;
            ALU_result_W <= ALU_result_M;
            memRead_data_W <= memRead_data_M;
            PC_plus4_W <= PC_plus4_M;
        end
    end
endmodule
