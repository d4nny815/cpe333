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

    itf.valid_i <= 1 & itf.rdy;
    itf.data_i <= data_i;
    ##1;
    itf.valid_i <= 0;
endtask : enqueue


task dequeue(
    output [width_p - 1:0] data_out
    );
    itf.yumi <= 1'b1 & itf.valid_o;
    data_out <= itf.data_o; // Dequeue data from the FIFO
    ##1;
    itf.yumi <= 0;
endtask : dequeue

task fill_fifo();
    logic [width_p-1:0] word;
    for (int i=0; i<cap_p; i++) begin
        word = i & 8'hff;
        enqueue(word);
        if (itf.rdy != 1'b1) break;
    end
endtask: fill_fifo

task empty_fifo();
    logic [width_p-1:0] word;
    for (int i=0; i<cap_p; i++) begin
        dequeue(word);
        assert (word == i & 8'hff) 
        else   $error("ERRRORS");
        if (itf.valid_o != 1'b1) break;
    end
endtask: empty_fifo

task simultaneously();
    logic [width_p-1:0] enqueue_word;
    logic [width_p-1:0] deqeueue_word;
    enqueue(8'h8f); // start at 1 in FIFO
    for (int i=0; i<cap_p; i++) begin
        enqueue_word = ((~i) & 8'hff);
        enqueue(enqueue_word);
        dequeue(deqeueue_word);
    end


endtask : simultaneously


initial begin
    reset();
    /************************ Your Code Here ***********************/
    // Feel free to make helper tasks / functions, initial / always blocks, etc.
    $display("Enqueueing");
    fill_fifo();
    $display("Ended Enqueueing");
    reset();

    $display("DEnqueueing");
    empty_fifo();
    $display("ended DEnqueueing");
    reset();

    $display("Simultaneously");
    simultaneously();
    $display("ended Simultaneously");
    reset();

    /***************************************************************/
    // Make sure your test bench exits by calling itf.finish();
    itf.finish();
    $error("TB: Illegal Exit ocurred");
end

endmodule : testbench
`endif

