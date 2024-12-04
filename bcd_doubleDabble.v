module bcd_doubleDabble(clk, en_in, bin, bcd, bcd_en);
    input clk, en_in;
    input [11:0] bin;
    output [15:0] bcd;
    output bcd_en;
    
    //State variables
    parameter IDLE = 3'b000;
    parameter SETUP = 3'b001;
    parameter ADD = 3'b010;
    parameter SHIFT = 3'b011;
    parameter DONE = 3'b100;
    
    reg [27:0] shift_reg = 28'b0000000000000000000000000000;
    reg [2:0] state = 3'b000;
    reg busy = 0;
    reg [3:0] sh_counter = 4'b0000;
    reg [1:0] add_counter = 2'b00;
    reg result_rdy = 0;
    
    always@(posedge clk)
    begin
        if(en_in && ~busy)
        begin
            shift_reg <= {16'b0000000000000000, bin};
            state <= SETUP;
        end
        case(state)
            IDLE:
            begin
                result_rdy <= 0;
                busy <= 0;
            
            end
            SETUP:
            begin
                busy <= 1;
                state <= ADD;
                
            end
            ADD:
            begin
                case(add_counter)
                    0:
                    begin
                        if(shift_reg[15:12] >= 4'b0101)
                           shift_reg[27:12] <= shift_reg[27:12] + 4'b0011;
                        add_counter <= add_counter + 2'b01;
                    end
                    1:
                    begin
                        if(shift_reg[19:16] >= 4'b0101)
                            shift_reg[27:16] <= shift_reg[27:16] + 4'b0011;
                        add_counter <= add_counter + 2'b01;
                    end
                    2:
                    begin
                        if(shift_reg[23:20] >= 4'b0101)
                            shift_reg[27:20] <= shift_reg[27:20] + 4'b0011;
                        add_counter <= add_counter + 2'b01;
                    end
                    3:
                    begin
                        if(shift_reg[27:24] >= 4'b0101)
                            shift_reg[27:24] <= shift_reg[27:24] + 4'b0011;
                        add_counter <= 0;
                        state <= SHIFT;
                    end
                endcase
            end
            SHIFT:
            begin
                sh_counter <= sh_counter + 4'b0001;
                shift_reg <= shift_reg << 1;
                if(sh_counter == 4'b1011)
                begin
                    sh_counter <= 4'b0000;
                    state <= DONE;
                end
                else
                    state <= ADD;
            end
            DONE:
            begin
                result_rdy <= 1'b1;
                state <= IDLE;
                busy <= 0;
            end
            default:
            begin
                state <= IDLE;
            end
            
        endcase
    end
    assign bcd = shift_reg[27:12];
    assign bcd_en = result_rdy;
endmodule
