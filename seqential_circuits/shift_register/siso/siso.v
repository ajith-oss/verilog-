module siso_r(input din,clk,reset,output reg dout);
reg q1,q2,q3;
always @(posedge clk) begin
if(reset) begin
q1<=0;
q2<=0;
q3<=0;
dout<=0;
end
else begin 
q1<=din;
q2<=q1;
q3<=q2;
dout<=q3;
end
end
endmodule
