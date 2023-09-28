`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Engineering
// Engineer: James Ratner
// 
// Create Date: 10/17/2019 02:13:56 PM
// Design Name: 
// Module Name: nb_twos_comp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Changes the sign of input for 2's complement numbers
//
//   Usage (instantiation): 
//     
//  nb_twos_comp #(.n(16)) my_sign_changer (
//      .a     (xxxx), 
//      .a_min (xxxx)  
//      );  
// 
// Dependencies: 
//           1.01 (12-20-2020) - changed parameter location & comments
// 
// Revision:
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nb_twos_comp   #(parameter n=13) (
    input [n-1:0] a,
    output reg [n-1:0] a_min
    );

    always @(a)
    begin
       a_min = ~a + 1;    
    end
    
endmodule
