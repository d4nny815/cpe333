`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 11/04/2018 07:39:17 PM
// Design Name: 
// Module Name: mux_4t1_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 8:1 MUX with parametized data widths
//
//  USEAGE: (for 4-bit data instantiation)
//
//  mux_8t1_nb  #(.n(4)) my_8t1_mux  (
//       .SEL   (xxxx), 
//       .D0    (xxxx), 
//       .D1    (xxxx), 
//       .D2    (xxxx), 
//       .D3    (xxxx),
//       .D4    (xxxx),
//       .D5    (xxxx),
//       .D6    (xxxx),
//       .D7    (xxxx),
//       .D_OUT (xxxx) );  
// 
// Dependencies: 
// 
// Revision History:
// Revision 1.00 - File Created: 11-04-2018
//          1.01 - switched to default sensitivity list
//          1.02 - (11-24-2019) added macros; edited format
//          1.03 - (12-08-2020) fixed parameter, removed case default
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

   
 module mux_8t1_nb #(parameter n=3) (
       input wire [2:0] SEL, 
       input wire [n-1:0] D0, 
       input wire [n-1:0] D1,
       input wire [n-1:0] D2,
       input wire [n-1:0] D3,
       input wire [n-1:0] D4,
       input wire [n-1:0] D5, 
       input wire [n-1:0] D6, 
       input wire [n-1:0] D7, 
       output reg [n-1:0] D_OUT  );  
       
	   // n is default data width
       
       always @(*)
       begin 
          case (SEL)
		     0:  D_OUT = D0;
		     1:  D_OUT = D1;
		     2:  D_OUT = D2;
		     3:  D_OUT = D3;
		     4:  D_OUT = D4;
		     5:  D_OUT = D5;
		     6:  D_OUT = D6;
		     7:  D_OUT = D7;
			 //default: D_OUT = 0; 
		  endcase 
       end
                
endmodule

`default_nettype wire

   