//////////////////////////////////////////////////////////////////////////////////
// Engineer: Demetri Kostas
// Create Date: 11/22/2024 02:15:19 PM
// Module Name: upCounter
// Project Name: Multiplier
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module upCounter(clk, reset, count_val, bcd_en);
    input clk, reset, bcd_en;
    output reg[11:0] count_val;
    //output reg en_o;
     reg [16:0] cycle;  

    initial begin
        count_val = 12'd0;
        cycle = 17'd0;
    end
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            count_val <= 12'b000000000000;
            cycle <= 17'd00000000000000000;
        end
        else if (bcd_en)
        begin
            if (cycle == 17'd400) begin
                    count_val <= count_val + 1; 
                    cycle <= 17'd0;
                end else begin
                    cycle <= cycle + 1; 
                end
            end
        end
endmodule
