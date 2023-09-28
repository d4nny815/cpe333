`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 12/08/2018 07:39:17 PM
// Design Name: 
// Module Name: stand_dcdr_2t4_1hot_cold
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 2:4 standard decoder with selectable 1-hot 
//              or 1-cold outputs. 
//
//  USEAGE: 
//
//     HOT_NCOLD = 1 for 1-hot outputs
//     HOT_NCOLD = 0 for 1-cold outputs
//   
//
//  stand_dcdr_2t4_1hot_cold  my_stand_dcdr  (
//       .SEL        (xxxx), 
//       .HOT_NCOLD  (xxxx)
//       .D_OUT      (xxxx)  ); 
//
// 
// Dependencies: 
// 
// Revision History:
// Revision 1.00 - (12-08-2020) File Created: 
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

   
 module stand_dcdr_2t4_1hot_cold (
    input wire [1:0] SEL, 
    input wire  HOT_NCOLD; 
	output wire [3:0] D_OUT  );  
	
    reg  [3:0] d_temp;    
   
    //- standard decoder for display multiplex 
    always @ (*)
    begin
       case (SEL)
          0: d_temp = 4'b1110;  
          1: d_temp = 4'b1101; 
          2: d_temp = 4'b1011;
          3: d_temp = 4'b0111;
          // default D_OUT = 4'b0000;  all cases are covered
       endcase 
    end 

    assign D_OUT = d_temp ^ {4{HOT_NCOLD}};  // XOR to be hot or cold

endmodule
	
`default_nettype wire

	