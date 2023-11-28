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
    input [2:0] instr,
    output logic branch
    );
    
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
    assign FUNC3 = func3_t'(instr); //- Cast input enum 


    always_comb begin
        if (FUNC3 == BEQ && (rs1 == rs2))
            branch = 1'b1;
        else if (FUNC3 == BNE && !(rs1 == rs2))
            branch = 1'b1;
        else if (FUNC3 == BLT && ($signed(rs1) < $signed(rs2)))
            branch = 1'b1;
        else if (FUNC3 == BGE && !($signed(rs1) < $signed(rs2)))
            branch = 1'b1;
        else if (FUNC3 == BLTU && (rs1 < rs2))
            branch = 1'b1;
        else if (FUNC3 == BGEU && !(rs1 < rs2))
            branch = 1'b1;
        else
            branch = 1'b0;
    end
endmodule
