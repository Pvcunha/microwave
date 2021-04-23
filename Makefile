encoder:
	iverilog -o bin/encoder src/encoder.v testbenches/tb_encoder.v
	vvp bin/encoder