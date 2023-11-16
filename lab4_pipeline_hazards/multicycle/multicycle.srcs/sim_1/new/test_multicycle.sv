`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2023 01:25:48 AM
// Design Name: 
// Module Name: test_multicycle
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


module test_multicycle();
    reg clk, rst;

    OTTER_MCU my_otter (
    .RST (rst), 
    .intr (1'b0),
    .iobus_in (32'b0),
    .clk (clk),
    .iobus_wr (),
    .iobus_out (),
    .iobus_addr ()
    );

    always begin
    #10 clk = ~clk; 
    end  

    initial begin
        clk = 0; rst = 0;
        #5;
        rst = 1'b1;
        #6;
        rst = 1'b0;
        #1000;
        $finish;
    end
endmodule