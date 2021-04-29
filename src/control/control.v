`timescale 1ns/1ps

module control (
    startn,stopn,clearn,door_closed,timer_done,
    mag
);

    input  startn,stopn,clearn,door_closed,timer_done;
    output mag;
    wire  R,S;

    logic_control controle(.startn(startn),.stopn(stopn),.clearn(clearn),.door_closed(door_closed),.timer_done(timer_done),.S(S),.R(R));
    latch SR(.S(S),.R(R),.mag(mag));


endmodule