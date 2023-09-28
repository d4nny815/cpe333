`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Engineering
// Engineer: James Ratner
// 
// Create Date: 07/04/2018 02:13:56 PM
// Design Name: 
// Module Name: comp_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: n-bit comparator model
//
//   Usage (instantiation) example for 16-bit comparator 
//          (model defaults to 8-bit comparator)
//
//      comp_nb #(.n(16)) MY_COMP (
//          .a  (xxxx), 
//          .b  (xxxx), 
//          .eq (xxxx), 
//          .gt (xxxx), 
//          .lt (xxxx)
//          );  
// 
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created: 07-06-2018
//          1.01 - (11-24-2019) added macros, general clean-up
//          1.02 - (12-20-2020) changed position of parameter
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comp_nb  #(parameter n=8) (
    input wire [n-1:0] a,
	input wire [n-1:0] b, 
    output reg eq, 
    output reg lt, 
    output reg gt   ); 
  
    
    always @ (a,b)
    begin      
       if (a == b)
       begin     
          eq = 1; lt = 0;  gt = 0;   
       end
       else if (a > b)   
       begin     
          eq = 0; lt = 0;  gt = 1; 
       end
       else if (a < b)  
       begin     
          eq = 0; lt = 1;  gt = 0; 
	   end
       else
       begin     
          eq = 0; lt = 0;  gt = 0; 
       end  
    end 

endmodule

`default_nettype wire
