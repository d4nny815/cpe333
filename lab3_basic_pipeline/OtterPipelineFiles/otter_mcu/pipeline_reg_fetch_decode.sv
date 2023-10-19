`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 10:52:17 PM
// Design Name: 
// Module Name: pipeline_reg_fetch_decode
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


module Pipeline_reg_fetch_decode(
    input CLK,
    input [31:0] Instr_F, 
    input [31:0] PC_instr_F,
    input [31:0] PC_plus4_F,
    output logic [31:0] Instr_D,
    output logic [31:0] PC_instr_D,
    output logic [31:0] PC_plus4_D
    );

    always_ff @(posedge CLK) begin
        Instr_D <= Instr_F;
        PC_instr_D <= PC_instr_F;
        PC_plus4_D <= PC_plus4_F;
    end


endmodule
