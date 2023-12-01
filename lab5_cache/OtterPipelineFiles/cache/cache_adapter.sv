`timescale 1ns / 1ps
module cache_adapter (
    input CLK,
    input CLR,
    input [31:0] addr_i,
    input [31:0] data_i,
    input we_cache,
    input we_mem,
    input dir,
    input next,
    output logic [31:0] addr_o,
    output logic [31:0] data_o,
    output logic full,
    output logic dirty
    );

    parameter DATA_WIDTH = 32;

    logic [DATA_WIDTH - 1:0] cache_buffer [3:0]; // MM -> L1
    logic [DATA_WIDTH - 1:0] memory_buffer [3:0]; // L1 -> MM

    logic [1:0] counter;
    always_ff @(posedge CLK) begin
        if (CLR == 1) begin
            counter <= 0;
            dirty <= 0;
        end
        else if (next == 1)
            counter <= counter + 1;
            // full <= counter == 3;
    end
    assign full = counter == 3;

    always_comb begin
        // if (we_cache | we_mem)
        //     addr_o = addr_i + (counter << 2);  // get next address for next word in line
        // else
        //     addr_o = addr_i;
        addr_o = addr_i + (counter << 2);
        data_o = dir == 1 ? cache_buffer[counter] : memory_buffer[counter];
    end

    always_ff @(negedge CLK) begin
        if (we_cache == 1) begin
            cache_buffer[counter] <= data_i;
        end
        else if (we_mem == 1) begin
            dirty = 1; 
            memory_buffer[counter] <= data_i;
        end
    end

endmodule