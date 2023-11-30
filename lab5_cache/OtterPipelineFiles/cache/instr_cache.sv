`timescale 1ns / 1ps

module instr_cache (
    input CLK,
    input RST,
    input WE,
    input [13:0] addr_i,
    input [31:0] data_i,
    output logic hit,
    output logic [31:0] addr_o,
    output logic [31:0] data_o
);

parameter SET_INDEX_BITS = 3;
parameter VALID_BITS = 1;
parameter USE_BITS = 1;
parameter TAG_BITS = 9;
parameter WORD_BITS = 32;
parameter BLOCK_SIZE = 4 * WORD_BITS;
parameter SET_SIZE = 2 * VALID_BITS + 2 * USE_BITS + TAG_BITS + 2 * BLOCK_SIZE;

logic [SET_SIZE - 1:0] two_way_set_associative [2 ** SET_INDEX_BITS - 1:0];

parameter VALID_BIT1_INDEX = 268;
parameter VALID_BIT2_INDEX = 129;
parameter USE_BIT1_INDEX = 167; 
parameter USE_BIT2_INDEX = 128; 
parameter TAG_BIT_INDEX_START = 266;
parameter TAG_BIT_INDEX_END = 258;
parameter SET1_DATA0_INDEX = 226;
parameter SET1_DATA1_INDEX = 194;
parameter SET1_DATA2_INDEX = 162;
parameter SET1_DATA3_INDEX = 130;
parameter SET2_DATA0_INDEX = 0;
parameter SET2_DATA1_INDEX = 32;
parameter SET2_DATA2_INDEX = 64;
parameter SET2_DATA3_INDEX = 96;

logic [2:0] set_index;
logic [1:0] block_offset;
logic [8:0] tag;
logic [31:0] set1_data0, set1_data1, set1_data2, set1_data3, set2_data0, set2_data1, set2_data2, set2_data3;


always_comb begin
    set_index = addr_i[4:2];
    block_offset = addr_i[1:0];
    tag = addr_i[13:5];
    set1_data0 = two_way_set_associative[set_index][SET1_DATA0_INDEX +: WORD_BITS];
    set1_data1 = two_way_set_associative[set_index][SET1_DATA1_INDEX +: WORD_BITS];
    set1_data2 = two_way_set_associative[set_index][SET1_DATA2_INDEX +: WORD_BITS];
    set1_data3 = two_way_set_associative[set_index][SET1_DATA3_INDEX +: WORD_BITS];
    set2_data0 = two_way_set_associative[set_index][SET2_DATA0_INDEX +: WORD_BITS];
    set2_data1 = two_way_set_associative[set_index][SET2_DATA1_INDEX +: WORD_BITS];
    set2_data2 = two_way_set_associative[set_index][SET2_DATA2_INDEX +: WORD_BITS];
    set2_data3 = two_way_set_associative[set_index][SET2_DATA3_INDEX +: WORD_BITS];
end

// asynchronous read
always_comb begin
    if (two_way_set_associative[set_index][VALID_BIT1_INDEX] == 1 && two_way_set_associative[set_index][TAG_BIT_INDEX_START:TAG_BIT_INDEX_END] == tag) begin
        hit = 1;
        addr_o = 0;
        case (block_offset)
            2'b00: data_o = set1_data0;
            2'b01: data_o = set1_data1;
            2'b10: data_o = set1_data2;
            2'b11: data_o = set1_data3;
        endcase
    end
    else if (two_way_set_associative[set_index][VALID_BIT2_INDEX] == 1 && two_way_set_associative[set_index][TAG_BIT_INDEX_START:TAG_BIT_INDEX_END] == tag) begin
        hit = 1;
        addr_o = 0;
        case (block_offset)
            2'b00: data_o = set2_data0;
            2'b01: data_o = set2_data1;
            2'b10: data_o = set2_data2;
            2'b11: data_o = set2_data3;
        endcase
    end
    else begin
        hit = 0;
        addr_o = 0;
        data_o = 0;
    end
end

// synchronous write
always_ff @(negedge CLK) begin
    if (RST == 1) begin
        for (int i=0; i<2 ** SET_INDEX_BITS; i=i+1) begin
            two_way_set_associative[i][VALID_BIT1_INDEX] <= 0;
            two_way_set_associative[i][VALID_BIT2_INDEX] <= 0;
        end
    end

    if (WE == 1) begin
        if (two_way_set_associative[set_index][USE_BIT1_INDEX] == 0) begin
            two_way_set_associative[set_index][VALID_BIT1_INDEX] <= 1;
            two_way_set_associative[set_index][USE_BIT1_INDEX] <= 1;
            two_way_set_associative[set_index][USE_BIT2_INDEX] <= 0;
            two_way_set_associative[set_index][TAG_BIT_INDEX_START:TAG_BIT_INDEX_END] <= tag;
            case (block_offset)
                2'b00: two_way_set_associative[set_index][SET1_DATA0_INDEX +: WORD_BITS] <= data_i;
                2'b01: two_way_set_associative[set_index][SET1_DATA1_INDEX +: WORD_BITS] <= data_i;
                2'b10: two_way_set_associative[set_index][SET1_DATA2_INDEX +: WORD_BITS] <= data_i;
                2'b11: two_way_set_associative[set_index][SET1_DATA3_INDEX +: WORD_BITS] <= data_i;
            endcase
        end
        else begin
            two_way_set_associative[set_index][VALID_BIT2_INDEX] <= 1;
            two_way_set_associative[set_index][USE_BIT1_INDEX] <= 0;
            two_way_set_associative[set_index][USE_BIT2_INDEX] <= 1;
            two_way_set_associative[set_index][TAG_BIT_INDEX_START:TAG_BIT_INDEX_END] <= tag;
            case (block_offset)
                2'b00: two_way_set_associative[set_index][SET2_DATA0_INDEX +: WORD_BITS] <= data_i;
                2'b01: two_way_set_associative[set_index][SET2_DATA1_INDEX +: WORD_BITS] <= data_i;
                2'b10: two_way_set_associative[set_index][SET2_DATA2_INDEX +: WORD_BITS] <= data_i;
                2'b11: two_way_set_associative[set_index][SET2_DATA3_INDEX +: WORD_BITS] <= data_i;
            endcase
        end
    end        
end


endmodule