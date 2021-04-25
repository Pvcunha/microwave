encoder:
	iverilog -o bin/encoder src/encoder.v testbenches/tb_encoder.v
	vvp bin/encoder

mod10:
	iverilog -o bin/mod10 src/timer/mod10.v testbenches/tb_mod10.v
	vvp bin/mod10

mod6:
	iverilog -o bin/mod6 src/timer/mod6.v testbenches/tb_mod6.v
	vvp bin/mod6
