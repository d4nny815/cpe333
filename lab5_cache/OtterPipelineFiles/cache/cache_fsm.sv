`timescale 1ns / 1ps
module Cache_FSM(
    input CLK,
    input RST,
    input hit,
    input fill,
    input done,
    input read,
    input d_cache,
    input d_apt,
    output logic we_IM,
    output logic we_DM,
    output logic we_apt,
    output logic we_MM
    );

    typedef enum logic [2:0] {
       st_checkL1,
       st_fill_dirty,
       st_load_write_MM,
       st_write_cache,
    }  state_type;
    state_type  NS,PS;

    //- state registers (PS)
    always @ (posedge CLK) begin
        if (RST == 1)
            PS <= st_checkL1;
        else
            PS <= NS;
    end

    always_comb begin
        case (PS)


        endcase
    end
endmodule