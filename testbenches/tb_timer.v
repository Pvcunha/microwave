`timescale 1ns / 1ps

module test_timer;
    // Inputs
    reg clk ;
    reg clrn;
  reg loadn;
  reg en;
  reg [3:0] data;
    // Output
    wire[3:0] sec_ones, sec_tens, mins;
  wire tc;
  wire zero;
    // Instantiate the Timer
  
    timer uut(
        .clk(clk), 
        .clrn(clrn),
    .loadn(loadn),
    .en(en),
    .data(data),
    .sec_ones(sec_ones),
    .sec_tens(sec_tens),
    .mins(mins),
    .zero(zero)
    );
 
always #1 clk <= ~clk;

initial 
  begin
  $dumpfile("test_timer.vcd");
  $dumpvars(0, test_timer);
  clk<=1;
  loadn<=0;
  data<=4'b1001;
  clrn<=1;
  en<=1;
  #2
  loadn<=0;
  data<=4'b0011;
  clrn<=1;
  en<=1;  
  #2
  loadn<=0;
  data<=4'b0010;
  clrn<=1;
  en<=1;  
  #2
  loadn<=1;
  data<=4'b0011;
  clrn<=1;
  en<=1;  
  #500
  $finish;
  end
 
endmodule