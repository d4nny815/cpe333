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
    input [4:0] alu_fun,
    input [31:0] srcA, srcB, 
    output logic [31:0] result,
    output logic zero
    );

    typedef enum logic [4:0] {
        ADD  =   5'b0_0000,
        SUB  =   5'b0_0001,
        AND  =   5'b0_0010,
        OR   =   5'b0_0011,
        XOR  =   5'b0_0100,
        SLL  =   5'b0_0101,
        SRL  =   5'b0_0110,
        SRA  =   5'b0_0111,
        SLT  =   5'b0_1000,
        SLTU =   5'b0_1001,
        LUI  =   5'b0_1010,
        MUL  =   5'b0_1011,
        MULH =   5'b0_1100,
        MULHSU = 5'b0_1101,
        MULHU =  5'b0_1110,
        DIV  =   5'b0_1111,
        DIVU =   5'b1_0000,
        REM  =   5'b1_0001,
        REMU =   5'b1_0010
    } alu_fun_t;
    alu_fun_t ALU_FUN; //- define variable of new opcode type
    assign ALU_FUN = alu_fun_t'(alu_fun); //- Cast input enum 

    logic [63:0] result64;
    always @ (*) begin
        case(ALU_FUN)
            ADD:        result = srcA + srcB; 
            SUB:        result = srcA - srcB; 
            AND:        result = srcA & srcB; 
            OR:         result = srcA | srcB; 
            XOR:        result = srcA ^ srcB; 
            SLL:        result = srcA << srcB[4:0]; 
            SRL:        result = srcA >> srcB[4:0]; 
            SRA:        result = $signed(srcA) >>> srcB[4:0]; 
            SLT:        result = $signed(srcA) < $signed(srcB); 
            SLTU:       result = srcA < srcB; 
            LUI:        result = srcB; 
            MUL:        result64 = $signed(srcA) * $signed(srcB);
            MULH:       result64 = $signed(srcA) * $signed(srcB) >> 32;
            MULHSU:     result64 = $signed(srcA) * srcB >> 32;
            MULHU:      result64 = srcA * srcB >> 32;
            DIV:        result = $signed(srcA) / $signed(srcB);
            DIVU:       result = srcA / srcB;
            REM:        result = $signed(srcA) % $signed(srcB);
            REMU:       result = srcA % srcB;
            default:    result = 32'hDEAD_BEEF;
        endcase
        zero = result == 0;
        if (alu_fun == MUL || alu_fun == MULH || alu_fun == MULHSU || alu_fun == MULHU) begin
            result = result64[31:0];
        end
        if (srcB == 0 && ALU_FUN == DIV || ALU_FUN == DIVU) result = -1;
        if (srcB == 0 && ALU_FUN == REM || ALU_FUN == REMU) result = srcA;
        if (srcA == -2147483648 && srcB == -1 && ALU_FUN == DIV) result = srcA;
        if (srcA == -2147483648 && srcB == -1 && ALU_FUN == REM) result = 0;

    end
endmodule
