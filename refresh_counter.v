//////////////////////////////////////////////////////////////////////////////////
// Engineer: Demetri Kostas
// Create Date: 11/22/2024 02:15:19 PM
// Module Name: refresh_counter
// Project Name: Multiplier
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module refresh_counter(clk, o_q); //edit, might work 100%
	input wire clk;
	output reg [1:0] o_q = 0;
	reg [1:0] o_d = 0;
	reg [8:0] count = 9'b000000000;
	
	always@(posedge clk)
	begin
	    count = count + 9'b000000001;
		if(o_d == 2'b11 && count==9'b100000001) //&& count==32
		begin
			o_d = 2'b00;
			o_q <= o_d;
	    end
		else
		begin
			if(count == 9'b100000001)
			begin
			o_d = o_d + 1'b1;
			o_q <= o_d;
			end
		end
		if(count == 9'b100000001)
		//begin
		  count = 9'b000000000;
		//end
	end
endmodule

