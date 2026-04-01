module odd_parity(input a,b,cin,p,output reg error);
always @(*) begin
error=~(a^b^cin^p);
end
endmodule

