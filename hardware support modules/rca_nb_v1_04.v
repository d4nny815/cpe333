`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Engineering
// Engineer: James Ratner
// 
// Create Date: 07/04/2018 02:13:56 PM
// Design Name: 
// Module Name: rca_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: n-bit RCA model
//
//   Usage (instantiation) example for 16-bit RCA  
//          (model defaults to 8-bit RCA)
//
//      rca_nb #(.n(16)) MY_RCA (
//          .a   (xxxx), 
//          .b   (xxxx), 
//          .cin (xxxx), 
//          .sum (xxxx), 
//          .co  (xxxx)
//          );  
// 
// Dependencies: 
// 
// Revision:
// Revision 1.00 - File Created: 07-04-2018
//          1.01 - Removed unused variable
//          1.02 - (11-24-2019) added macros; edited format
//          1.03 - (12-08-2020) changed positio of parameter
//          1.04 - (10-11-2021) added wire types to inputs
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rca_nb  #(parameter n=8) (
    input wire [n-1:0] a,
    input wire [n-1:0] b,
    input wire cin,
    output reg [n-1:0] sum,
    output reg co
    );
	

    always @ (*)
    begin
       {co,sum} = a + b + cin;    
    end
    
endmodule

`default_nettype wire

