
module shadow_memory(cache_monitor_itf.cache_monitor cache_itf);

logic [255:0] _mem [logic [31:5]];

function automatic logic [31:0] read(logic [31:0] addr);
    logic [255:0] line;
    logic [31:0] rv;
    line = _mem[addr[31:5]];
    rv = line[8*{addr[4:2], 2'b00} +: 32];
    //$display("%x   %x   %x",addr, line, rv);
    return rv;
endfunction
 int k;
function automatic void write(logic [31:0] addr, logic [31:0] wdata,
                              logic [3:0] mem_byte_enable);
    logic [255:0] line;
    line = _mem[addr[31:5]];
    //k=0;
    for (int j = 0; j < 4; ++j) begin
        if (mem_byte_enable[j])
            line[8*({addr[4:2], 2'b00} + j) +: 8] = wdata[8*j +: 8]; //k++
    end        
    _mem[addr[31:5]] = line;
endfunction


int errcount = 0;
initial begin
    logic [31:0] rdata;
    logic _read;
    $readmemh("otter_memory_blocks.mem", _mem);
    forever begin
        @(cache_itf.cmcb iff cache_itf.cmcb.read || cache_itf.cmcb.write)
        if (cache_itf.cmcb.read) begin
            rdata = read(cache_itf.cmcb.addr);
            _read = 1'b1;
        end
        else begin
            write(cache_itf.cmcb.addr, cache_itf.cmcb.wdata,
                     cache_itf.cmcb.mbe);
            _read = 1'b0;
        end
        @(cache_itf.cmcb iff cache_itf.cmcb.resp)
        //$display("%x   %x",_read, rdata);
        if (_read) begin
            if (rdata != cache_itf.cmcb.rdata) begin
                $display("%0t: ShadowCache Error: Mismatch rdata:", $time,
                    " Expected %8h, Detected: %8h", rdata,
                    cache_itf.cmcb.rdata);
                errcount++;
            end
        end

    end
end


endmodule
