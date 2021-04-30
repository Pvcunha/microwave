`timescale 1ms/1ns

module tb_microwave;


    reg [9:0] key;
    reg clk;
    reg startn;
    reg stopn;
    reg clearn;
    reg door_closed;
    wire [6:0] ones, tens, mins;
    wire mag;
    microwave m( .keypad(key), .clk(clk), .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done), .mag(mag), .sec_ones_segs(ones), .sec_tens_segs(tens), .min_segs(mins) );
    
    initial 
        clk = 0;

    always 
        #1 clk = ~clk;

    initial begin
        clearn = 0;
        #1 clearn = 1;
    end

    initial begin
        startn = 1; stopn = 1; clearn = 1; door_closed = 1;
        #1 key = 10'b0000000001; // 1
        #1 key = 0;
        #1 key = 10'b0000001000; // 4 
        #1 key = 0;
        #1 key = 10'b0000010000; // 5
        #1 key = 0;
        #1 startn = 0;
    end

    initial begin
        $dumpfile("vcd/microwave.vcd");
        $dumpvars;
    end    

    initial
        #1 $monitor(ones, tens, mins);


endmodule