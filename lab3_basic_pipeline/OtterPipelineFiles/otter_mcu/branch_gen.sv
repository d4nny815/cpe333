`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2023 11:29:44 PM
// Design Name: 
// Module Name: branch_addr_gen
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

// branch_addr_gen.v
// Members: Daniel Gutierrez
// Description: Generates branches from different instructional formats

module branch_addr_gen(
    input [31:0] PC, J_type, B_type, I_type, rs1,
    output [31:0] jal, jalr, branch
    );

    assign jal = PC + J_type;
    assign jalr = rs1 + I_type;
    assign branch = PC + B_type;
endmodule
