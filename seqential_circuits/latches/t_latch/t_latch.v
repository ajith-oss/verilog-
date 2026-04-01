module t_latch(input en,t,output reg q,output qbar);
initial q=0;
always @(*) begin
if(en) begin
if (t)
q=~q;
else
q=q;
end
end 
assign qbar=~q;
endmodule
