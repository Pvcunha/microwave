`timescale 1ns/1ps

module tb_mod10;

    reg [3:0] data;
    reg loadn;
    reg clk;
    reg en;
    reg clrn;
    wire [3:0] ones;
    wire tc, zero;
    integer ticks=0;
    initial begin
        data = 4'b1001; clk = 0; en = 1; clrn = 0; 
        #5 loadn = 0;
        #5 loadn = 1; 
        #40 clrn = 1;
        #10 en = 0;
        #20;
        $stop;
    end

    mod10 countdown(.data(data), .loadn(loadn), .clrn(clrn), .clk(clk), .en(en), .ones(ones), .tc(tc), .zero(zero) );

    
    initial begin
        $dumpfile("vcd/mod10.vcd");
        $dumpvars;
    end

    always begin
         #5 clk = ~clk; ticks++;
    end
    initial
    #1 $monitor("%b ", ones);
    


endmodule