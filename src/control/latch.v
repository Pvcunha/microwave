`timescale 1ns/1ps

module latch (
    input wire R,
    input wire S,
    output reg mag

);

    always @(R or S)
    begin
        
        if(R)
            begin
                mag <= 0;
            end
        else if(S)
            begin
                mag <= 1;
            end

      
    end




endmodule