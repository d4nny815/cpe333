`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Engineering
// Engineer: James Ratner
// 
// Create Date: 01/03/2020 02:13:56 PM
// Design Name: 
// Module Name: generic single port ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//
//   Usage (instantiation) example for 32x8 RAM  
//          (model defaults to 64x8 RAM)
//              n is address width
//              m is data width
//
//  ram_single_port #(.n(4),.m(8)) my_ram (
//      .data_in  (xxxx),  // m spec
//      .addr     (xxxx),  // n spec 
//      .we       (xxxx),
//      .clk      (xxxx),
//      .data_out (xxxx)
//      );  
// 
// Dependencies: 
// 
// Revision: 1.00 - (01-02-2020) created
//           1.01 - (12-20-2020) changed parameter location & comments 
//         
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module ram_single_port 
   #(parameter n = 6,
     parameter m = 8) (
	input wire [m-1:0] data_in,
	input wire [n-1:0] addr,
	input wire we, 
	input wire clk,
	output wire [m-1:0] data_out  );


	// Declare the memory variable
	reg [m-1:0] memory[2**n-1:0];
	
    // synchronous write
	always @ (posedge clk)
	begin
		if (we)
			memory[addr] <= data_in;
	end
  
    // asynchronous reads
	assign data_out = memory[addr];
	
endmodule

`default_nettype wire
