`timescale 1ns / 1ps
module Cache_FSM(
    input CLK,
    input RST,
    input read,
    input hit,
    input full,
    input MM_clk,
    input dirty_apt,
    input dirty_DM,
    output logic memValid1,
    output logic we_IM,
    output logic we_DM,
    output logic we_apt_cache,
    output logic we_apt_mem,
    output logic we_MM,
    output logic dir,
    output logic next,
    output logic MM_re1,
    output logic apt_clr
    );

    typedef enum logic [1:0] {
       st_checkL1,
       st_fill_dirty,
       st_load_write_MM,
       st_write_cache
    } state_type;
    state_type  NS,PS;

    //- state registers (PS)
    always @ (posedge CLK) begin
        if (RST == 1)
            PS <= st_checkL1;
        else
            PS <= NS;
    end

    always_comb begin
        we_IM = 0; we_DM = 0; we_apt_cache = 0; we_apt_mem = 0; we_MM = 0;
        dir = 0; next = 0; MM_re1 = 0; apt_clr = 0; memValid1 = 0;
        case (PS)
            st_checkL1: begin
                we_IM = 0; 
                we_DM = 0; 
                we_apt_cache = 0; 
                we_apt_mem = 0; 
                we_MM = 0;
                dir = 0;
                next = 0;
                MM_re1 = 0;
                // if (hit == 1 || read == 0) begin       // hit
                if (hit == 1) begin       // hit
                    memValid1 = 1;
                    NS = st_checkL1;
                end
                else if (hit == 0 && dirty_DM == 1) begin // miss and write back
                    apt_clr = 1;
                    NS = st_fill_dirty;
                end
                else if (hit == 0 && dirty_DM == 0) begin   // miss and no write back
                    apt_clr = 1;
                    NS = st_load_write_MM;
                end
            end
            st_fill_dirty: begin
                apt_clr = 0;
                we_IM = 0; 
                we_DM = 0; 
                we_apt_mem = 0; 
                we_MM = 0;
                we_apt_mem = 1;
                next = MM_clk;
                dir = 0;
                if (full == 1)                // done filling dirty line
                    NS = st_load_write_MM;
                else begin
                    NS = st_fill_dirty;
                end
            end
            st_load_write_MM: begin
                apt_clr = 0;
                we_IM = 0; 
                we_DM = 0; 
                we_apt_mem = 0;
                we_apt_cache = 1;
                we_MM = dirty_apt;
                next = MM_clk;
                dir = 1;
                MM_re1 = 1;
                if (full == 1) begin                  // done loading new line
                    apt_clr = 1;
                    NS = st_write_cache;
                end
                else
                    NS = st_load_write_MM;
            end
            st_write_cache: begin
                apt_clr = 0;
                we_IM = 1;
                we_DM = 0;
                we_apt_cache = 0;
                we_apt_mem = 0;
                we_MM = 0;
                next = MM_clk;
                dir = 1;
                MM_re1 = 0;
                if (full == 1)                  // done writing new line
                    NS = st_checkL1;
                else
                    NS = st_write_cache;
            end


        endcase
    end
endmodule