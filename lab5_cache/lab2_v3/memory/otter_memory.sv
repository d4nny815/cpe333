`timescale 1ns / 1ps

module OTTER_memory(
    MEM_CLK,MEM_ADDR1,MEM_ADDR2,MEM_DIN2,MEM_WRITE2,MEM_READ1,MEM_READ2,ERR,MEM_DOUT1,MEM_DOUT2,IO_IN,IO_WR,MEM_SIZE,MEM_SIGN,
    MEM_VALID1, MEM_VALID2, rst 
    );
  
    input [31:0] MEM_ADDR1;     //Instruction Memory Port
    input [31:0] MEM_ADDR2;     //Data Memory Port
    input MEM_CLK;
    input [31:0] MEM_DIN2;
    input MEM_WRITE2;
    input MEM_READ1;
    input MEM_READ2;
    output logic [31:0] MEM_DOUT1;
    output logic [31:0] MEM_DOUT2;
    output logic MEM_VALID1;    //Response from memory to CPU, goes high for one cycle, once output data is valid
    output logic MEM_VALID2;
    input logic rst;
    
    input [1:0] MEM_SIZE;
    input MEM_SIGN;
    
    input [31:0] IO_IN;
    output logic IO_WR;
    output ERR;

    // Internal signals
    logic [31:0] ioIn_buffer=0;
    logic memWrite2;
    logic [31:0] memOut2;
    logic [31:0] memOut2_sliced=32'b0;
    logic [3:0] strobe;  //byte enable for word
    logic mem_valid2, mmio_mem_valid2, mem_read2,mem_write2;
    
    
    //logic [3:0] rmask;  //for rvfi using non-word aligned addresses
    logic [31:0] wdata;
        
    always_comb
    begin
        strobe=4'd0;
        wdata=32'd0;  
        if(MEM_READ1 | MEM_READ2 | MEM_WRITE2)
            case(MEM_SIZE)
                    0:  begin   strobe = 4'b1 << MEM_ADDR2[1:0];   //sb
                                wdata= MEM_DIN2 << 8*MEM_ADDR2[1:0];
                                end
                    1:  begin   strobe= 4'b0011 << MEM_ADDR2[1:0];  //sh      //Not supported if across word boundary
                                wdata= MEM_DIN2 << 8*MEM_ADDR2[1:0];
                                end
                    2:  begin   strobe= 4'b1111;                    //sw        //Not supported if across word boundary
                                wdata= MEM_DIN2;
                                end
                    default: strobe=4'b0000;
            endcase
    end 
/**************************************************************************************************************/

memory_wrapper mem( .MEM_CLK(MEM_CLK),
                    .MEM_ADDR1(MEM_ADDR1),
                    .MEM_ADDR2(MEM_ADDR2),
                    .MEM_DIN2(wdata),    
                    .MEM_WRITE2(mem_write2),
                    .MEM_READ1(MEM_READ1),
                    .MEM_READ2(mem_read2),
                    .MEM_DOUT1(MEM_DOUT1),
                    .MEM_DOUT2(memOut2),
                    .strobe(strobe),
                    .mem_valid1(MEM_VALID1),
                    .mem_valid2(mem_valid2), //Memory_wrapper provides 4 bytes (slicing occurs below)
                    .rst(rst));       
                    
                    assign MEM_VALID2 = mem_valid2 | mmio_mem_valid2;

/**************************************************************************************************************/
    //Load generation (slicing) 
    logic [31:0] memOut2_sliced=32'b0;
       
    always_comb
    begin
            memOut2_sliced=32'b0;

            case({MEM_SIGN,MEM_SIZE})
                0: case(MEM_ADDR2[1:0])
                        3:  memOut2_sliced = {{24{memOut2[31]}},memOut2[31:24]};      //lb     //endianess
                        2:  memOut2_sliced = {{24{memOut2[23]}},memOut2[23:16]};
                        1:  memOut2_sliced = {{24{memOut2[15]}},memOut2[15:8]};
                        0:  memOut2_sliced = {{24{memOut2[7]}},memOut2[7:0]};
                   endcase
                        
                1: case(MEM_ADDR2[1:0])
                        3: memOut2_sliced = {{16{memOut2[31]}},memOut2[31:24]};      //lh   //spans two words, NOT YET SUPPORTED!
                        2: memOut2_sliced = {{16{memOut2[31]}},memOut2[31:16]};
                        1: memOut2_sliced = {{16{memOut2[23]}},memOut2[23:8]};
                        0: memOut2_sliced = {{16{memOut2[15]}},memOut2[15:0]};
                   endcase
                2: case(MEM_ADDR2[1:0])
                        1: memOut2_sliced = memOut2[31:8];   //spans two words, NOT YET SUPPORTED!
                        0: memOut2_sliced = memOut2;      //lw     
                   endcase
                4: case(MEM_ADDR2[1:0])
                        3:  memOut2_sliced = {24'd0,memOut2[31:24]};      //lbu
                        2:  memOut2_sliced = {24'd0,memOut2[23:16]};
                        1:  memOut2_sliced = {24'd0,memOut2[15:8]};
                        0:  memOut2_sliced = {24'd0,memOut2[7:0]};
                   endcase
                5: case(MEM_ADDR2[1:0])
                        3: memOut2_sliced = {16'd0,memOut2};      //lhu //spans two words, NOT YET SUPPORTED!
                        2: memOut2_sliced = {16'd0,memOut2[31:16]};
                        1: memOut2_sliced = {16'd0,memOut2[23:8]};
                        0: memOut2_sliced = {16'd0,memOut2[15:0]};
                   endcase
            endcase
    end
/**************************************************************************************************************/
    //Memory Mapped I/O Switching
    always_ff @(posedge MEM_CLK)
        if(MEM_READ2)
            ioIn_buffer<=IO_IN;    

    always_comb
    begin
        IO_WR=0;
        if(MEM_ADDR2 >= 32'h11000000)
        begin       
            if(MEM_WRITE2) IO_WR = 1;
            memWrite2=0;
            MEM_DOUT2 = ioIn_buffer;
            mmio_mem_valid2=1;  
            mem_read2=0;
            mem_write2=0;
        end
        else begin 
            memWrite2=MEM_WRITE2;
            MEM_DOUT2 = memOut2_sliced;
            mmio_mem_valid2=0;
            mem_read2=MEM_READ2;
            mem_write2=MEM_WRITE2;
        end    
    end 
 
endmodule
