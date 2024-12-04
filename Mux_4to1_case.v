module Mux_4to1_case(s, i0, i1, i2, i3, o);
	input wire [3:0] s, i0, i1, i2, i3;
	output reg [3:0] o;
	
	always@(*) //means all inputs - s or i0 or i1 or i2 or i3
	begin
		case (s)
			4'b1000 : o = i0;
			4'b0100 : o = i1;
			4'b0010 : o = i2;
			4'b0001 : o = i3;
			default : o = 1'bx; //default is undefined
		endcase
	end
endmodule
