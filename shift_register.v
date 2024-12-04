module shift_register(count, mux); //edit might not work 100%
	input wire [1:0] count;
	output reg [3:0] mux;
    
	always@ (*)
	begin
		case (count)
		  2'b00 : mux = 4'b1000;
		  2'b01 : mux = 4'b0100;
		  2'b10 : mux = 4'b0010;
		  2'b11 : mux = 4'b0001;
		  default : mux = 4'bxxxx;
		endcase
	end
endmodule