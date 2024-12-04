module comb_mult_tb;

    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] o;
   
    comb_mult UUT(a,b,o);
   
    initial begin
   
         a = 4'b0010; b = 4'b0010;
         #10;
        
         a = 4'd7; b = 4'b0010;
         #10;
         
         a = 4'd5; b = 4'b0010;
         #10;
         
         a = 4'd3; b = 4'd3;
         #10;
        
        $stop;
    end
endmodule
