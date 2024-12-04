//////////////////////////////////////////////////////////////////////////////////
// Engineer: Demetri Kostas
// Create Date: 11/22/2024 02:15:19 PM
// Module Name: seq_mult_tb
// Project Name: Multiplier
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module seq_mult_tb;

    reg clk;
    reg rst;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] o;
   
    seq_mult UUT(clk,rst,a,b,o);
   
   initial begin
        clk = 0;
        forever #5 clk = ~clk;       // 100 MHz clock (period = 10 ns)
    end
   
    initial begin
    
         rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'b0010; b = 4'b0010;
         #1000;
        
          rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'd7; b = 4'b0010;
         #1000;
         
          rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'd5; b = 4'b0010;
         #1000;
         
          rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'd3; b = 4'd3;
         #1000;
        
        $stop;
    end

endmodule
