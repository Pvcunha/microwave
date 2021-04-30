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

decoder:
	iverilog -o bin/decoder src/decoder/bcd_seven.v src/decoder/decoder.v testbenches/tb_decoder.v
	vvp bin/decoder

encoder:
	iverilog -o bin/encoder src/encoder/Debounce.v src/encoder/DivideBy100.v src/encoder/mux_2to1.v src/encoder/priority_encoder.v src/encoder/encoder.v testbenches/tb_encoder.v
	vvp bin/encoder

all:
	iverilog -o bin/microwave src/timer/mod10.v src/timer/mod6.v src/timer/timer.v src/control/logic_control.v src/control/latch.v src/control/control.v src/decoder/bcd_seven.v src/decoder/decoder.v src/encoder/Debounce.v src/encoder/DivideBy100.v src/encoder/mux_2to1.v src/encoder/priority_encoder.v src/encoder/encoder.v src/microwave.v
	vvp bin/microwave