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
    integer ticks = 0;
    microwave m( .keypad(key), .clk(clk), .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done), .mag(mag), .sec_ones_segs(ones), .sec_tens_segs(tens), .min_segs(mins) );
    
    initial 
        clk = 0;

    always begin 
        #10 clk = ~clk;
        ticks++;
        if(ticks == 300)
            $finish;
    end

    initial begin
        key = 0;
        clearn = 0;
        #10 clearn = 1;

    end

    initial begin
        startn = 0; stopn = 1; clearn = 1; door_closed = 1;
        #10 key = 10'b0000000001; // 1
        #10 key = 0;
        #10 key = 10'b0000001000; // 4 
        #10 key = 0;
        #10 key = 10'b0000010000; // 5
        #10 key = 0;
        #10 startn = 1;
    end

    initial begin
        $dumpfile("vcd/microwave.vcd");
        $dumpvars;
    end    

    initial
        #1 $monitor(ones, tens, mins);


endmodule