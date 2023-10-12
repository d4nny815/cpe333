`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   
// Engineer:  Daniel Gutierrez and Ryan Dosanjh
// 
// Create Date: 01/16/2020 11:41:46 AM
// Design Name: 
// Module Name: 
// Project Name: 32bit ALU
// Target Devices: 
// Tool Versions: 
// Description: Testbench file for Lab0
// 
// Dependencies: 
// 
// Revision:
// Revision 
//     
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module ALU_tb ();
    reg [31:0] A, B;
    reg [2:0] ALUOp;

    wire Zero;
    wire [31:0] Result;

    ALU_32b my_alu (
        .A      (A),
        .B      (B),
        .ALUOp  (ALUOp),
        .Result (Result),
        .Zero   (Zero)
    );

    initial begin
        A = 32'h0000_00AA; B = 32'h0000_0055;
        ALUOp = 3'b000;     // AND
        #10
        ALUOp = 3'b001;     // OR
        #10

        ALUOp = 3'b010;     // ADD
        A = -2; B = -5;
        #10
        A = 2; B = 5;
        #10

        ALUOp = 3'b110;     // SUB
        A = -2; B = -5;
        #10
        A = 2; B = 5;
        #10
        
        ALUOp = 3'b111;     // SET LESS THAN
        A = -2; B = 5;
        #10
        A = 1;
        #10
        A = 5; B = 2;
        #10
        A = 5; B = -2;
        #10
        $finish;
    end

endmodule