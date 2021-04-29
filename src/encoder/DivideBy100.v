module DivideBy100 (input wire clk,
                    output reg clkOut);
    reg [6:0] cont = 7'd1;
    always @(posedge clk) begin
        if(cont == 7'd100) begin
            cont <=1;
            clkOut <=1;
        end
        else begin
            clkOut <=0;
            cont <= cont +1;
        end
    end
endmodule