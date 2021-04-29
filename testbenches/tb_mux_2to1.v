`timescale 1ns/1ps

module tb_mux_2to1;
    reg DelayIn, DivideBy100, sel;
    wire out;
    integer i, j;
    mux_2to1 DUT( .DelayIn(DelayIn), .DivideBy100(DivideBy100), .sel(sel), .out(out) );

    initial begin
        DelayIn = 1; DivideBy100 = 0;
    end 
    initial begin
        $dumpfile("vcd/mux_2to1.vcd");
        $dumpvars;
        sel = 1'b0; #10
        sel = 1'b1; #10 
        
        $finish;
    end

    initial 
        $monitor("DelayIn: %b, DivideBy100: %b, sel: %b, out: %b", DelayIn, DivideBy100, sel, out);
endmodule