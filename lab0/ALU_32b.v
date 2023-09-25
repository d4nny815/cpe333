module ALU_32b (
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUOp,
    output reg [31:0] Result,
    output Zero
);

    always @(*) begin
        case (ALUOp)
            3'b000: Result = A & B;
            3'b001: Result = A | B;
            3'b010: Result = A + B;
            3'b110: Result = A - B;
            3'b111: Result = $signed(A) < $signed(B);
            default: Result = 0;
        endcase
    end

    assign Zero = Result == 32'd0;
endmodule