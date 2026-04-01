module jk_latch(input en,j,k,output reg q,output qbar);
always @(*) begin
if(en) begin
case({j,k})
2'b00:q=q;
2'b01:q=0;
2'b10:q=1;
2'b11:q=~q;
endcase
end
end
assign qbar=~q;
endmodule
