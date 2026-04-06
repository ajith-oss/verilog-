module updown_syn(input clk,input reset,input up,output reg [2:0] q);
always @(posedge clk or posedge reset) begin
if(reset)
q<=3'b000;
else begin
if(up)
	q<=q+1;
else
	q<=q-1;
end
end
endmodule
