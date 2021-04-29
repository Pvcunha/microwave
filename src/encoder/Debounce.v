module Debounce (input wire clock, clear,
                   output reg out);
    reg [2:0] cont=0;
    always @(posedge clock && !clear) begin
        cont <= (cont==3'd7? cont: cont +1);
        if(cont == 3'd4) begin
            out <= 1;
        end
    end
    always @(posedge clock && clear) begin
        out<=0;
        cont<=0;
    end
endmodule