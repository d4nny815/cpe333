`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 06:58:03 PM
// Design Name: 
// Module Name: branch_cond_gen
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

// branch_cond_gen.v
// Members: Daniel Gutierrez
// Description:
// 
// 

module branch_cond_gen(
    input [31:0] rs1,
    input [31:0] rs2,
    output logic br_eq,
    output logic br_lt,
    output logic br_ltu
    );
    
    always_comb begin
        br_eq = (rs1 == rs2);
        br_lt = ($signed(rs1) < $signed(rs2));
        br_ltu = (rs1 < rs2);
    end
endmodule
