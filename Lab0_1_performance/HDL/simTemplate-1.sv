`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, San Luis Obispo
// Engineer: Diego Renato Curiel
// Create Date: 03/02/2023 04:27:09 PM
// Design Name: 
// Module Name: OTTERSim
//////////////////////////////////////////////////////////////////////////////////

module OTTERSim();

    logic clk, rst, wr;
    logic [31:0] in, out, addr;
    
    OTTER_MCU UUT(
        .RST            (rst), 
        .intr           (), 
        .iobus_in       (in), 
        .clk            (clk), 
        .iobus_wr       (wr), 
        .iobus_out      (out), 
        .iobus_addr     (addr)
    );

    initial begin
    clk = 0;
    rst = 1; 
    end

    always begin
    #10 clk = ~clk; end  

    always begin
    #30 rst = 1'b0;
     in = 32'h2; end
    
endmodule