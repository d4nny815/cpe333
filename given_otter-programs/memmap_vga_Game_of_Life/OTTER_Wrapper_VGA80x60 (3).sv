`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: J. Callenes
// 
// Create Date: 01/20/2019 10:36:50 AM
// Design Name: 
// Module Name: OTTER_Wrapper_VGA80x60
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Revision 0.10 - (J. Callenes) Revised clock divider. Changed IOBUS interface to
//                 use MCU clock.
// Revision 0.20 - (Keefe Johnson) Revised signal widths for 80x60 VGA.
//                 Initialized LEDs for simulation. Renamed clocks for clarity.
//                 Other minor style tweaks.
// Revision 0.30 - (Keefe Johnson) Changed VGA framebuffer to a memory-mapped
//                 range instead of separate registered addr/data ports.  
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module OTTER_Wrapper_VGA80x60(
    input CLK_100MHz,
    input BTNL,
    input BTNC,
    input [15:0] SWITCHES,
    output [15:0] LEDS,
    output [7:0] CATHODES,
    output [3:0] ANODES,
    output [7:0] VGA_RGB,
    output VGA_HS,
    output VGA_VS
    );
        
    // INPUT PORT IDS ////////////////////////////////////////////////////////////
    // Right now, the only possible inputs are the switches
    // In future labs you can add more MMIO, and you'll have
    // to add constants here for the mux below
    localparam SWITCHES_AD  = 32'h11000000;
      
    // OUTPUT PORT IDS ///////////////////////////////////////////////////////////
    // In future labs you can add more MMIO
    localparam LEDS_AD      = 32'h11080000;
    localparam SSEG_AD      = 32'h110C0000;

    // VGA ADDRESS RANGE /////////////////////////////////////////////////////////
    localparam VGA_RANGE_AD = 32'h20000000;  // starting address
    localparam VGA_AD_BITS = 13;             // end address = start + 2^bits
       
    // Signals for connecting OTTER_MCU to OTTER_wrapper /////////////////////////
    logic s_interrupt;
    logic s_reset, s_load;
    logic CLK_50MHz = 0;
   
    // Signals for connecting VGA Framebuffer Driver /////////////////////////////
    logic r_vga_we;                    // write enable
    logic [VGA_AD_BITS-1:0] r_vga_wa;  // address of framebuffer to read/write
    logic [7:0] r_vga_wd;              // pixel color data to write to framebuffer
    logic [7:0] r_vga_rd;              // pixel color data read from framebuffer
 
    logic [15:0] r_SSEG = '0;
    logic [15:0] r_LEDS = '0;
    logic [31:0] IOBUS_out, IOBUS_in, IOBUS_addr;
    logic IOBUS_wr;

    // Declare OTTER_CPU /////////////////////////////////////////////////////////
    OTTER_MCU MCU(.RESET(s_reset), .INTR(s_interrupt), .CLK(CLK_50MHz), 
                  .IOBUS_OUT(IOBUS_out), .IOBUS_IN(IOBUS_in),
                  .IOBUS_ADDR(IOBUS_addr), .IOBUS_WR(IOBUS_wr));

    // Declare Seven Segment Display /////////////////////////////////////////////
    SevSegDisp SSG_DISP(.DATA_IN(r_SSEG), .CLK(CLK_100MHz), .MODE(1'b0),
                        .CATHODES(CATHODES), .ANODES(ANODES));
   
    // Declare Debouncer One Shot ////////////////////////////////////////////////
    debounce_one_shot DB(.CLK(CLK_50MHz), .BTN(BTNL), .DB_BTN(s_interrupt));
   
    // Declare VGA Frame Buffer //////////////////////////////////////////////////
    vga_fb_driver_80x60 VGA(.CLK_50MHz(CLK_50MHz), .WA(r_vga_wa), .WD(r_vga_wd),
                            .WE(r_vga_we), .RD(r_vga_rd), .ROUT(VGA_RGB[7:5]),
                            .GOUT(VGA_RGB[4:2]), .BOUT(VGA_RGB[1:0]),
                            .HS(VGA_HS), .VS(VGA_VS));
   
    // Clock Divider to create 50 MHz Clock //////////////////////////////////////
    always_ff @(posedge CLK_100MHz) begin
        CLK_50MHz <= ~CLK_50MHz;
    end

    // Connect Signals ///////////////////////////////////////////////////////////
    assign s_reset = BTNC;
    assign LEDS = r_LEDS;
   
    // Connect Board peripherals (Memory Mapped IO devices) to IOBUS /////////////
    // outputs
    always_ff @(posedge CLK_50MHz) begin
        r_vga_we <= 0;
        if (IOBUS_wr) begin
            if (IOBUS_addr[31:VGA_AD_BITS] == VGA_RANGE_AD[31:VGA_AD_BITS]) begin
                r_vga_we <= 1;
            end else begin
                case (IOBUS_addr)
                    LEDS_AD: begin
                        r_LEDS <= IOBUS_out[15:0];
                    end    
                    SSEG_AD: begin
                        r_SSEG <= IOBUS_out[15:0];
                    end
                endcase
            end
        end
    end
    // inputs
    always_comb begin
        IOBUS_in = 0;
        r_vga_wa <= IOBUS_addr[VGA_AD_BITS-1:0];
        r_vga_wd <= IOBUS_out[7:0];
        if (IOBUS_addr[31:VGA_AD_BITS] == VGA_RANGE_AD[31:VGA_AD_BITS]) begin
            IOBUS_in[7:0] = r_vga_rd;
        end else begin
            case (IOBUS_addr)
                SWITCHES_AD: begin
                    IOBUS_in[15:0] = SWITCHES;
                end
            endcase
        end
    end

endmodule
