module moore_10110(input clk,reset,input x,output reg y);
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5;
reg [2:0] state,next_state;
always @(posedge clk or posedge reset) begin
if(reset)
state<=s0;
else
state<=next_state;
end
always @(*) begin
case(state)
 s0: next_state = (x) ? s1 : s0;        
        s1: next_state = (x) ? s1 : s2;        
        s2: next_state = (x) ? s3 : s0;        
        s3: next_state = (x) ? s4 : s2;
	s4: next_state = (x) ? s1 : s5;        
        s5: next_state = (x) ? s1 : s0;        
        default: next_state = s0;
endcase
end
always @(*) begin
y = (state==s5) ? 1:0;
end
endmodule
