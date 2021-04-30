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
    microwave m( .keypad(key), .clk(clk), .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .mag(mag), .sec_ones_segs(ones), .sec_tens_segs(tens), .min_segs(mins) );
    
    initial 
        clk = 0;

    always begin 
        #10 clk = ~clk;
        ticks++;
        if(ticks == 300000)
            $finish;
    end

    initial begin
        key = 0;
        #1 clearn = 0;
        #1 clearn = 1;

    end

    initial begin
        startn = 1; stopn = 1; clearn = 1; door_closed = 1;
        #10 key = 10'b0000000010; // 1
        #10 key = 0;
        #10 key = 10'b1000000000; // 9 
        #10 key = 0;
        #10 key = 10'b1000000000; // 9
        #10 key = 0;
        #100 startn = 0; 
        /* F NISSO AQUI
        #200 startn = 1; clearn = 0;
        #5 clearn = 1;
        #10 key = 10'b0000000100; // 3
        #10 key = 0;
        #10 key = 10'b0000001000; // 4 
        #10 key = 0;
        #10 key = 10'b1000100000; // 5
        #10 key = 0;
        #100 startn = 0;*/
        
       
    end

    initial begin
        $dumpfile("vcd/microwave.vcd");
        $dumpvars;
    end    

    initial
        #1 $monitor("%b %b %b ", ones, tens, mins);


endmodule