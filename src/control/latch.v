//`timescale 1ns/1ps

module latch (
    input wire R,
    input wire S,
    output reg mag

);

    always @(R or S)
    begin
        
        if(R && !S)
            begin
                mag <= 0;
            end
        else if(S && !R)
            begin
                mag <= 1;
            end
        else begin
            mag <= mag;
        end
  
      
    end




endmodule