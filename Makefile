encoder:
	iverilog -o bin/encoder src/encoder/encoder.v testbenches/tb_encoder.v
	vvp bin/encoder

mod10:
	iverilog -o bin/mod10 src/timer/mod10.v testbenches/tb_mod10.v
	vvp bin/mod10

mod6:
	iverilog -o bin/mod6 src/timer/mod6.v testbenches/tb_mod6.v
	vvp bin/mod6

timer:
	iverilog -o bin/timer src/timer/mod10.v src/timer/mod6.v src/timer/timer.v testbenches/tb_timer.v
	vvp bin/timer

pencoder:
	iverilog -o bin/pencoder src/encoder/priority_encoder.v testbenches/tb_priorEncoder.v
	vvp bin/pencoder;

control:
	iverilog -o bin/control src/control/logic_control.v src/control/latch.v src/control/control.v testbenches/tb_control.v
	vvp bin/control