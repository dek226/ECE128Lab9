module anode_gen(clk, seg_anode);
	input wire clk;
	output wire [3:0] seg_anode;
	wire [1:0] countToDecoder;
	
	
	refresh_counter UUT1(.clk(clk), .o_q(countToDecoder));
	shift_register UUT2(.count(countToDecoder), .mux(seg_anode));
	
endmodule
