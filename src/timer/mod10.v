`timescale 1ns/1ps

//  TODO checar o *tc*

module mod10(
    input wire [3:0] data,
    input wire loadn, clrn, clk, en,
    output reg [3:0] out,
    output reg tc, zero
);

    always @ (posedge clk or negedge clrn) begin
        
        if(!clrn) begin
            out <= 0;
            tc = 0;
            zero = 0;
        end
        else begin
            if(en) begin
                if(!loadn) begin
                    out <= data;
                    if(data == 0) begin
                        tc <= 1;
                        zero <= 1;
                    end       
                    else begin
                        tc <= 0;
                        zero <= 0;
                    end
                end 
                else begin
                    
                    if(out == 0)  begin
                        out <= 9;
                        tc <=  1;
                        zero <= 0;
                    end
                    else if(out == 1) begin
                        out <= (out-1)%10;
                        tc <= 0;
                        zero <= 1;
                    end
                    else begin
                        out <= (out-1)%10;
                        tc <= 0;
                        zero <= 0;
                    end
                end 
            end
        end
    end


endmodule