`timescale 1ns/1ps

module mod6(
    input wire [3:0] data,
    input wire loadn, clrn, clk, en,
    output reg [3:0] ones,
    output reg tc, zero
);

    always @ (posedge clk, negedge clrn) begin
        
        if(~en);
        else if(~loadn) begin
            ones <= data;
            if(data == 4'b0000)
                zero <= tc <= 1;
            else 
                zero <= tc <= 0;
        end
        else if(clrn) begin
            ones <= 4'b0000;
            tc <= 1;
            zero <= 1;
        end
        else begin
                
            if(ones == 0) begin
                ones <= 5;
                tc <= 1;
                zero <= 1;
            end
            else begin
                ones <= (ones-1)%6;
                tc <= 0;
                zero <= 0;
            end
        end
    end


endmodule