`timescale 1ns / 1ps

parameter DISPLAY_TIME = 0;  // 1 to include timestamps in log, 0 to omit them

module cache_testbench();
    timeunit 1ns;
    timeprecision 1ns;

    parameter s_offset = 5;
    parameter s_index  = 3;
    parameter s_tag    = 32 - s_offset - s_index;
    parameter s_mask   = 2**s_offset;
    parameter s_line   = 8*s_mask;
    parameter num_sets = 2**s_index;

    localparam TAG_MSB = 32 - 1; 
    localparam TAG_LSB = s_offset + s_index; 
    localparam INDEX_MSB = s_offset + s_index -1; 
    localparam INDEX_LSB = s_offset; 
    localparam OFFSET_MSB = s_offset - 1;
    localparam OFFSET_LSB = 0;

    logic MEM_CLK = 1; always #5 MEM_CLK = ~MEM_CLK;
    default clocking cb @(posedge MEM_CLK); endclocking
    
    // Initial Reset
    initial begin
        itf.rst = 1'b1;
        repeat (50) @(posedge MEM_CLK);
        itf.rst = 1'b0;
    end
    
    mem_itf itf(MEM_CLK);               //BUS between the CPU and Cache
    mem_itf #(256) ca_itf(MEM_CLK);     //BUS between the Cache and Cache Adapter      
    mem_itf #(32) pmem_itf(MEM_CLK);    //BUS between the Cache Adapter and Physical Memory
    
    cache cache(itf, ca_itf);
    cacheline_adaptor cacheline_adaptor(ca_itf, pmem_itf);
    ParamMemory #(25, 13, 8, 256, 512,0) memory(pmem_itf);  

/*********************************************************************************************************/
// Shadow memory for debugging memory hierarchy
    cache_monitor_itf cache_itf(MEM_CLK);
    assign cache_itf.addr = itf.mem_address;
    assign cache_itf.rdata = itf.mem_rdata;
    assign cache_itf.wdata = itf.mem_wdata;
    assign cache_itf.read = itf.mem_read;
    assign cache_itf.write = itf.mem_write;
    assign cache_itf.mbe = itf.mem_byte_enable;
    assign cache_itf.resp = itf.mem_resp;
    
    shadow_memory sm(cache_itf);
/*********************************************************************************************************/


    initial begin
        $timeformat(-9, 3, "ns", 10);
        
        // for debugging, use Z when the cache shouldn't depend on the signals
        itf.mem_address = '0; //'Z;  
        itf.mem_wdata = '0; //'Z;   
        itf.mem_write = '0; 
        itf.mem_read = '0;
        itf.mem_byte_enable ='0;
                         
        ##50;
        
        // initialize ram to specific random values to make the output more deterministic and diffable
        memory._mem['h00000000] = 'h13034532c7e5f97b670c05dea9c9564efec775ff55a9dd724a0a1c2147591908;
        memory._mem['h91A1] = 'hcd370c746125789acfd8c0243e13869ae1e67808ae6f8be1815144380d6c646f;
        memory._mem['h91A5] = 'h00bda3ec4296002562fa5d0898c7468f9c3d9ae901882fab93c404be0bdbb521;
        memory._mem['h91A6] = 'h67b53e7aded9f2e3388eb7b3d36c8a52036e98d19ce86d2a1cc2ec1bd83ae7ca;
        memory._mem['h21909] = 'h0f3c81c7c4855cd585afa4c7d73820ce1c1b0efe2711e4ffba451810b68bdf25;
        memory._mem['h2190A] = 'hb6ac6d4a6d3067e6153e20f2a441c948f2b2e0f987d9525eb41cf22b8462b637;
        memory._mem['h2190D] = 'h98394999d192929572191632a67ac8f537901af9ca58f111f54535243025e5a2;
        memory._mem['h2190E] = 'hb292fd916b500a6a68fa07b6f9b4ce3fe4e2763bda6b06754f67aaf0037df79d;
        memory._mem['h219092] = 'h066dbf9b977525848e28650498681af101030f7759c9cb85ccea04038e9b72c7;
        memory._mem['h43B29] = 'h543282ac391423e8cc9762d295ad3223d036d05fda48ff9a06a4e90f98289334;
        memory._mem['h43B2A] = 'h67774bc6f8c283b09dea67c0e78e64827910d22b9ee5585699fe9219512566b0;
        memory._mem['h43B2D] = 'hacb5bcb5ea216092ead593b450b66ed0895e52e9eb762b1d41c4c2ba92dd302a;
        memory._mem['h43B2E] = 'hb772b61e95da9f234da945bc62d9d5f574f49706183b568d40ba688766ea5dc9;
        
        sm._mem['h00000000] = memory._mem['h00000000];
        sm._mem['h91A1] = memory._mem['h91A1];
        sm._mem['h91A5] = memory._mem['h91A5];
        sm._mem['h91A6] = memory._mem['h91A6];
        sm._mem['h21909] = memory._mem['h21909];
        sm._mem['h2190A] = memory._mem['h2190A];
        sm._mem['h2190D] = memory._mem['h2190D];
        sm._mem['h2190E] = memory._mem['h2190E];
        sm._mem['h219092] = memory._mem['h219092]; 
        sm._mem['h43B29] = memory._mem['h43B29];
        sm._mem['h43B2A] = memory._mem['h43B2A];    
        sm._mem['h43B2D] = memory._mem['h43B2D];
        sm._mem['h43B2E] = memory._mem['h43B2E];


        $display("%s==== (checking invalid tag match) Read, cold-start miss (allocate, block now valid and clean) ==================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
        read_dcache('h00000, 'h00, 'h0);
        ##50;

        // run tests first with delays, then without        
        for (int i = 0; i < 2; i++) begin

            if (i == 0) begin
                $display("%s================ Testing various cases, with delays between ====================================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            end else begin
                $display("%s================ Testing various cases, with no delays between, and partial-word writes ========================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            end
    
            $display("%s==== Read, cold-start miss (allocate, block now valid and clean) ===============================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            read_dcache('h01234, 'h01 + i * 4, 'h0);
            if (i == 0) ##50;
            
            $display("%s==== Write, cold-start miss (allocate then update, block now valid and dirty) ==================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            write_dcache('h01234, 'h02 + i * 4, 'h1, i == 0 ? 'b1111 : 'b1100, 'haabbccdd);
            if (i == 0) ##50;
    
            $display("%s==== Read, hit, clean block (block still clean) ================================================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            read_dcache('h01234, 'h01 + i * 4, 'h2);
            if (i == 0) ##50;
    
            $display("%s==== Read, hit, dirty block (block still dirty) ================================================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            read_dcache('h01234, 'h02 + i * 4, 'h3);
            if (i == 0) ##50;

            $display("%s==== Read, conflict miss, clean block (allocate, block still clean) ============================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            read_dcache('h04321, 'h01 + i * 4, 'h0);
            if (i == 0) ##50;
    
            $display("%s==== Read, conflict miss, dirty block (write back then allocate, block now clean) ==============================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            read_dcache('h04321, 'h02 + i * 4, 'h1);
            if (i == 0) ##50;
    
            $display("%s==== Write, hit, clean block (update, block now dirty) =========================================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            write_dcache('h04321, 'h01 + i * 4, 'h2, i == 0 ? 'b1111 : 'b0011, 'hbbccddee);
            if (i == 0) ##50;
    
            $display("%s==== Write, hit, dirty block (update, block still dirty) =======================================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            write_dcache('h04321, 'h01 + i * 4, 'h3, i == 0 ? 'b1111 : 'b1000, 'hccddeeff);
            if (i == 0) ##50;
    
            $display("%s==== Write, conflict miss, clean block (allocate then update, block now dirty) =================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            write_dcache('h05678, 'h02 + i * 4, 'h0, i == 0 ? 'b1111 : 'b0100, 'hddeeffaa);
            if (i == 0) ##50;
    
            $display("%s==== Write, conflict miss, dirty block (write back then allocate then update, block still dirty) ===============", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            write_dcache('h05678, 'h01 + i * 4, 'h1, i == 0 ? 'b1111 : 'b0010, 'heeffaabb);
            if (i == 0) ##50;
    
            $display("%s==== (verifying state) Read, conflict miss, dirty block (write back then allocate, block now clean) ============", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            read_dcache('h08765, 'h01 + i * 4, 'h2);
            if (i == 0) ##50;
    
            $display("%s==== (verifying state) Read, conflict miss, dirty block (write back then allocate, block now clean) ============", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
            read_dcache('h08765, 'h02 + i * 4, 'h3);
            if (i == 0) ##50;

        end

        $display("%s================ DONE ==========================================================================================", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
        ##50;
        $finish();
    end
    
     task automatic read_dcache(
        input [TAG_MSB:TAG_LSB] tag,
        input [INDEX_MSB:INDEX_LSB] index,
        input [OFFSET_MSB:OFFSET_LSB] offset
        );
        itf.mem_write <=0;
        itf.mem_read <=0;
         
        @(itf.mcb  iff !itf.mem_resp);
        
        itf.mem_address <= {tag,index,offset};
        itf.mem_read <= 1;
        @(itf.mcb)  
        $display("%s[CPU] read addr=%x ", DISPLAY_TIME ? $sformatf("%t: ", $time) : "",itf.mem_address);

        @(itf.mcb iff itf.mem_resp)
        //@(itf.mcb)  
        $display("%s[CPU] got data=%x", DISPLAY_TIME ? $sformatf("%t: ", $time) : "", itf.mem_rdata);
   
        itf.mem_address <= '0;//'Z;
        itf.mem_read <= '0;  
    endtask

    task automatic write_dcache(
        input [TAG_MSB:TAG_LSB] tag,
        input [INDEX_MSB:INDEX_LSB] index,
        input [OFFSET_MSB:OFFSET_LSB] offset,
        input [3:0] byte_enable,
        input [31:0] data
        );
        
        itf.mem_write <= 0;
        @(itf.mcb  iff !itf.mem_resp);
        itf.mem_write <= 1;
        itf.mem_address <= {tag, index, offset};
        itf.mem_byte_enable <= byte_enable;
        itf.mem_wdata <= data;
        @(itf.mcb)  
        $display("%s[CPU] write addr=%x with data=%x, strobe=%x", DISPLAY_TIME ? $sformatf("%t: ", $time) : "",
                itf.mem_address,itf.mem_wdata, itf.mem_byte_enable);
   
        @(itf.mcb  iff itf.mem_resp);
        itf.mem_write <= '0;
        
        #0;  // in case both memory and cpu operations complete at the same time, try to report the cpu one last
        $display("%s[CPU] write accepted", DISPLAY_TIME ? $sformatf("%t: ", $time) : "");
        itf.mem_address <= '0;//'Z;
        itf.mem_wdata <= '0;//'Z;
      
    endtask

endmodule

