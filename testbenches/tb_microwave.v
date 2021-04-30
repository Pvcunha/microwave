`timescale 1cs/ps

module tb_microwave;


    reg [9:0] key;
    reg clk;
    reg startn;
    reg stopn;
    reg clearn;
    reg door_closed;
    wire [6:0] ones, tens, mins;

    microwave m(.keypad(key), .clk(clk), .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done));
    
    initial 
        clock = 0;

    always 
        #1 clk = ~clk;

    initial begin
        startn = 1; stopn = 1; clearn = 1; door_closed = 0;
        #1;
    end

    initial begin
        $dumpfile("bin/microwave.vcd");
        $dumpfile;

    end    

endmodule;