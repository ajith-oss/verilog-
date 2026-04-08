module moore_0101(input clk,reset,x,output reg y);
reg [2:0] state,new_state;
parameter s0=0,s1=1,s2=2,s3=3,s4=4;
always @(posedge clk or posedge reset) begin
if(reset)
state<=0;
else
state=new_state;
end
always @(*) begin
case(state)
s0 : new_state = (x) ? s1:s0;
s1 : new_state = (x) ? s1:s2;
s2 : new_state = (x) ? s3:s0;
s3 : new_state = (x) ? s1:s4;
s4 : new_state = (x) ? s3:s0;
default : new_state = s0;
endcase
end
always @(*) begin
case(state)
s4 : y=1;
default y=0;
endcase
end
endmodule



