`ifndef MEMORY
`define MEMORY

module ParamMemory
#(
    parameter int DELAY_MEM,         // In Cycles
    parameter int DELAY_PAGE_HIT,    // In Cycles
    parameter int BURST_LEN,         // Integer
    parameter int CACHE_LINE_WIDTH,  // In Bits
    parameter int PAGE_SIZE,          // In Bytes
    parameter int USE_STROBE         // Binary
)
(
    mem_itf.mem itf
);

localparam int BURST_WIDTH = CACHE_LINE_WIDTH / BURST_LEN;
localparam int ADDRLEN = 32;
localparam int CARELEN = ADDRLEN - $clog2(CACHE_LINE_WIDTH / 8);
localparam logic [ADDRLEN-1:0] mask = {{(CARELEN){1'b1}},
                                       {(ADDRLEN-CARELEN){1'b0}}};

logic [CACHE_LINE_WIDTH-1:0] _mem [logic [ADDRLEN-1:0]];
int signed pageno=-1;

//Load program into memory
parameter ACTUAL_WIDTH=14;  //32KB     16K x 32
initial begin
    if(USE_STROBE)
        $readmemh("otter_memory.mem", _mem, 0, 2**ACTUAL_WIDTH-1);
    else
        $readmemh("otter_memory_blocks.mem", _mem);
end



initial begin
    int iteration = 0;
    forever begin
        @(itf.mcb iff (itf.mcb.rst || itf.mcb.mem_read || itf.mcb.mem_write))
        //$display("%d", {itf.mcb.rst, itf.mcb.mem_read, itf.mcb.mem_write});
        case ({1'b0, itf.mcb.mem_read, itf.mcb.mem_write}) //itf.mcb.rst
            3'b100, 3'b101, 3'b111, 3'b110: begin
                reset();
            end
            3'b010: memread(itf.mcb.mem_address);
            3'b001: memwrite(itf.mcb.mem_address);
            default: $error("simultaneous read/write");
        endcase
    end
end

task reset;
    if (pageno == -1)
        return;
    $display("Reset Memory");
    pageno = -1;
endtask

task automatic memread(input logic [ADDRLEN-1:0] addr);
    int signed _pageno;
    int delay;
    logic [ADDRLEN-1:0] _addr;
    logic [31:0] _read_loc;
    //$display("Read Memory");
    _addr = addr & mask;
    _read_loc = _addr / (CACHE_LINE_WIDTH / 8);
    _pageno = addr / PAGE_SIZE;
    delay = _pageno == pageno ? DELAY_PAGE_HIT : DELAY_MEM;
    pageno = _pageno;
    fork : f
        begin : error_check
            // This process simply runs some assertions at each
            // new cycle, asserting error and ending the read if any assertion
            // fails
          if(itf.mcb.mem_address < 32'h11000000) begin
            forever @(itf.mcb) begin
                read_steady: assert(itf.mcb.mem_read) else begin
                    $display(
                        "Grading Error: PMEM Read Error: Read deasserted early"
                    );
                    itf.mcb.pm_error <= 1'b1;
                    disable f;
                    break;
                end
                no_write: assert(!itf.mcb.mem_write) else begin
                    $display("Grading Error: PMEM Read Error: Write asserted");
                    itf.mcb.pm_error <= 1'b1;
                    disable f;
                    break;
                end
                addr_read_steady: assert(itf.mcb.mem_address == addr) else begin
                    $display("Grading Error: PMEM Read Error: Address changed");
                    $display("Address %8x != addr %8x", itf.mcb.mem_address, addr);
                    itf.mcb.pm_error <= 1'b1;
                    disable f;
                    break;
                end
            end
          end
        end
        begin : memreader
            // This process waits for 'duration' cycles and then does a burst
            // write.  Resp goes high during the 4 cycles the data is ready.
            //$display("%s[Memory] Read started addr=%x",0 ? $sformatf("%t: ", $time) : "", itf.mcb.mem_address);
            repeat (delay) @(itf.mcb);
            for (int i = 0; i < BURST_LEN; ++i) begin
                itf.mcb.mem_rdata <= _mem[_read_loc][BURST_WIDTH*i +: BURST_WIDTH];
                itf.mcb.mem_resp <= 1'b1;
                @(itf.mcb);
            end
            //$display("%s[Memory] Read finished addr=%x",0 ? $sformatf("%t: ", $time) : "", itf.mcb.mem_address);
            itf.mcb.mem_resp <= 1'b0;
            disable f;
        end
    join
endtask

/*
 * Do a memory write 
*/
task automatic memwrite(input logic [31:0] addr);
    // Calculate the memory latency and update that 'charged' memory data
    int signed _pageno;
    int delay;
    logic [31:0] _addr;
    logic [31:0] _read_loc;
    _addr = addr & mask;
    _read_loc = _addr / (CACHE_LINE_WIDTH / 8);
    _pageno = addr / PAGE_SIZE;
    delay = _pageno == pageno ? DELAY_PAGE_HIT : DELAY_MEM;
    pageno = _pageno;

    fork : f
        begin : error_check
            // This process simply runs some assertions at each
            // new cycle, asserting error and ending the read if any assertion
            // fails
            forever @(itf.mcb) begin
                write_steady: assert(itf.mcb.mem_write) else begin
                    $display("PMEM Write Error: Write deasserted early\n");
                    itf.mcb.pm_error <= 1'b1;
                    disable f;
                    break;
                end
                no_read: assert(!itf.mcb.mem_read) else begin
                    $display("PMEM Write Error: Read asserted\n");
                    itf.mcb.pm_error <= 1'b1;
                    disable f;
                    break;
                end
                addr_write_steady: assert(itf.mcb.mem_address == addr) else begin
                    $display("PMEM Write Error: Address changed\n");
                    $display("Address %8x != addr %8x", itf.mcb.mem_address, addr);
                    itf.mcb.pm_error <= 1'b1;
                    disable f;
                    break;
                end
            end
        end
        begin : memwrite
            // This process waits for 'duration' cycles and then does a burst
            // write.  Resp goes high the cycle before the first write is
            // done, so the writer must be careful about this point
            repeat (delay) @(itf.mcb);
            //$display("%s[Memory] Write started addr=%x",0 ? $sformatf("%t: ", $time) : "", itf.mcb.mem_address);
            for (int i = 0; i < BURST_LEN; ++i) begin
                itf.mcb.mem_resp <= 1'b1;
                @(itf.mcb);
                if(USE_STROBE) begin
                    //int k=0;
                    for (int j = 0; j < 4; ++j) begin
                        if (itf.mcb.mem_byte_enable[j])
                            _mem[_read_loc][8*j +: 8] = itf.mcb.mem_wdata[8*j +: 8];    //k++
                    end
                end
                else
                    _mem[_read_loc][BURST_WIDTH*i +: BURST_WIDTH] = itf.mcb.mem_wdata;
            end
            itf.mcb.mem_resp <= 1'b0;
            //$display("%s[Memory] Write finished addr=%x",0 ? $sformatf("%t: ", $time) : "", itf.mcb.mem_address);
            disable f;
        end
    join
endtask
endmodule

`endif