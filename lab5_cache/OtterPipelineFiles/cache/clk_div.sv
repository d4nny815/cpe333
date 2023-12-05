module clk_2n_div_test  #(parameter n=13) (
   input clockin, 
   input rst,   
   output logic clockout);  

    logic [n:0] count = 0; 

    always_ff @(posedge clockin) begin
        if (rst == 1 | count[n] == 1'b1)
            count <= 0;
        else
            count <= count + 1;
    end

    always_comb begin
        clockout = count[n]; 
    end
	
endmodule