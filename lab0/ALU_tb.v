`timescale 1ns / 1ps

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