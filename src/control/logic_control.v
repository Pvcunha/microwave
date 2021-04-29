`timescale 1ns/1ps

module logic_control (
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    input wire timer_done,
    output reg R,
    output reg S

);

    always @(startn or stopn or clearn or door_closed or timer_done)
    begin
        
        if(clearn || stopn || timer_done || !door_closed)
            begin
                S = 0;
                R = 1;
            end
        else if(startn && door_closed)
            begin
                S = 1;
                R = 0;
            end

      
    end




endmodule