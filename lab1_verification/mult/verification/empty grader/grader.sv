/*
 * Empty Grader module.  For developing and simulating your testbench w/o checker. 
 *
 */
 
`ifndef grader
`define grader
import mult_types::*;

module grader(multiplier_itf itf);

initial begin
    $display("GDR: Grader Running");
    repeat (operand_limit * operand_limit * 100) @(posedge itf.clk);
    $display("GDR: Grader timed out"); $finish;
end

final begin
    $display("GDR: Cleaning-up Test Run");
end

endmodule : grader

`endif

