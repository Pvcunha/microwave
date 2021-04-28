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
        clk = 1;
    
    always begin
        #10 clk = ~clk; ticks++;
        if(ticks == 200) 
            $finish;
    end  
    

    initial begin
        loadn = 0; en = 1;
        #20
        data = 4;
        #20;
        data = 3;
        #20
        data = 2;
        #10
        loadn = 1;
    end

    initial begin
        $dumpfile("vcd/timer.vcd");
        $dumpvars;
    end

    initial
    #1 $monitor("%d %d %d", mins, sec_tens, sec_ones);
    


endmodule