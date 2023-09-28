`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company:   Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 09/08/2018 07:17:37 PM
// Design Name: 
// Module Name: reg_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Model for generic loadable register (defaults to 8 bits)
//                with asynchronous positive logic clear 
//
//      //- Usage example for instantiating 16-bit register
//      reg_nb #(.n(16)) MY_REG (
//          .data_in  (xxxx), 
//          .ld       (xxxx), 
//          .clk      (xxxx), 
//          .clr      (xxxx), 
//          .data_out (xxxx);  
//
// Dependencies: 
// 
// Revision:
// Revision 1.00 - (09-09-2018) File Created
//          1.01 - (11-24-2019) added macros; made edits  
//          1.02 - (09-29-2020) fixed comment in instantiation template
//          1.03 - (12-08-2020) changed position of parameter declaration
//            
//   
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module reg_nb #(parameter n=8) (
    input wire [n-1:0] data_in,
    input wire clk, 
	input wire clr, 
	input wire ld, 
    output reg [n-1:0] data_out  ); 

    
    always @(posedge clr, posedge clk)
    begin 
       if (clr == 1)       // asynch clr
          data_out <= 0;
       else if (ld == 1)   // synch load
          data_out <= data_in; 
    end
    
endmodule

`default_nettype wire

