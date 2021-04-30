module microwave(
    input wire [9:0] keypad,
    input wire clk,
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    input wire timer_done,
    output wire mag,
    output wire [6:0] sec_ones_segs, 
    output wire [6:0] sec_tens_segs, 
    output wire [6:0] min_segs
);

    wire en, loadn, pgt_1hz, zero;
    wire [3:0] encoder_out, sec_ones, sec_tens, mins;
    
    
    control c( .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(zero), .mag(mag) );
    encoder e( .Keypad(keypad), .Clk(clk), .Enablen(mag), .D(encoder_out), .pgt_1Hz(pgt_1hz), .loadn(loadn) );

    timer t( .data(encoder_out), .loadn(loadn), .clrn(clrn), .clk(pgt_1hz), .en(mag), .sec_ones(sec_ones), .sec_tens(sec_tens), .mins(mins), .zero(zero) );
    decoder d( .sec_ones(sec_ones), .sec_tens(sec_tens), .min(mins), .sec_ones_segs(sec_ones_segs), .sec_tens_segs(sec_tens_segs), .min_segs(min_segs) );


endmodule