module sr_latch(input s,r,input en,output reg q,output qbar);
always @(*) begin
if(en) begin
case({s,r})
2'b00:q=q;
2'b01:q=0;
2'b10:q=1;
2'b11:q=1'bx;
endcase
end
end
assign qbar=~q;
endmodule

