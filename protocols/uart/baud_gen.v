module baud_gen#(parameter clk_per_bit=5208)(
input clk,reset,enable,output reg baud_tick);
reg [12:0] count;
always @(posedge clk or posedge reset) begin
if(reset) begin
count<=0;
baud_tick<=0;
end
else if(enable) begin
if(count == clk_per_bit-1) begin
count<=0;
baud_tick<=1;
end
else begin
count<=count+1;
baud_tick<=0;
end
end
else begin
count<=0;
baud_tick<=0;
end
end
endmodule
