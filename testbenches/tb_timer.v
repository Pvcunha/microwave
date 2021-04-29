`timescale 1ns / 1ps


module tb_timer;
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
  integer ticks = 0;
  // Instantiate the Timer
   timer t(
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
 
 	initial begin
 	     clrn = 0;
 	     #2 clrn = 1;
 	end
	
	initial clk = 1;

	always begin
		#5 clk = ~clk; ticks++;
		if(loadn & zero) $finish;
	end

  	initial begin
  	  	$dumpfile("vcd/timer.vcd");
  	  	$dumpvars;
		loadn=0;
  	  	#10 data = 3;
  	  	#10 data = 5;
		#10 data = 9;
  	  	#10 loadn =1; en = 1;
  	end

  //always @(zero) begin
  //  if(zero==1 & loadn==1) $finish;
  //end


  initial
    #1 $monitor(sec_ones, sec_tens, mins);

 
endmodule