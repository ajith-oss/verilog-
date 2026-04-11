module divisible_5(input clk,reset,x,output reg y);
parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;
reg [2:0] state,next_state;
always @(posedge clk or posedge reset) begin
if(reset)
state<=0;
else
state<=next_state;
end
always @(*) begin
case(state)
s0 : next_state = (x) ? s1:s0;
s1 : next_state = (x) ? s3:s2;
s2 : next_state = (x) ? s0:s4;
s3 : next_state = (x) ? s2:s1;
s4 : next_state = (x) ? s4:s3;
endcase
end
always @(*) begin
case(state)
s0 : y=1;
default : y=0;
endcase
end
endmodule
