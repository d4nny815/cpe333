`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 07/04/2018 02:46:31 PM
// Design Name: 
// Module Name: cntr_udclr_nb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generic n-bit up/down counter with asynchronous reset. 
//     This counter also has RCO that works for both up & down counting. 
// 
//      cntr_udclr_nb #(.n(16)) MY_CNTR (
//          .clk   (xxxx), 
//          .clr   (xxxx), 
//          .up    (xxxx), 
//          .ld    (xxxx), 
//          .D     (xxxx), 
//          .count (xxxx), 
//          .rco   (xxxx)   ); 
//
// Dependencies: 
// 
// Revision:
// Revision (07-06-2018) 1.00 - File Created 
//          (11-11-2018) 1.01 - fixed RCO to blocking assignments
//          (11-14-2018) 1.02 - fixed RCO output error 
//                                  changed file name 
//          (12-20-2020) 1.05 - changed parameter location & comments
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module cntr_udclr_nb  #(parameter n=8) (clk, clr, up, ld, D, count, rco); 
    input  clk, clr, up, ld; 
    input  [n-1:0] D; 
    output   reg [n-1:0] count; 
    output   reg rco; 

    
    always @(posedge clr, posedge clk)
    begin 
        if (clr == 1)       // asynch reset
           count <= 0;
        else if (ld == 1)   // load new value
           count <= D; 
        else if (up == 1)   // count up (increment)
           count <= count + 1; 
        else if (up == 0)   // count down (decrement)
           count <= count - 1;  
    end 
       
    
    //- handles the RCO, which is direction dependent
    always @(count, up)
    begin 
       if ( up == 1 && &count == 1'b1)
          rco = 1'b1;
       else if (up == 0 && |count == 1'b0)
          rco = 1'b1;
       else 
          rco = 1'b0; 
    end
    
endmodule
