`timescale 1ns/1ps

module tb_latch;

    reg S,R;
    wire mag;
    integer i;
    

    latch l(.S(S),.R(R),.mag(mag));

    initial begin

        S = 1;
        R = 0;
        #2
        $display("S: %b, R: %b",S,R);
        #2;
        $display("Mag : %b",mag);  
        for(i = 0; i<10;i = i+1)begin
            
            S =  $urandom%2; 
            R = 1-S; 
            $display("S: %b, R: %b",S,R);
            #2;
            $display("Mag : %b",mag);  
            #20;
        end


    end

    initial begin
        $dumpfile("vcd/latch.vcd");
        $dumpvars;
    end
    
    


endmodule