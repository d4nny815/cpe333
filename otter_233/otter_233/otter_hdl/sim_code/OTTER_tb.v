`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer:  James Ratner
// 
// Create Date: 01/07/2020 12:59:51 PM
// Design Name: 
// Module Name: Ex6_6_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench file for Exp 6
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module otter_tb(); 
   // INPUTS
   reg [15:0] switches; 
   reg [4:0] buttons;
   reg clk; 

   // OUTPUTS
   wire [15:0] leds;  
   wire [7:0] segs; 
   wire [3:0] an; 
   wire Hsync, Vsync;
   wire [3:0] vgaRed, vgaGreen, vgaBlue;

   OTTER_Wrapper my_wrapper(   
     .clk         (clk),              
     .buttons     (buttons),  
     .switches    (switches), 
     .leds        (leds),
     .segs        (segs), 
     .an          (an),
     .Hsync       (Hsync),
     .Vsync       (Vsync),
     .vgaRed      (vgaRed), 
     .vgaGreen    (vgaGreen), 
     .vgaBlue     (vgaBlue)    
    );

  
  //- Generate periodic clock signal    
   initial    
      begin       
         clk = 0;   //- init signal        
         forever  #5 clk = ~clk;    
      end                        
         
   initial        
   begin           
      switches = 0; buttons = 0;
      #1000;
      
      buttons = 5'b10000;
      #30
      buttons = 0;
      #400;
      buttons = 5'b10000;
      #30
      buttons = 0;
      #400;
      buttons = 5'b10000;
      #30
      buttons = 0;
      #400;
      buttons = 5'b10000;
      #30
      buttons = 0;
      #400;
      $finish;
    end

endmodule
