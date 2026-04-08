module mealy_1010(input clk,reset,input x,output reg y);
reg [1:0] state,next_state;
parameter s0=0,s1=1,s2=2,s3=3;
always @(posedge clk or posedge reset) begin
if(reset)
state<=0;
else
state<=next_state;
end
always @(*) begin
	next_state=state;
	y=0;
case(state)
s0 : next_state = (x) ? s1:s0;
s1 : next_state = (x) ? s1:s2;
s2 : next_state = (x) ? s3:s0;
s3 : begin
if(x==0) begin
y=1;
next_state = s2;
end
else begin
next_state = s1;
end
end
endcase
end
endmodule
