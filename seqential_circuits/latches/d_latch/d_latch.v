module d_latch(input d,en,output reg q,output qbar);
always @(*) begin
if(en) begin
q=d;
end
end
assign qbar=~q;
endmodule
