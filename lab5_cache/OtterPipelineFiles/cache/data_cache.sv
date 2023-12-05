`timescale 1ns / 1ps
`timescale 1ns / 1ps

module data_cache (
    input CLK,
    input RST,
    input WE,
    input [31:0] addr_i,
    input [31:0] data_i,
    output logic hit,
    output logic dirty,
    output logic [31:0] addr_o,
    output logic [31:0] data_o
);

parameter SET_INDEX_BITS = 3;
parameter VALID_BITS = 1;
parameter USE_BITS = 1;
parameter DIRTY_BIT = 1;
parameter TAG_BITS = 25;
parameter WORD_BITS = 32;
parameter BLOCK_SIZE = 4 * WORD_BITS;
parameter SET_SIZE = 2 * VALID_BITS + 2 * USE_BITS + 2 * DIRTY_BIT + TAG_BITS + 2 * BLOCK_SIZE;

logic [SET_SIZE - 1:0] two_way_set_associative [2 ** SET_INDEX_BITS - 1:0];

parameter VALID_BIT1_INDEX = 286;
parameter USE_BIT1_INDEX = 285;
parameter DIRTY_BIT1_INDEX = 284; 
parameter VALID_BIT2_INDEX = 130;
parameter USE_BIT2_INDEX = 129;
parameter DIRTY_BIT2_INDEX = 128;
parameter TAG_BIT_INDEX_START = 283;
parameter TAG_BIT_INDEX_END = 259;
parameter SET1_DATA0_INDEX = 131;
parameter SET1_DATA1_INDEX = 163;
parameter SET1_DATA2_INDEX = 195;
parameter SET1_DATA3_INDEX = 227;
parameter SET2_DATA0_INDEX = 0;
parameter SET2_DATA1_INDEX = 32;
parameter SET2_DATA2_INDEX = 64;
parameter SET2_DATA3_INDEX = 96;

logic [1:0] byte_offset;
logic [2:0] set_index;
logic [1:0] block_offset;
logic [8:0] tag;
logic [31:0] set1_data0, set1_data1, set1_data2, set1_data3, set2_data0, set2_data1, set2_data2, set2_data3;

always_comb begin
    byte_offset = addr_i[1:0];
    block_offset = addr_i[3:2];
    set_index = addr_i[6:4];
    tag = addr_i[31:7];
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
           
            two_way_set_associative[set_index][TAG_BIT_INDEX_START:TAG_BIT_INDEX_END] <= tag;
            case (block_offset)
                2'b00: two_way_set_associative[set_index][SET1_DATA0_INDEX +: WORD_BITS] <= data_i;
                2'b01: two_way_set_associative[set_index][SET1_DATA1_INDEX +: WORD_BITS] <= data_i;
                2'b10: two_way_set_associative[set_index][SET1_DATA2_INDEX +: WORD_BITS] <= data_i;
                2'b11: begin
                    two_way_set_associative[set_index][USE_BIT1_INDEX] <= 1;
                    two_way_set_associative[set_index][USE_BIT2_INDEX] <= 0; 
                    two_way_set_associative[set_index][SET1_DATA3_INDEX +: WORD_BITS] <= data_i;
                end
            endcase
        end
        else begin
            two_way_set_associative[set_index][VALID_BIT2_INDEX] <= 1;
            two_way_set_associative[set_index][TAG_BIT_INDEX_START:TAG_BIT_INDEX_END] <= tag;
            case (block_offset)
                2'b00: two_way_set_associative[set_index][SET2_DATA0_INDEX +: WORD_BITS] <= data_i;
                2'b01: two_way_set_associative[set_index][SET2_DATA1_INDEX +: WORD_BITS] <= data_i;
                2'b10: two_way_set_associative[set_index][SET2_DATA2_INDEX +: WORD_BITS] <= data_i;
                2'b11: begin
                    two_way_set_associative[set_index][USE_BIT1_INDEX] <= 0;
                    two_way_set_associative[set_index][USE_BIT2_INDEX] <= 1;
                    two_way_set_associative[set_index][SET2_DATA3_INDEX +: WORD_BITS] <= data_i;
                end
            endcase
        end
    end        
end


endmodule