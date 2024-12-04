module top_multi_digit_tb;
    reg clk;
    reg rst;
    reg [3:0] a;
    reg [3:0] b;
    wire [6:0] seg_cathode;
	wire [3:0] seg_anode_o;

    
   
    top_multi_digit UUT(clk, rst, a, b, seg_cathode, seg_anode_o);
   
    initial begin
        clk = 0;
        forever #5 clk = ~clk;       // 100 MHz clock (period = 10 ns)
    end
   
    initial begin
    
         rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'b0010; b = 4'b0010;
         #20000;
        
          rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'd7; b = 4'b0010;
         #20000;
         
          rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'd5; b = 4'b0010;
         #20000;
         
          rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'd3; b = 4'd3;
         #20000;
        
        $stop;
    end
endmodule

