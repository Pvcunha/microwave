module encoder(
    input wire [9:0]Keypad,
    input wire Clk,
    input wire Enablen,
    output wire [3:0]D,
    output wire loadn,
    output wire pgt_1Hz
);
    wire DataValid, outFreq, outDebounce;
    
    priority_encoder pencoder(.keypad(Keypad), .enablen(Enablen), .bcd(D), .data_valid(DataValid));
    
    DivideBy100 div100(.clk(Clk), .clkOut(outFreq));
    
    Debounce db(.clock(Clk), .clear(DataValid), .out(outDebounce));
    
    mux_2to1 mux(.DelayIn(outDebounce), .DivideBy100(outFreq), .sel(Enablen), .out(pgt_1Hz));
    
    assign loadn = DataValid;
    

endmodule