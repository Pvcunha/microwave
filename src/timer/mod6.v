`timescale 1ns/1ps

//  TODO checar o *tc*

module mod6(
    input wire [3:0] data,
    input wire loadn, clrn, clk, en,
    output reg [3:0] out,
    output reg tc, zero
);

    always @ (posedge clk or negedge clrn) begin
        
        if(!clrn) begin
            out = 0;
            tc = 0;
            zero = 0;
        end
        else if(!loadn) begin
            out <= data;
        end 
        else begin
            if(en) begin
                if(out == 0)  begin
                    out <= 5;
                    tc =  1;
                    zero <= 1;
                end
                else begin
                    out <= out-1;
                    tc <= 0;
                    zero <= 0;
                end
             
            end
            else
                tc <= 0;
        end
    end
    


endmodule