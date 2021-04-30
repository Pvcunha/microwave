module priority_encoder(
    input wire [9:0] keypad,
    input wire enablen,
    output reg [3:0] bcd,
    output reg data_valid
);

    always @ (*) begin
        if(!enablen) begin
            case(keypad)
                10'b1000000000: bcd = 9;
                10'b0100000000: bcd = 8;
                10'b0010000000: bcd = 7;
                10'b0001000000: bcd = 6;
                10'b0000100000: bcd = 5;
                10'b0000010000: bcd = 4;
                10'b0000001000: bcd = 3;
                10'b0000000100: bcd = 2;
                10'b0000000010: bcd = 1;
                10'b0000000001: bcd = 0;
                default: bcd = 3'bxxx;
            endcase
        end
        
        data_valid = ((keypad == 10'b0000000000)? 1 : 0);
    end

     


endmodule