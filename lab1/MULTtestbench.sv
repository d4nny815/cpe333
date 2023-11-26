import mult_types::*;

module testbench(multiplier_itf.testbench itf);

add_shift_multiplier dut (
    .clk_i          ( itf.clk          ),
    .reset_n_i      ( itf.reset_n      ),
    .multiplicand_i ( itf.multiplicand ),
    .multiplier_i   ( itf.multiplier   ),
    .start_i        ( itf.start        ),
    .ready_o        ( itf.rdy          ),
    .product_o      ( itf.product      ),
    .done_o         ( itf.done         )
);

assign itf.mult_op = dut.ms.op;
default clocking tb_clk @(negedge itf.clk); endclocking

// error_e defined in package mult_types in file types.sv
// Asynchronously reports error in DUT to grading harness
function void report_error(error_e error);
    itf.tb_report_dut_error(error);
endfunction : report_error


// Resets the multiplier
task reset();
    itf.reset_n <= 1'b0;
    ##5;
    itf.reset_n <= 1'b1;
    ##1;
endtask : reset

// DO NOT MODIFY CODE ABOVE THIS LINE

/* Uncomment to "monitor" changes to adder operational state over time */
//initial $monitor("dut-op: time: %0t op: %s", $time, dut.ms.op.name);


initial itf.reset_n = 1'b0;

initial begin
    reset();
    // itf.reset_n = 0;
    /********************** Your Code Here *****************************/
    $display("TB: TESTING start_i signal asserted while in run states");
    itf.start <= 0;
    itf.multiplicand <= 50;
    itf.multiplier <= 200;
    ##1;
    itf.start <= 1;
    ##1;
    itf.start <= 0;
    ##2;
    if (itf.mult_op == ADD) begin
        $display("TB: start asserted in ADD");
        itf.start <= 1;
        ##1;
        assert (itf.mult_op == SHIFT) 
        else begin
            $error("TB: start affected the run");
            report_error(BAD_PRODUCT);
        end
        ##1;
        itf.start <= 0;
    end
    ##1;
    if (itf.mult_op == SHIFT) begin
        $display("TB: start asserted in SHIFT");
        itf.start <= 1;
        ##1;
        assert (itf.mult_op == ADD) 
        else begin
            $error("TB: start affected the run");
            report_error(BAD_PRODUCT);
        end
        ##1;
        itf.start <= 0;
    end
    ##10;
    $display("TB: PASSED start asserted in run state");
    reset();

    $display("TB: Testing reset in run states");
    itf.start <= 0;
    itf.multiplicand <= 50;
    itf.multiplier <= 200;
    ##1;
    itf.start <= 1;
    ##1;
    itf.start <= 0;
    ##2;
    if (itf.mult_op == ADD) begin
        $display("TB: reset asserted in ADD");
        itf.reset_n <= 0;
        ##1;
        assert (itf.rdy == 1'b1) 
        else begin
            $error("TB: NOT_READY after reset");
            report_error(NOT_READY);
        end
        itf.reset_n <= 1;
    end

    itf.start <= 1;
    ##1;
    itf.start <= 0;
    ##1;
    if (itf.mult_op == SHIFT) begin
        $display("TB: reset asserted in SHIFT");
        itf.reset_n <= 0;
        ##1;
        assert (itf.rdy == 1'b1) 
        else begin
            $error("TB: NOT_READY after reset");
            report_error(NOT_READY);
        end

        itf.reset_n <= 1;
    end
    $display("TB: PASSED reset asserted in run state");
    reset();

    $display("TB: TESTING every possible comb of muliplicand and multiplier");
    for (int i=0; i<=8'hff; i++) begin
        for (int j=0; j<=8'hff; j+=itf.rdy) begin
            itf.multiplicand <= i;
            itf.multiplier <= j;
            itf.start <= itf.rdy;
            ##1;
            if (itf.done == 1'b1) begin
                assert (itf.product == i * j)
                else begin
                    $error ("TB: BAD_PRODUCT error detected, muliplicand = %d multiplier = %d, product = %d", itf.multiplicand, itf.multiplier, itf.product);
                    report_error(BAD_PRODUCT);
                end
                assert (itf.rdy == 1'b1) 
                else begin
                    $error("TB: NOT_READY");
                    report_error(NOT_READY);
                end
            end   
        end
    end
    $display("TB: PASSED every possible comb");

    /*******************************************************************/
    itf.finish(); // Use this finish task in order to let grading harness
                  // complete in process and/or scheduled operations
    $error("Improper Simulation Exit");
end

endmodule : testbench