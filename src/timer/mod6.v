module mod6(output reg [3:0] out,
                     output reg tc, zero,
                     input wire [3:0] data,
                     input wire loadn, clrn, clk, en);

always @(posedge clk or negedge clrn) begin

  if(!clrn)
    out <= 0;
  else if(!loadn)
    out <= data;

  else begin
    if (en)
      begin
        if(out==1)
          begin
            out<=out-1;
            #20 tc<=1;
          end
        else if(out==0)
          begin
            tc<=0;
            zero<=1;
            out<=5;
          end
        else begin
          tc<=0;
          zero<=0;
          out<=out-1;        
        end
      end  
    else
      begin
        tc<=0;
      end    
  end
end
endmodule