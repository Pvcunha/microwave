module timer(
    input wire [3:0] data,
    input wire loadn, clrn, clk,
    output wire [3:0] sec_ones, sec_tens, mins,
    output wire zero 
);
    wire tc_ones, tc_tens, tc_mins, zero_ones, zero_tens, zero_mins;

    mod10 sec_ones_module ( .data(data), .loadn(loadn), .clrn(clrn), .clk(clk), .en(en), .out(sec_ones), .tc(tc_ones), .zero(zero_ones) );

    mod6 sec_tens_module ( .data(sec_ones), .loadn(loadn), .clrn(clrn), .clk(clk), .en(tc_ones), .out(sec_tens), .tc(tc_tens), .zero(zero_tens) );
    
    mod10 mins_module ( .data(sec_tens), .loadn(loadn), .clrn(clrn), .clk(clk), .en(tc_mins), .out(mins), .tc(tc_mins), .zero(zero_mins) );

    assign zero = zero_mins & zero_ones & zero_tens;

endmodule