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

// Instantiate the Pipeline_reg_execute_memory module


module Pipeline_reg_execute_memory(
    input CLK,
    input stall_M,
    input flush_M,
    input regWrite_E,
    input memWrite_E,
    input memRead2_E,
    input [1:0] rf_wr_sel_E,
    input [31:0] ALU_result_E,
    input [31:0] write_data_E,
    input [4:0] rd_E,
    input [2:0] memWrite_size_E,
    input [31:0] PC_plus4_E,
    output logic regWrite_M,
    output logic memWrite_M,
    output logic memRead2_M,
    output logic [1:0] rf_wr_sel_M,
    output logic [31:0] ALU_result_M,
    output logic [31:0] write_data_M,
    output logic [4:0] rd_M,
    output logic [2:0] memWrite_size_M,
    output logic [31:0] PC_plus4_M
    );

    always_ff @(posedge CLK) begin
        if (flush_M == 1) begin
            regWrite_M <= 0;
            rf_wr_sel_M <= 0;
            memWrite_M <= 0;
            memRead2_M <= 0;
            ALU_result_M <= 0;
            write_data_M <= 0;
            rd_M <= 0;
            memWrite_size_M <= 0;
            PC_plus4_M <= 0;
        end
        else if (stall_M == 0) begin
            regWrite_M <= regWrite_E;
            rf_wr_sel_M <= rf_wr_sel_E;
            memWrite_M <= memWrite_E;
            memRead2_M <= memRead2_E;
            ALU_result_M <= ALU_result_E;
            write_data_M <= write_data_E;
            rd_M <= rd_E;
            memWrite_size_M <= memWrite_size_E;
            PC_plus4_M <= PC_plus4_E;
        end
    end
endmodule
