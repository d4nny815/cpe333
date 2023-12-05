/* MODIFY. Your cache design. It contains the cache
controller, cache datapath, and bus adapter. */

module cache #(
    parameter s_offset = 5,
    parameter s_index  = 3,
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index
)
(
    mem_itf.device cpu_itf,
    mem_itf.controller ca_itf

);


cache_control control(.*);

cache_datapath datapath(.*);


//Sample code to convert CPU bus requests (32-bit data) to cache signals (mostly 256-bit data)

//assign mem_wdata256 = {8{mem_wdata}};   	//Cache write data <-  from CPU wdata	
//assign mem_rdata = mem_rdata256[(32*address[4:2]) +: 32];		//CPU rdata <-  from cache line read (rdata256)
//assign mem_byte_enable256 = {28'h0, mem_byte_enable} << (address[4:2]*4);	//byte enable mask to data_arary in cache  //32bit Cache write enable <- 4-bit CPU strobe (byte enable) 


endmodule : cache
