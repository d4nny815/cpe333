`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 11:09:56 PM
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [31:0] instr,
    output regWrite,
    output memWrite,
    output memRead2,
    output [2:0] alu_fun,
    output alu_srcA,
    output [1:0] alu_srcB,
    output [1:0] rf_wr_sel
    );
endmodule
