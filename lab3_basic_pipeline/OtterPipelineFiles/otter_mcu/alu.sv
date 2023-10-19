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
    output zero
    );
    
    always @ (*)
    begin
        case(alu_fun)
            4'b0000: result = srcA + srcB;                   // 0 add
            4'b0001: result = srcA << srcB[4:0];             // 1 shift left logical sll
            4'b0010: result = $signed(srcA) < $signed(srcB); // 2 set less than slt
            4'b0011: result = srcA < srcB;                   // 3 set less than unsigned sltu
            4'b0100: result = srcA ^ srcB;                   // 4 xor 
            4'b0101: result = srcA >> srcB[4:0];             // 5 shift right logical srl
            4'b0110: result = srcA | srcB;                   // 6 or
            4'b0111: result = srcA & srcB;                   // 7 and
            4'b1000: result = srcA - srcB;                   // 8 subtract sub
            4'b1001: result = srcA;                          // 9 load upper immediate lui
            4'b1101: result = $signed(srcA) >>> srcB[4:0];   // 13 shift right arithmetic sra
            default: result = 32'hDEAD_BEEF;
        endcase
    end
    assign zero = result == 0;
endmodule
