`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 10/12/2019 07:39:17 PM
// Design Name: 
// Module Name: rc_valid_chk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Validity check for signed binary numbers. This modules
//                 does not check for the case where the maximum 
//                 negative number is subtracted from another number. 
//
//  USEAGE:
//
//  rc_valid_chk  my_valid  (
//       .a_sb   (my_a_sb), 
//       .b_sb   (my_b_sb), 
//       .sum_sb (my_sum_sb), 
//       .valid  (my_valid) ); 
// 
// Dependencies: 
// 
// Revision History:
// Revision 1.00 - File Created: 10-12-2019
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

   
 module rc_valid_chk(a_sb, b_sb, sum_sb, valid); 
	input  a_sb; 
	input  b_sb; 
	input  sum_sb; 
	output reg valid;   
       
	
	always @(a_sb, b_sb, sum_sb)
		begin 
		if ( (a_sb == b_sb) && (b_sb != sum_sb) ) 
		begin 
			valid = 1'b0; 
	    end
		else
		begin
			valid = 1'b1; 
		end
	end
                
endmodule