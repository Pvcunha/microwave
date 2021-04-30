`timescale 1ns/1ps

module tb_encoder;
    
    reg [9:0]Keypad;
    reg Clk, Enablen;
    wire [3:0]D;
    wire loadn, pgt_1Hz;
    integer contador=0;
    
    encoder DUT(.Keypad(Keypad), .Clk(Clk), .Enablen(Enablen), .D(D), .loadn(loadn), .pgt_1Hz(pgt_1Hz));
    
    initial begin
        Keypad=1;
        Clk = 0;
        Enablen = 0;
    end
        
     
       

    always begin 
        #1 Clk = ~Clk;
        contador++;
        if(contador==103) begin
           $finish;
        end
        Keypad <= Keypad*2;
        if(contador%19 == 0) begin
            Keypad <= 0;
        end
        if(contador%10 == 0) begin
            Enablen <= 1;
        end 
        else begin
            Enablen <= 0;
        end
        if(Keypad==0) begin
            Keypad <= 1;
        end
       
        
    end

    
    initial begin
        $dumpfile("vcd/Encoder.vcd");
        $dumpvars;
    end

    
    initial begin
        #1 $monitor("Contador: %d, clk: %d, Enablen: %d, Keypad: %b, DadoSaida: %d, loadn: %d, pgt_1Hz: %d", contador, Clk, Enablen, Keypad, D, loadn, pgt_1Hz);
    end
        
    


endmodule