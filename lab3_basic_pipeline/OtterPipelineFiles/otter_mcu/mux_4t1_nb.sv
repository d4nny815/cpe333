`timescale 1ns / 1ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Daniel Gutierrez and Ryan Dosanjh
// 
// Create Date: 10/18/2023 10:19:19 PM
// Design Name: 
// Module Name: mux_4t1_nb
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


module mux_4t1_nb #(parameter n=8) (
    input [1:0] SEL,
    input [n-1:0] D0, 
	input [n-1:0] D1, 
	input [n-1:0] D2, 
	input [n-1:0] D3, 
    output logic [n-1:0] D_OUT
    );  
 
        
    always @ (*) begin 
        case (SEL) 
            0: D_OUT = D0;
            1: D_OUT = D1;
            2: D_OUT = D2;
            3: D_OUT = D3;
            default D_OUT = 0;
        endcase 
	end
endmodule
