`ifndef testbench
`define testbench

import fifo_types::*;

module testbench(fifo_itf itf);

fifo_synch_1r1w dut (
    .clk_i     ( itf.clk     ),
    .reset_n_i ( itf.reset_n ),

    // valid-ready enqueue protocol
    .data_i    ( itf.data_i  ),
    .valid_i   ( itf.valid_i ),
    .ready_o   ( itf.rdy     ),

    // valid-yumi deqeueue protocol
    .valid_o   ( itf.valid_o ),
    .data_o    ( itf.data_o  ),
    .yumi_i    ( itf.yumi    )
);

// Clock Synchronizer
default clocking tb_clk @(negedge itf.clk); endclocking

task reset();
    itf.reset_n <= 1'b0;
    ##(10);
    itf.reset_n <= 1'b1;
    ##(1);
endtask : reset

function automatic void report_error(error_e err); 
    itf.tb_report_dut_error(err);
endfunction : report_error

// DO NOT MODIFY CODE ABOVE THIS LINE

task enqueue(
    input [width_p - 1: 0] data_i
    );

    itf.valid_i <= 1;
    itf.data_i <= data_i;
    ##1;
    itf.valid_i <= 0;
endtask : enqueue


task dequeue(
    output [width_p - 1: 0] data_out
    );
        itf.yumi <= 1;
        // data_o <= itf.data_o;
        data_out <= 0;
        // ##1;
        // itf.yumi <= 0;
endtask : dequeue

task fill_fifo();
    logic [width_p-1:0] word;
    for (int i=0; i<cap_p; i++) begin
        word = i & 8'hffff_ffff;
        enqueue(word);
        if (itf.rdy != 1'b1) break;
    end
endtask: fill_fifo

task empty_fifo();
    logic [width_p-1:0] word;
    for (int i=0; i<cap_p; i++) begin
        itf.yumi <= 1;
        word <= itf.data_o;
        ##1;
        itf.yumi <= 0;
        assert (word == i & 8'hffff_ffff) 
        else   $error("ERRRORS");
        if (itf.valid_o != 1'b1) break;
    end
endtask: empty_fifo


task simultaneously();
	
endtask : simultaneously


initial begin
    reset();
    /************************ Your Code Here ***********************/
    // Feel free to make helper tasks / functions, initial / always blocks, etc.
    $display("Enqueueing");
    fill_fifo();
    $display("Ended Enqueueing");

    $display("DEnqueueing");
    empty_fifo();
    $display("ended DEnqueueing");



    /***************************************************************/
    // Make sure your test bench exits by calling itf.finish();
    itf.finish();
    $error("TB: Illegal Exit ocurred");
end

endmodule : testbench
`endif

