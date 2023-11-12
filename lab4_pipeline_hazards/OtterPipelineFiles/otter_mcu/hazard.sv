`timescale 1ns / 1ps

module Hazard_Unit (
    input [4:0] rs1_D,
    input [4:0] rs2_D,
    input [4:0] rs1_E,
    input [4:0] rs2_E,
    input [4:0] rd_E,
    input [4:0] rd_M,
    input [4:0] rd_W,
    input regWrite_M,
    input regWrite_W,
    input [1:0] rf_wr_sel_E,
    output logic [1:0] forwardA_E,
    output logic [1:0] forwardB_E,
    output logic stall_F,
    output logic stall_D,
    output logic flush_E
    );
    
    always_comb begin
        if ((rs1_E == rd_M) && regWrite_M && (rs1_E != 0)) begin
            forwardA_E = 2'b10;
        end
        else if ((rs1_E == rd_W) && regWrite_W && (rs1_E != 0)) begin
            forwardA_E = 2'b01;
        end
        else begin
            forwardA_E = 2'b00;
        end
    end

    always_comb begin
        if ((rs2_E == rd_M) && regWrite_M && (rs2_E != 0)) begin
            forwardB_E = 2'b10;
        end
        else if ((rs2_E == rd_W) && regWrite_W && (rs2_E != 0)) begin
            forwardB_E = 2'b01;
        end
        else begin
            forwardB_E = 2'b00;
        end
    end

    always_comb begin
        if ((rf_wr_sel_E == 2'b01) & ((rs1_D == rd_E) | (rs2_D == rd_E)) ) begin
            stall_F = 1'b1;
            stall_D = 1'b1;
            flush_E = 1'b1;
        end
        else begin
            stall_F = 1'b0;
            stall_D = 1'b0;
            flush_E = 1'b0;

        end
    end


endmodule
