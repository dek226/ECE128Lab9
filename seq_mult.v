//////////////////////////////////////////////////////////////////////////////////
// Engineer: Demetri Kostas
// Create Date: 11/22/2024 02:15:19 PM
// Module Name: seq_mult
// Project Name: Multiplier
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module seq_mult(clk, rst, a, b, o);
    input clk;
    input rst;
    input [3:0] a;
    input [3:0] b;
    output reg [7:0] o;

    parameter idle = 0, multiply = 1, update_result = 2, done = 3;
    reg [1:0] CS, NS;

    reg [7:0] part_product=8'b0; 
    reg [3:0] multiplicand=4'b0;  
    reg [3:0] operand_bb;     
    reg [2:0] shift_cnt;   
    
    

    always @(posedge clk or posedge rst) begin
        if (rst)
            CS <= idle; 
        else
            CS <= NS;     
    end


    always @(posedge clk) begin
        part_product <= part_product;
        shift_cnt <= shift_cnt;
        multiplicand <= multiplicand;
        operand_bb <= operand_bb;

        case (CS)
            idle: begin
                part_product <= 0;
                shift_cnt <= 0;
                multiplicand <= a; 
                operand_bb <= b;   
                NS = multiply;
            end

            multiply: begin
                if (shift_cnt < 4) begin
                    if (operand_bb[0] == 1) begin
                        part_product <= part_product + multiplicand;
                    end
                    multiplicand <= multiplicand << 1;
                    operand_bb <= operand_bb >> 1;     
                    shift_cnt <= shift_cnt + 1;
                    
                    
                    NS = update_result;
                end 
                else 
                begin
                    NS = done; 
                end
            end

            update_result: begin
                NS = multiply; 
            end

            done: begin
                o <= part_product; 
                NS = idle;        
            end
        endcase
    end

endmodule
