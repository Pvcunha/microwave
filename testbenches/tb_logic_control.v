`timescale 1ns/1ps

module tb_latch;

    reg  startn,stopn,clearn,door_closed,timer_done;
    wire S,R;
    integer i;
    

    logic_control l(.startn(startn),.stopn(stopn),.clearn(clearn),.door_closed(door_closed),.timer_done(timer_done),.S(S),.R(R));

    initial begin

        startn = 1; 
        stopn = 0;
        clearn = 0;
        door_closed = 1;
        timer_done = 0;
        #2
        $display("Start: %b, Stop: %b, clearn: %b, boor_closeb: %b, timer_bone: %b",startn,stopn,clearn,door_closed,timer_done);
        #2;
        $display("S : %b R : %b",S,R);  
        for(i = 0; i<10;i = i+1)begin
            startn = $urandom%2; 
            stopn =$urandom%2;
            clearn = $urandom%2;
            door_closed =  $urandom%2;
            timer_done =  $urandom%2;
            #2;
            $display("Start: %b, Stop: %b, clearn: %b, boor_closeb: %b, timer_bone: %b",startn,stopn,clearn,door_closed,timer_done); 
            #2;
            $display("S : %b R : %b",S,R);  
            #20;
        end


    end

    initial begin
        $dumpfile("logic.vcd");
        $dumpvars;
    end
    
    


endmodule