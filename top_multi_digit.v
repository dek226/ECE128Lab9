//////////////////////////////////////////////////////////////////////////////////
// Engineer: Demetri Kostas
// Create Date: 11/22/2024 02:15:19 PM
// Module Name: top_multi_digit
// Project Name: Multiplier
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module top_multi_digit(clk, rst, a, b, seg_cathode, seg_anode_o); //edit
	input wire clk, rst;
	input [3:0] a;
    input [3:0] b;
    wire [7:0] o;
	//input wire [15:0] BCD_in;
	output wire [6:0] seg_cathode;
	output wire [3:0] seg_anode_o;
	wire [3:0] mux_out, decoder_out;
	wire reset = 0;
	wire en_o = 1;
	wire [11:0] count_val;
	assign count_val = {4'b0000,o};
	wire [15:0] BCD_in;
	//wire [1:0] o_q
	assign seg_anode_o = ~decoder_out; 
	reg [15:0] bcd_reg;
	wire bcd_en;
	
	// Instantiate Modules
	seq_mult UUT10(clk, rst, a, b, o);
    //upCounter UUT11 (.clk(clk), .reset(reset), .count_val(count_val), .bcd_en(bcd_en));
    bcd_doubleDabble UUT22 (.clk(clk), .en_in(en_o), .bin(count_val), .bcd(BCD_in), .bcd_en(bcd_en));
    anode_gen UUT1 (.clk(clk), .seg_anode(decoder_out));
    Mux_4to1_case UUT2 (.s(decoder_out), .i0(bcd_reg[15:12]), .i1(bcd_reg[11:8]), .i2(bcd_reg[7:4]), .i3(bcd_reg[3:0]), .o(mux_out));
    BCD_7_seg_conv UUT3 (.num(mux_out), .seg(seg_cathode));

     //Update BCD register on bcd_en
    always @(posedge clk) begin
        if (bcd_en)
            bcd_reg <= BCD_in;
    end
endmodule
