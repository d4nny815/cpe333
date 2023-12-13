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

    parameter DATA_WIDTH = 32;
    parameter MAX_UNSIGNED = 2 ** DATA_WIDTH - 1;
    parameter MAX_SIGNED_NEG = -(2 ** (DATA_WIDTH - 1));
    parameter NEG_ONE = 32'hFFFF_FFFF;


    logic [63:0] mult64;
    logic [31:0] div_by_0, reg_ops, mult32;
    logic [1:0] mux_sel;

    // decoder
    always_comb begin
        //divide by
        if ((srcB == 0) && (ALU_FUN == DIV || ALU_FUN == DIVU || ALU_FUN == REMU || ALU_FUN == REM)) begin
            mux_sel = 2'b00;
        
        //mult
        end 
        else if (ALU_FUN == MUL || ALU_FUN == MULH || ALU_FUN == MULHSU || ALU_FUN == MULHU) begin
            mux_sel = 2'b10;
        end
        
        //regular operations
        else begin
            mux_sel = 2'b01;
        end
    end

    // computations
    always_comb begin
        // div by 0
        case (ALU_FUN) 
            DIVU: div_by_0 = MAX_UNSIGNED;
            REMU: div_by_0 = srcA;
            DIV: div_by_0 = -1;
            REM: div_by_0 = srcA;
            default: div_by_0 = 32'hDEAD_BEEF;
        endcase

        // mult
        case (ALU_FUN)
            MUL:        mult64 = $signed(srcA) * $signed(srcB);
            MULH:       mult64 = $signed(srcA) * $signed(srcB) >> 32;
            MULHSU:     mult64 = $signed(srcA) * srcB >> 32;
            MULHU:      mult64 = srcA * srcB >> 32;
            default: mult64 = 32'hDEAD_BEEF;
        endcase
        mult32 = mult64[31:0];
        // reg
        case (ALU_FUN)
            ADD:        reg_ops = srcA + srcB; 
            SUB:        reg_ops = srcA - srcB; 
            AND:        reg_ops = srcA & srcB; 
            OR:         reg_ops = srcA | srcB; 
            XOR:        reg_ops = srcA ^ srcB; 
            SLL:        reg_ops = srcA << srcB[4:0]; 
            SRL:        reg_ops = srcA >> srcB[4:0]; 
            SRA:        reg_ops = $signed(srcA) >>> srcB[4:0]; 
            SLT:        reg_ops = $signed(srcA) < $signed(srcB); 
            SLTU:       reg_ops = srcA < srcB; 
            LUI:        reg_ops = srcB; 
            DIV: begin
                if (srcA == MAX_SIGNED_NEG && srcB == NEG_ONE) reg_ops = 32'h8000_0000;
                else reg_ops = $signed(srcA) / $signed(srcB);
            end
            DIVU:       reg_ops = srcA / srcB;
            REM: begin
                if (srcA == MAX_SIGNED_NEG && srcB == NEG_ONE) reg_ops = 0;
                else reg_ops = $signed(srcA) % $signed(srcB);
            end
            REMU:       reg_ops = srcA % srcB;
            default:    reg_ops = 32'hDEAD_BEEF;
        endcase
    end

    // mux 
    always_comb begin
        zero = result == 0;
        case (mux_sel)
            2'b00: result = div_by_0;
            2'b01: result = reg_ops;
            2'b10: result = mult32;
            default: result = 32'hDEAD_BEEF;
        endcase
    end

endmodule
