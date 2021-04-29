`timescale 1ns/1ps

module tb_Debounce;

    reg clk, clear;
    wire out;
    integer contador=0;
    Debounce DUT(.clock(clk), .clear(clear), .out(out));
    
    initial begin
        clk = 0;
        clear = 0;
    end
        
    always begin
       #1 clk = ~clk;
       if(contador%18 == 0) begin
           clear = ~clear;
       end
       contador++;
       if(contador==103) begin
           $finish;
       end 
    end

    
    initial begin
        $dumpfile("vcd/Debounce.vcd");
        $dumpvars;
    end

    
    initial begin
        #1 $monitor("Contador: %d,  clock: %d,  clear: %d, saida: %d", contador, clk, clear, out);
    end
        
    


endmodule