`timescale 1ns / 1ps

module test_memory();
    reg clk, we, re1, re2, reset;
    reg [15:2] addr1; 
    reg [31:0] addr2, din2;
    wire [31:0] dout1, dout2;
    wire memValid1, memValid2;
    MemoryWrapper DUT (
        .RST        (reset),
        .MEM_CLK    (clk),
        .MEM_RDEN1  (re1),    
        .MEM_RDEN2  (re2),
        .MEM_WE2    (we),       
        .MEM_ADDR1  (addr1), 
        .MEM_ADDR2  (addr2),
        .MEM_DIN2   (din2),
        .MEM_SIZE   (2'b10),
        .MEM_SIGN   (1'b1),      
        .IO_IN      (32'b0),   
        .IO_WR      (),    
        .MEM_DOUT1  (dout1),
        .MEM_DOUT2  (dout2),
        .memValid1  (memValid1),
        .memValid2  (memValid2)
    ); 
    always begin
    #5 clk = ~clk; 
    end  

    initial begin
        clk = 0; we = 0; re1 = 0; re2 = 0; din2 = 32'b0; addr2 = 32'b0; addr1 = 14'b0; reset = 1;
        #16;
        reset = 0;
        #5;
        addr1 = 14'b1;
        re1 = 1;
        #150;
        addr1 = 14'b10;
        re1 = 0;
        #400;
        $finish;
    end

endmodule
