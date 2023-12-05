
module lab2_tb;

timeunit 1ns;
timeprecision 1ns;

//parameter DISPLAY_TIME = 0;  // 1 to include timestamps in log, 0 to omit them

bit CLK;
always #5 CLK = (CLK === 1'b0);

logic BTNL,BTNC;
logic [15:0] SWITCHES=0,LEDS;
logic [7:0] CATHODES,VGA_RGB;
logic [3:0] ANODES;
  
OTTER_Wrapper dut (.*);


// Initial Reset
initial begin
    BTNC = 1'b1;
    repeat (5) @(posedge CLK);
    BTNC = 1'b0;
end


/*********************************************************************************************************/
// Shadow memory for debugging memory hierarchy
    cache_monitor_itf cache_itf(CLK);
    assign cache_itf.addr = dut.MCU.memory.mem.itf.mem_address;
    assign cache_itf.rdata = dut.MCU.memory.mem.itf.mem_rdata;
    assign cache_itf.wdata = dut.MCU.memory.mem.itf.mem_wdata;
    assign cache_itf.read = dut.MCU.memory.mem.itf.mem_read;
    assign cache_itf.write = dut.MCU.memory.mem.itf.mem_write;
    assign cache_itf.mbe = dut.MCU.memory.mem.strobe;
    assign cache_itf.resp = dut.MCU.memory.mem.itf.mem_resp;
    
    shadow_memory sm(cache_itf);
    
/*********************************************************************************************************/
//RISCV ISA Monitor - todo: formal verification
logic commit;
assign commit = dut.MCU.pcWrite;
logic [63:0] order;
initial order = 0;
logic [3:0] mem_rmask;
logic [31:0] mem_addr, ld_addr;
always @(posedge CLK iff commit) order <= order + 1;
always @(posedge CLK) mem_rmask <= dut.MCU.memory.mem.strobe;//dut.MCU.memory.rmask; //
  
logic [15:0] errcode;

riscv_formal_monitor_rv32i monitor(
    .clock(CLK),
    .reset(BTNC),
    .rvfi_valid(commit),
    .rvfi_order(order),
    .rvfi_insn(dut.MCU.IR),
    .rvfi_trap(1'b0), //dut.MCU.OTTER_CU_DECODER.trap),
    .rvfi_halt(1'b0),
    .rvfi_intr(1'b0),
    .rvfi_mode(2'b00),
    .rvfi_rs1_addr(dut.MCU.RF.Read1),
    .rvfi_rs2_addr(dut.MCU.RF.Read2),
    .rvfi_rs1_rdata(dut.MCU.RF.Data1),
    .rvfi_rs2_rdata(dut.MCU.RF.Data2),
    .rvfi_rd_addr(dut.MCU.regWrite ? dut.MCU.RF.WriteReg : 5'b0),
    .rvfi_rd_wdata((dut.MCU.regWrite && dut.MCU.RF.WriteReg!=5'b0)  ? dut.MCU.RF.WriteData : 32'b0),
    .rvfi_pc_rdata(dut.MCU.PC.PC_COUNT),
    .rvfi_pc_wdata(dut.MCU.PC.PC_DIN),
    // NOTE: mem_addr should be byte or 4-byte aligned
    //       memory address for all loads and stores (including fetches)
    .rvfi_mem_addr(dut.MCU.memory.mem.itf.mem_address & ~(32'h3)),   //addresses are word aligned for rvfi 
    .rvfi_mem_rmask(mem_rmask),
    .rvfi_mem_wmask(dut.MCU.memory.mem.strobe),
    .rvfi_mem_rdata(dut.MCU.memory.mem.itf.mem_rdata),//dut.MCU.memory.MEM_DOUT2), //
    .rvfi_mem_wdata(dut.MCU.memory.mem.itf.mem_wdata),
    .rvfi_mem_extamo(1'b0),
    .errcode(errcode)
);
endmodule : lab2_tb
