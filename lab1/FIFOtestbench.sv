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

task enqueue();
    $display("Enqueueing");
    //filling up queue
    for (int i = 0; i < cap_p; i++) begin
        itf.data_i <= i; // Incrementing by 1
        itf.valid_i <= 1;
        @(posedge itf.clk);
    end
    itf.valid_i <= 0;
endtask : enqueue


task dequeue();
    //Should release in same order
    $display("Dequeueing");
    //should release queue in same order it was queued originally
    for (int i = 0; i < cap_p; i++) begin
        itf.yumi <= 1;
        @(posedge itf.clk);
        assert (itf.data_o == i)
            else begin 
                $error ("-----TB: BAD DEQUEUE----\n %0d: int i %0d: itf.yumi %0d itf.data_0 ,error detected", i, itf.yumi, itf.data_o);
                report_error (INCORRECT_DATA_O_ON_YUMI_I);
            end
    end 
    itf.yumi <= 0;
endtask : dequeue


task simultaneously();
    $display("simultaneously");
    itf.data_i <= 999; 
    itf.valid_i <= 1;
    itf.yumi <= 1;
    @(posedge itf.clk);
    assert (itf.data_o != 999)
        else begin
            $error ("-----TB: SIMULTANEOUSLY----\n %0d: itf.yumi %0d itf.data_0 ,error detected", itf.yumi, itf.data_o);
            report_error (RESET_DOES_NOT_CAUSE_READY_O);
        end
    itf.valid_i <= 0;
    itf.yumi <= 0;
endtask : simultaneously


initial begin
    reset();
    /************************ Your Code Here ***********************/
    // Feel free to make helper tasks / functions, initial / always blocks, etc.
	$display("Enqueueing");
    enqueue();
    $display("Dequeueing");
    dequeue();
    $display("Together");
    simultaneously();
    simultaneously();
    simultaneously();
    /***************************************************************/
    // Make sure your test bench exits by calling itf.finish();
    itf.finish();
    $error("TB: Illegal Exit ocurred");
end

endmodule : testbench
`endif
