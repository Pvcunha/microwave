module encoder(
    input wire [9:0]Keypad,
    input wire Clk,
    input wire Enablen,
    output wire [3:0]D,
    output wire loadn,
    output wire pgt_1Hz
);
    wire DataValid, outFreq, outDebounce;
    
    priority_encoder DUT1(.keypad(Keypad), .enablen(Enablen), .bcd(D), .data_valid(DataValid)); 
    
    DivideBy100 Dut2(.clk(clk), .clkOut(outFreq));
    
    Debounce Dut3(.clock(Clk), .clear(DataValid), .out(outDebounce));
    
    mux_2to1 Dut4(.DelayIn(outDebounce), .DivideBy100(outFreq), .sel(Enablen), .out(pgt_1Hz));
    
    assign loadn = DataValid;
    

endmodule