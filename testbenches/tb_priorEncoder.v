`timescale 1ns/1ps

module prior_encoder;

    reg [9:0] keypad;
    reg enable;
    wire [3:0]bcd;
    wire data_valid;
    integer i, j;
    priority_encoder pe( .keypad(keypad), .enablen(enable), .bcd(bcd), .data_valid(data_valid) );

    initial begin
        enable = 1; keypad = 0;
    end 
    initial begin
        $dumpfile("vcd/priorEncoder.vcd");
        $dumpvars;
        enable = 0;
        for(i = 1; i < 10; i++) begin
            j = 1 << i;
            #5 keypad = j;
        end
        #120;
        $finish;
    end

    initial 
        #1 $monitor("%d %d", keypad, bcd);
endmodule