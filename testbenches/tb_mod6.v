`timescale 1ns/1ps

module tb_mod10;

    reg [3:0] data;
    reg loadn, clk, en, clrn;
    wire [3:0] ones;
    wire tc, zero;
    integer ticks=0;

    mod6 countdown(.data(data), .loadn(loadn), .clrn(clrn), .clk(clk), .en(en), .out(ones), .tc(tc), .zero(zero) );

    initial begin
        clrn = 0;
        #5 clrn = 1;
    end
    
    initial 
        clk = 0;
    
    always #10 clk = ~clk;

    initial begin
        loadn = 1; data = 4; en = 1;
        #10 loadn = 0; loadn = #5 1;
    end
    initial begin
        $dumpfile("vcd/mod6.vcd");
        $dumpvars;
    end

    initial
    #1 $monitor("%b ", ones);
    


endmodule