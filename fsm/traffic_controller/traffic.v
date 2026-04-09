module traffic(input clk,reset,output reg [2:0] A,output reg [2:0] B);
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011;
reg [2:0] state,next_state;
always @(posedge clk or posedge reset) begin
if(reset)
state<=s0;
else
state<=next_state;
end
always @(*) begin
case(state)
s0 : next_state=s1;
s1 : next_state=s2;
s2 : next_state=s3;
s3 : next_state=s0;
default : next_state=s0;
endcase
end
always @(*) begin
case(state)
s0: begin
A=3'b001;
B=3'b100;
end
s1: begin
A=3'b010;
B=3'b100;
end
s2: begin
A=3'b100;
B=3'b001;
end
s3: begin
A=3'b100;
B=3'b010;
end
endcase
end
endmodule
