`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 10/23/2018 07:39:17 PM
// Design Name: 
// Module Name: mux_2t1_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 2:1 MUX with parametized data widths
//
//  USEAGE: (for 4-bit data instantiation)
//
//  mux_2t1_nb  #(.n(4)) my_2t1_mux  (
//       .SEL   (xxxx), 
//       .D0    (xxxx), 
//       .D1    (xxxx), 
//       .D_OUT (xxxx) );  
// 
// Dependencies: 
// 
// Revision History:
// Revision 1.00 - (10-23-2018) File Created: 
//          1.01 - (10-28-2018) fixed default width error 
//          1.02 - (10-29-2019) switched to default sensitivity list
//          1.03 - (11-24-2019) added macros
//          1.04 - (12-08-2020) fixed default parameter position
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

   
 module mux_2t1_nb  #(parameter n=8) (
       input wire SEL,
       input wire [n-1:0] D0, 
       input wire [n-1:0] D1, 
       output reg [n-1:0] D_OUT ) ;  

        
       always @ (*)
       begin 
          if      (SEL == 1'b0)  D_OUT = D0;
          else if (SEL == 1'b1)  D_OUT = D1; 
          else                   D_OUT = 0; 
       end
                
endmodule

`default_nettype wire
   