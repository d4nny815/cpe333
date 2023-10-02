`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: J. Calllenes
//           P. Hummel
// 
// Create Date: 01/20/2019 10:36:50 AM
// Design Name: 
// Module Name: OTTER_Wrapper 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// v 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module OTTER_Wrapper(
   input clk, 
   input BTNL,
   input BTNC,
   input [15:0] switches,
   output logic [15:0] leds,
   output [7:0] segs,
   output [3:0] an

   );
       
    //   logic sclk =0;
    // INPUT PORT IDS ////////////////////////////////////////////////////////
    // Right now, the only possible inputs are the switches
    // In future labs you can add more MMIO, and you'll have
    // to add constants here for the mux below
    localparam SWITCHES_AD = 32'h11000000;
    localparam VGA_READ_AD = 32'h11040000;
           
    // OUTPUT PORT IDS ///////////////////////////////////////////////////////
    // In future labs you can add more MMIO
    localparam LEDS_AD      = 32'h11080000;
    localparam SSEG_AD     = 32'h110C0000;      
    
   // Signals for connecting OTTER_MCU to OTTER_wrapper /////////////////////////
   logic s_interrupt, keyboard_int,btn_int;
   logic s_reset,s_load;
   logic sclk = 1'b0;   
   
 
   logic [15:0]  r_SSEG;// = 16'h0000;
     
   logic [31:0] IOBUS_out,IOBUS_in,IOBUS_addr;
   logic IOBUS_wr;
   
   assign s_interrupt = keyboard_int | btn_int;
   
   wire ss_clk;
   clk_2n_div_test #(.n(3)) MY_DIV (
    .clockin   (clk), 
    .fclk_only (1),          
    .clockout  (ss_clk)   );  
   
    // Declare OTTER_CPU ///////////////////////////////////////////////////////
   OTTER_MCU MCU (.RST(s_reset),.intr(s_interrupt), .clk(ss_clk), 
                   .iobus_out(IOBUS_out),.iobus_in(IOBUS_in),.iobus_addr(IOBUS_addr),.iobus_wr(IOBUS_wr));

   // Declare Seven Segment Display /////////////////////////////////////////
   SevSegDisp SSG_DISP (.DATA_IN(r_SSEG), .CLK(clk), .MODE(1'b0),
                       .CATHODES(segs), .ANODES(an));
   
                           
   // Clock Divider to create 50 MHz Clock /////////////////////////////////
   always_ff @(posedge clk) begin
       sclk <= ~sclk;
   end 
   
    // Connect Signals ////////////////////////////////////////////////////////////
   assign s_reset = BTNC;
   
   //assign LEDS[15]=keyboard_int;
   // Connect Board peripherals (Memory Mapped IO devices) to IOBUS /////////////////////////////////////////
    always_ff @ (posedge sclk)
    begin
        if(IOBUS_wr)
            case(IOBUS_addr)
                LEDS_AD: leds <= IOBUS_out;    
                SSEG_AD: r_SSEG <= IOBUS_out[15:0];
            endcase
    end
   
    always_comb
    begin
        IOBUS_in=32'b0;
        case(IOBUS_addr)
            SWITCHES_AD: IOBUS_in[15:0] = switches;
            default: IOBUS_in=32'b0;
        endcase
    end
   endmodule
