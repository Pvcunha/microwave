encoder:
	iverilog -o bin/encoder src/encoder.v testbenches/tb_encoder.v
	vvp bin/encoder

mod10:
	iverilog -o bin/mod10 src/timer/mod10.v testbenches/tb_mod10.v
	vvp bin/mod10
