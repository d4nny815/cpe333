`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2023 01:15:15 PM
// Design Name: 
// Module Name: test_pipeline
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


module test_pipeline();
    reg clk, rst;
    
    OTTER_MCU my_otter (
        .CLK        (clk),
        .RESET      (rst),
        .INTR       (1'b0),
        .IOBUS_IN   (32'b0),
        .IOBUS_OUT  (),
        .IOBUS_ADDR (), 
        .IOBUS_WR   () 
    ); 
    always begin
    #10 clk = ~clk; 
    end  

    initial begin
        clk = 0; rst = 0;
        #5;
        rst = 1'b1;
        #16;
        rst = 1'b0;
        #400;
        $finish;
    end

endmodule
