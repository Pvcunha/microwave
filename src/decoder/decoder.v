`timescale 1ns/1ps

module decoder (
    sec_ones, sec_tens,min,
    sec_ones_segs,sec_tens_segs,min_segs

);

    input [3:0] sec_ones, sec_tens,min;
    output[6:0] sec_ones_segs,sec_tens_segs, min_segs;

    bcd_seven sec_ones_module(.bcd(sec_ones),.seven(sec_ones_segs));

    bcd_seven sec_tens_module(.bcd(sec_tens),.seven(sec_tens_segs));

    bcd_seven min_module(.bcd(min),.seven(min_segs));

endmodule
