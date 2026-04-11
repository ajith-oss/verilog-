module sequence_111000(input clk,reset,x,output reg y);
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6;
reg [2:0] state,next_state;
always @(posedge clk or posedge reset) begin
if(reset)
state<=s0;
else
state<=next_state;
end
always @(*) begin
case(state)
s0 : next_state = (x) ? s1:s4;
s1 : next_state = (x) ? s2:s4;
s2 : next_state = (x) ? s3:s4;
s3 : next_state = (x) ? s3:s4;
s4 : next_state = (x) ? s1:s5;
s5 : next_state = (x) ? s1:s6;
s6 : next_state = (x) ? s1:s6;
endcase
end
always @(*) begin
case(state)
s3,s6 : y=1;
default : y=0;
endcase
end
endmodule
