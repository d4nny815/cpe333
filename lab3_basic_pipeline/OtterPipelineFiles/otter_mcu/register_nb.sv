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

module reg_nb #(parameter n=8) (
    input [n-1:0] data_in,
    input clk, 
	input clr, 
	input ld, 
    output logic [n-1:0] data_out  
    ); 

    
    always_ff @(posedge clr, posedge clk) begin 
        if (clr == 1)       // asynch clr
            data_out <= 0;
        else if (ld == 1)   // synch load
            data_out <= data_in; 
    end
endmodule

