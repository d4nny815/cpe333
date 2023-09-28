`timescale 1ns / 1ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
// Company:   Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 11/14/2018 02:46:31 PM
// Design Name: 
// Module Name: cntr_up_clr_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generic n-bit loadable up counter with asynchronous postive 
//              logic reset. When up input not asserted, counter holds 
//              state. This counter has RCO to indicate counter reaching 
//              terminal count. 
// 
// cntr_up_clr_nb #(.n(16)) MY_CNTR (
//     .clk   (xxxx), 
//     .clr   (xxxx), 
//     .up    (xxxx), 
//     .ld    (xxxx), 
//     .D     (xxxx), 
//     .count (xxxx), 
//     .rco   (xxxx)   ); 
//
// Dependencies: 
// 
// Revision:
// Revision 1.01 - (11-24-2019) changed comments, added macros
// Revision 1.02 - (09-19-2020) removed some spaces in comments
//          1.03 - (12-08-2020) changed position of parameter
//            
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module cntr_up_clr_nb #(parameter n=8) (
    input wire clk, 
	input wire clr, 
	input wire up, 
	input wire ld, 
    input wire [n-1:0] D,
    output reg [n-1:0] count,
    output wire rco   ); 

    
    always @(posedge clr, posedge clk)
    begin 
        if (clr == 1)       // asynch reset
           count <= 0;
        else if (ld == 1)   // load new value
           count <= D; 
        else if (up == 1)   // count up (increment)
           count <= count + 1;  
    end 
       
    //- handles the RCO 
    assign rco = &count; 
	
endmodule

`default_nettype wire