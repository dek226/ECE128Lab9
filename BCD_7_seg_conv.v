//////////////////////////////////////////////////////////////////////////////////
// Engineer: Demetri Kostas
// Create Date: 11/22/2024 02:15:19 PM
// Module Name: BCD_7_seg_conv
// Project Name: Multiplier
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module BCD_7_seg_conv(num, seg);
	input wire [3:0] num;
	//output dp;
	output reg [6:0] seg;
	//output [7:0] anode:
	
	//assign anode = {{7{1'b1}},~valid};
	//assign dp = 1'b1; //decimal point
	always@(num) //means all inputs - s or i0 or i1 or i2 or i3
	begin
		case (num) //case statement
			0 : seg = 7'b1000000; //0000001
			1 : seg = 7'b1111001; //1001111
			2 : seg = 7'b0100100; //0010010
			3 : seg = 7'b0110000; //0000110
			4 : seg = 7'b0011001; //1001100
			5 : seg = 7'b0010010; //0100100
			6 : seg = 7'b0000010; //0100000
			7 : seg = 7'b1111000; //0001111
			8 : seg = 7'b0000000; //0000000
			9 : seg = 7'b0010000; //0000100
			//switch off 7 segment character when the bcd digit is not a decimal number.
			default : seg = 7'b1111111; 
		endcase
    end
endmodule
