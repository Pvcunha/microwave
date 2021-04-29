module mux_2to1 (
    input wire DelayIn, DivideBy100, sel,
    output wire out
);
    assign out = (sel ==0? DelayIn: DivideBy100);
endmodule