
`ifndef MEM_ITF
`define MEM_ITF

interface mem_itf
#(  parameter int BURST_LEN = 32
)
(   input bit clk
);
    logic [15:0] errcode;
    logic sm_error = 1'b0;
    logic pm_error = 1'b0;
    logic halt;

    logic rst=0, mem_resp=0, mem_read, mem_write;
    logic [BURST_LEN-1:0] mem_rdata, mem_wdata;
    logic [31:0] mem_address;
    logic [3:0] mem_byte_enable;

    clocking mcb @(posedge clk);
        input mem_read, mem_write, mem_address,
              mem_wdata, mem_byte_enable, rst;
        output mem_resp, mem_rdata, pm_error;
    endclocking

    modport mem(clocking mcb);
    
    modport controller(
        input mem_resp, mem_rdata,
        output clk, rst, mem_read, mem_write, mem_address, mem_wdata, mem_byte_enable
    );
    modport device(
        output mem_resp, mem_rdata,
        input clk, rst, mem_read, mem_write, mem_address, mem_wdata, mem_byte_enable
    );

endinterface

module d_mem_itf();
endmodule

`endif