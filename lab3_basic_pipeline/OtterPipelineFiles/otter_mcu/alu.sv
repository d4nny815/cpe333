`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2023 03:51:47 AM
// Design Name: 
// Module Name: main
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

module ALU(
    input [3:0] alu_fun,
    input [31:0] srcA, srcB, 
    output logic [31:0] result,
    output logic zero
    );

    always @ (*)
    begin
        case(alu_fun)
            4'b0000: result = srcA + srcB; // add
            4'b0001: result = srcA - srcB; // sub
            4'b0010: result = srcA & srcB; // and
            4'b0011: result = srcA | srcB; // or
            4'b0100: result = srcA ^ srcB; // xor
            4'b0101: result = srcA << srcB[4:0]; // sll
            4'b0110: result = srcA >> srcB[4:0]; // srl
            4'b0111: result = $signed(srcA) >>> srcB[4:0]; // sra
            4'b1000: result = $signed(srcA) < $signed(srcB); // slt
            4'b1001: result = srcA < srcB; // sltu
            4'b1010: result = srcB; // lui
            default: result = 32'hDEAD_BEEF;
        endcase
        zero = result == 0;
    end
endmodule
