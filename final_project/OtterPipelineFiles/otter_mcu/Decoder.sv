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

module Decoder(
    input [6:0] opcode,
    input [2:0] func3,
    input [6:0] func7,
    output logic regWrite,
    output logic memWrite,
    output logic memRead2,
    output logic jump,
    output logic branch,
    output logic [4:0] alu_fun,
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
    assign OPCODE = opcode_t'(opcode); //- Cast input enum 


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
    assign FUNC3 = func3_t'(func3); //- Cast input enum 


    always_comb begin
        regWrite = 1'b1; memWrite = 1'b0; memRead2 = 1'b0; jump = 1'b0;
        branch = 1'b0; alu_fun = 5'b00000; alu_src = 1'b0; alu_srcB = 1'b0; 
        immed_sel = 3'b000; rf_wr_sel = 2'b00;

        case (OPCODE)
            LUI: begin
                alu_fun = 5'b01010;                 // lui
                alu_srcB = 1'b1;                    // immd ext
                immed_sel = 3'b011;                 // U-type
            end

            AUIPC: begin
                alu_fun = 5'b00000;                 // add
                alu_src = 1'b1;                     // pc target
                alu_srcB = 1'b1;                    // immd ext
                immed_sel = 3'b011;                 // U-type
            end

            JAL: begin
                jump = 1'b1;                        // jump
                immed_sel = 3'b100;                 // j-type
                alu_src = 1'b1;                     // pc target
                rf_wr_sel = 2'b10;                  // PC + 4
            end

            JALR: begin
                jump = 1'b1;                        // jump
                alu_fun = 5'b00000;                 // add
                alu_srcB = 1'b1;                    // i-type
                rf_wr_sel = 2'b10;                  // PC + 4
            end

            BRANCH: begin
                regWrite = 1'b0;                    // no reg write
                immed_sel = 3'b010;                 // B-type
                branch = 1'b1;
            end

            LOAD: begin
                alu_fun = 5'b00000;                 // add
                alu_srcB = 1'b1;                    // I-type
                rf_wr_sel = 2'b01;                  // mem data output
                memRead2 = 1'b1;
            end

            STORE: begin
                alu_fun = 5'b00000;                 // add
                alu_srcB = 1'b1;                    // immd ext
                immed_sel = 3'b001;                 // S-type
                memWrite = 1'b1;                    // mem write
                regWrite = 1'b0;                
            end

            OP_IMM: begin
                immed_sel = 3'b000;                 // I-type
                alu_srcB = 1'b1;                    // immd ext
                case(FUNC3)
                    3'b000: alu_fun = 5'b0_0000;    // add
                    3'b010: alu_fun = 5'b0_1000;    // slt
                    3'b011: alu_fun = 5'b0_1001;    // sltu
                    3'b110: alu_fun = 5'b0_0011;    // or
                    3'b100: alu_fun = 5'b0_0100;    // xor
                    3'b111: alu_fun = 5'b0_0010;    // and
                    3'b001: alu_fun = 5'b0_0101;    // sll
                    3'b101: begin
                        if (func7 == 7'b010_0000)
                            alu_fun = 5'b0_0111;    // sra
                        else 
                            alu_fun = 5'b0_0110;    // srl
                    end
                    default: alu_fun = 5'b0_0000;
                endcase
            end

            OP_RG3: begin
                case(FUNC3)
                    3'b000: begin
                        if (func7 == 7'b000_0001)
                            alu_fun = 5'b0_1011;          // mul
                        else if (func7 == 7'b010_0000)
                            alu_fun = 5'b0_0001;          // sub
                        else 
                            alu_fun = 5'b0_0000;          // add
                    end
                    3'b010: begin
                        if (func7 == 7'b000_0001)
                            alu_fun = 5'b0_1101;          // mulhsu
                        else 
                            alu_fun = 5'b0_1000;          // slt
                    end
                    3'b011: begin
                        if (func7 == 7'b000_0001)
                            alu_fun = 5'b0_1110;          // mulhu
                        else 
                            alu_fun = 5'b0_1001;          // sltu
                    end 
                    3'b110: begin
                        if (func7 == 7'b000_0001)
                            alu_fun = 5'b1_0001;          // rem
                        else 
                            alu_fun = 5'b0_0011;          // or
                    end 
                    
                    3'b100: begin
                        if (func7 == 7'b000_0001)
                            alu_fun = 5'b0_1111;          // div
                        else
                            alu_fun = 5'b0_0100;          // xor
                    end 
                    3'b111: begin
                        if (func7 == 7'b000_0001)
                            alu_fun = 5'b1_0010;          // remu
                        else 
                            alu_fun = 5'b0_0010;          // and
                    end 
                    3'b001: begin  
                        if (func7 == 7'b000_0001)
                            alu_fun = 5'b0_1100;          // mulh
                        else 
                            alu_fun = 5'b0_0101;          // sll
                    end
                    3'b101: begin
                        if (func7 == 7'b010_0000)
                            alu_fun = 5'b0_0111;          // sra
                        else if (func7 == 7'b000_0001)
                            alu_fun = 5'b1_0000;          // divu
                        else 
                            alu_fun = 5'b0_0110;          // srl
                    end
                    default: alu_fun = 5'b0_0000;
                endcase
            end

        endcase
    end




endmodule
