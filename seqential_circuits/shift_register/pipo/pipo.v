module pipo(input clk,reset,input [3:0]pin,output reg [3:0]q);
initial q<=0;
always @(posedge clk) begin
if(reset)
q<=4'b0000;
else
q<=pin;
end
endmodule
