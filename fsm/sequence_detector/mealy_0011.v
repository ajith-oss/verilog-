module mealy_0011(input clk,reset,input x,output reg y);
reg [1:0] state,next_state;
localparam s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
always @(posedge clk or posedge reset) begin
if(reset)
state<=s0;
else
state<=next_state;
end
always @(*) begin
case(state)
s0: next_state = (x==0) ? s1 : s0;
s1: next_state = (x==0) ? s2 : s0;
s2: next_state = (x==1) ? s3 : s2;
s3: next_state = (x==1) ? s0 : s1;
default: next_state = s0;
endcase
end
always @(*) begin
case(state)
s3: y = (x==1) ? 1 : 0;
default: y=0;
endcase
end
endmodule

