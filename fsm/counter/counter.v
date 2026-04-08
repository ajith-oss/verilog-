module counter(input clk,reset,enable,output reg [1:0] count);
parameter s0=0,s1=1,s2=2,s3=3;
reg[1:0] state,next_state;
always @(posedge clk or posedge reset) begin 
if(reset)
state<=0;
else
state<=next_state;
end
always @(*) begin
case(state)
s0 : next_state = (enable) ? s1:s0;
s1 : next_state = (enable) ? s2:s1;
s2 : next_state = (enable) ? s3:s2;
s3 : next_state = (enable) ? s0:s3;
default next_state = s0;
endcase
end
always @(*) begin
count=state;
end
endmodule
