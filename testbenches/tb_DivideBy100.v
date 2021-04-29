`timescale 1ns/1ps

module tb_DivideBy100;

    reg clk;
    wire clk_out;
    integer contador=0;
    DivideBy100 DUT(.clk(clk), .clkOut(clk_out));
    
    
    initial 
        clk = 0;
    
    always begin
       #10 clk = ~clk;
       contador++;
       if(contador==503) begin
           $finish;
       end 
    end

    
    initial begin
        $dumpfile("vcd/DivideBy100.vcd");
        $dumpvars;
    end

    
    initial begin
        #1 $monitor("Contador: %d ClkIn: %d  ClkOut: %d", contador, clk, clk_out);
    end
        
    


endmodule