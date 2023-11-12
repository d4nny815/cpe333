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

// TODO: implement the decoder module
module Decoder(
    input [31:0] instr,
    input br_eq, 
    input br_lt, 
    input br_ltu,
    output logic regWrite,
    output logic memWrite,
    output logic memRead2,
    output logic jump,
    output logic branch,
    output logic [3:0] alu_fun,
    output logic alu_src,
    output logic alu_srcB,
    output logic [2:0] immed_sel,
    output logic [1:0] rf_wr_sel
    );

    //- datatypes for RISC-V opcode types
    typedef enum logic [6:0] {
        LUI    = 7'b0110111,
        AUIPC  = 7'b0010111,
        JAL    = 7'b1101111,
        JALR   = 7'b1100111,
        BRANCH = 7'b1100011,
        LOAD   = 7'b0000011,
        STORE  = 7'b0100011,
        OP_IMM = 7'b0010011,
        OP_RG3 = 7'b0110011,
        SYS    = 7'b1110011
    } opcode_t;
    opcode_t OPCODE; //- define variable of new opcode type
    assign OPCODE = opcode_t'(instr[6:0]); //- Cast input enum 


    //- datatype for func3Symbols tied to values
    typedef enum logic [2:0] {
        //BRANCH labels
        BEQ = 3'b000,
        BNE = 3'b001,
        BLT = 3'b100,
        BGE = 3'b101,
        BLTU = 3'b110,
        BGEU = 3'b111
    } func3_t;    
    func3_t FUNC3; //- define variable of new opcode type
    assign FUNC3 = func3_t'(instr[14:12]); //- Cast input enum 


    always_comb begin
        regWrite = 1'b1; memWrite = 1'b0; memRead2 = 1'b0; jump = 1'b0;
        branch = 1'b0; alu_fun = 4'b0000; alu_src = 1'b0; alu_srcB = 1'b0; 
        immed_sel = 3'b000; rf_wr_sel = 2'b00;

        case (OPCODE)
            LUI: begin
                alu_fun = 4'b1010;              // lui
                alu_srcB = 1'b1;                // immd ext
                immed_sel = 3'b011;             // U-type
            end

            AUIPC: begin
                alu_fun = 4'b0000;              // add
                alu_src = 1'b1;                 // pc target
                alu_srcB = 1'b1;                // immd ext
                immed_sel = 3'b011;             // U-type
            end

            // TODO : pc +4 reg mux
            JAL: begin
            end

            // TODO
            JALR: begin
            end

            BRANCH: begin
                immed_sel = 3'b010;             // B-type
                if (FUNC3 == BEQ && br_eq == 1)
                    branch = 1'b1;
                else if (FUNC3 == BNE && br_eq == 0)
                    branch = 1'b1;
                else if (FUNC3 == BLT && br_lt == 1)
                    branch = 1'b1;
                else if (FUNC3 == BGE && br_lt == 0)
                    branch = 1'b1;
                else if (FUNC3 == BLTU && br_ltu == 1)
                    branch = 1'b1;
                else if (FUNC3 == BGEU && br_ltu == 0)
                    branch = 1'b1;
            end

            LOAD: begin
                alu_fun = 4'b0000;              // add
                alu_srcB = 1'b1;                // I-type
                rf_wr_sel = 2'b01;              // mem data output
                memRead2 = 1'b1;
            end

            STORE: begin
                alu_fun = 4'b0000;              // add
                alu_srcB = 1'b1;                // immd ext
                immed_sel = 3'b001;             // S-type
                memWrite = 1'b1;                // mem write
                regWrite = 1'b0;                
            end

            OP_IMM: begin
                immed_sel = 3'b000;             // I-type
                alu_srcB = 1'b1;                // immd ext
                case(FUNC3)
                    3'b000: alu_fun = 4'b0000;  // add
                    3'b010: alu_fun = 4'b1000;  // slt
                    3'b011: alu_fun = 4'b1001;  // sltu
                    3'b110: alu_fun = 4'b0011;  // or
                    3'b100: alu_fun = 4'b0100;  // xor
                    3'b111: alu_fun = 4'b0010;  // and
                    3'b001: alu_fun = 4'b0101;  // sll
                    3'b101: begin
                        if (instr[30] == 1)
                            alu_fun = 4'b0111;  // sra
                        else 
                            alu_fun = 4'b0110;  // srl
                    end
                    default: alu_fun = 4'b0000;
                endcase
            end

            OP_RG3: begin
                case(FUNC3)
                    3'b000: begin
                        if (instr[30] == 1)
                            alu_fun = 4'b0001;  // sub
                        else 
                            alu_fun = 4'b0000;  // add
                    end
                    3'b010: alu_fun = 4'b1000;  // slt
                    3'b011: alu_fun = 4'b1001;  // sltu
                    3'b110: alu_fun = 4'b0011;  // or
                    3'b100: alu_fun = 4'b0100;  // xor
                    3'b111: alu_fun = 4'b0010;  // and
                    3'b001: alu_fun = 4'b0101;  // sll
                    3'b101: begin
                        if (instr[30:25] == 6'b010000)
                            alu_fun = 4'b0111;  // sra
                        else 
                            alu_fun = 4'b0110;  // srl
                    end
                    default: alu_fun = 4'b0000;
                endcase
            end

        endcase
    end




endmodule
