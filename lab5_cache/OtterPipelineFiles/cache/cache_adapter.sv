`timescale 1ns / 1ps
module cache_adapter (
    input clk,
    input [31:0] addr_i,
    input [31:0] data_i,
    input clr,
    input we_c,
    input we_d,
    output [31:0] addr_o,
    output [31:0] data_o,
    output fill,
    output dirty
    );

endmodule