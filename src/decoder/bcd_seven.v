`timescale 1ns/1ps

module bcd_seven (bcd, seven);

    input [3:0] bcd;
    output[6:0] seven;

    reg [6:0] seven;

    always @(bcd)
    begin
        case (bcd)
        4'b0000 : seven = 7'b0111111; 
        4'b0001 : seven = 7'b0110000;
        4'b0010 : seven = 7'b1101101;
        4'b0011 : seven = 7'b1111001;
        4'b0100 : seven = 7'b0110011;
        4'b0101 : seven = 7'b1011011;
        4'b0110 : seven = 7'b1011111;
        4'b0111 : seven = 7'b1110000;
        4'b1000 : seven = 7'b1111111;
        4'b1001 : seven = 7'b1111011;
        default : seven = 7'b0000000;

        endcase
    end

endmodule
