import fifo_types::*;

module top;

fifo_itf itf();
testbench tb(.*);
grader grd (.*);
endmodule : top

