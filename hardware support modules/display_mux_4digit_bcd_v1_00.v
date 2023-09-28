`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 11/10/2019 11:24:26 AM
// Design Name: 
// Module Name: display_mux_4_BCD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Display multiplexor for the simultaneous display of 
//              4 BCD values
// 
// Dependencies:  
//
// Instantiation Template:
//
//   display_mux_4_BCD  my_disp_mux(
//     .bcd0 (my_bcd0),
//     .bcd1 (my_bcd1),
//     .bcd2 (my_bcd2),
//     .bcd3 (my_bcd3),
//     .clk  (my_clk),
//     .seg  (my_seg),
//     .an   (my_an)    );
// 
// Revision:
// Revision 1.00 - File Created
//
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module display_mux_4_BCD(
    input [3:0] bcd0,
    input [3:0] bcd1,
    input [3:0] bcd2,
    input [3:0] bcd3,
    input clk,
    output reg [7:0] seg,
    output reg [3:0] an
    );
    
    //-- internal signals -----------------------------  
    reg [3:0] s_bcd_disp;  // output of BCD MUX
     
    reg [13:0] r_count;    // reg for clock divider
    reg [1:0] r_counter;   // reg for counter 
    wire s_slow_clk;       // divided clock 
    //--------------------------------------------------
       
    //- standard decoder for display multiplex 1-cold output
    always @ (*)
    begin
       case (r_counter)
          0: an = 4'b1110;  
          1: an = 4'b1101; 
          2: an = 4'b1011;
          3: an = 4'b0111;
          default an = 4'b1111; 
       endcase 
    end 
   
    // clock divider 
    always@(posedge clk) 
    begin 
        r_count <= r_count + 1; 
    end 
    assign s_slow_clk = r_count[13];
 
    
    // 2-bit counter to drive selects
    always @(posedge s_slow_clk)
    begin 
         r_counter <= r_counter + 1; 
    end
                    
    // 4:1 MUX that handles BCD input values
    always @ (*)
    begin 
       if      (r_counter == 2'b00)  s_bcd_disp = bcd0;
       else if (r_counter == 2'b01)  s_bcd_disp = bcd1; 
       else if (r_counter == 2'b10)  s_bcd_disp = bcd2; 
       else if (r_counter == 2'b11)  s_bcd_disp = bcd3; 
       else                          s_bcd_disp = 4'b1111; 
    end                        

    //- BCD-to-7 seg decoder for display multiplex
    always @ (*)
    begin
       case (s_bcd_disp)
          4'b0000: seg = 8'h03;  //  0
          4'b0001: seg = 8'h9F;  //  1
          4'b0010: seg = 8'h25;  //  2
          4'b0011: seg = 8'h0D;  //  3
          4'b0100: seg = 8'h99;  //  4
          4'b0101: seg = 8'h49;  //  5
          4'b0110: seg = 8'h41;  //  6
          4'b0111: seg = 8'h1F;  //  7
          4'b1000: seg = 8'h01;  //  8
          4'b1001: seg = 8'h09;  //  9
          4'b1010: seg = 8'h11;  //  A
          4'b1011: seg = 8'hC1;  //  b
          4'b1100: seg = 8'hE5;  //  c
          4'b1101: seg = 8'h85;  //  d
          4'b1110: seg = 8'h61;  //  E
          4'b1111: seg = 8'h71;  //  F  
          default  seg = 8'hFF; 
       endcase 
    end                                        
             
endmodule
