module ripple_counter(input clk,input reset,output [2:0] q);
reg [2:0] temp=3'b000;
always @(posedge clk or posedge reset) begin
if(reset)
temp[0]<=0;
else
temp[0]<=~temp[0];
end
always @(negedge temp[0] or posedge reset) begin
if(reset)
temp[1]<=0;
else
temp[1]<=~temp[1];
end
always @(negedge temp[1] or posedge reset) begin
if(reset)
temp[2]<=0;
else
temp[2]<=~temp[2];
end
assign q=temp;
endmodule
