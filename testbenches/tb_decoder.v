`timescale 1ns/1ps

module tb_decoder;

    reg [3:0] sec_ones, sec_tens,min,i;
    wire [6:0] sec_ones_segs,sec_tens_segs,min_segs;

    decoder t(.sec_ones(sec_ones),.sec_tens(sec_tens),.min(min),.sec_ones_segs(sec_ones_segs),.sec_tens_segs(sec_tens_segs),.min_segs(min_segs));


    initial begin
        
        for(i = 0; i<10;i = i+1)begin
            sec_ones=$urandom%10; 
            sec_tens=$urandom%10;
            min = $urandom%10;
            #2;
            $display("A %d, B: %d",min,sec_ones); 
            #2;
            $display("C %b, D: %b",min_segs,sec_ones_segs); 
            #20;
        end


    end

    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars;
    end
    
    


endmodule