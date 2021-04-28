`timescale 1ns/1ps

module tb_timer;

    reg [3:0] data;
    reg loadn, clk, en, clrn;
    wire [3:0] sec_ones, sec_tens, mins;
    wire tc, zero;
    integer ticks=0;

    timer t(.data(data), .loadn(loadn), .clrn(clrn), .clk(clk), .en(en), .sec_ones(sec_ones), .sec_tens(sec_tens), .mins(mins), .zero(zero) );

    initial begin
        clrn = 0;
        #5 clrn = 1;
    end
    
    initial 
        clk = 0;
    
    always #10 clk = ~clk;

    initial begin
        loadn = 1; data = 4; en = 1;
        #10 data = 5;
        #10 data = 7;
        #10 loadn = 0; loadn = #5 1;


    end
    initial begin
        $dumpfile("vcd/timer.vcd");
        $dumpvars;
    end

    initial
    #1 $monitor("%i %i %i ", mins, sec_tens, sec_ones);
    


endmodule