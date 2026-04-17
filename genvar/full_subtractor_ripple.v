module full_sub_genvar(input a,b,bin,output diff,bout);
assign diff=a^b^bin;
assign bout=(~a & b) | (~(a ^ b) & bin);
endmodule
module ripple_sub_genvar#(parameter n=4)(input [n-1:0] a,b,input bin,output [n-1:0] diff,output bout);
wire [n:0] borrow;
assign borrow[0]=bin;
genvar i;
generate
for(i=0;i<4;i=i+1) begin : sub_block;
full_sub_genvar sub(.a(a[i]),.b(b[i]),.bin(borrow[i]),.diff(diff[i]),.bout(borrow[i+1]));
end
endgenerate
assign bout=borrow[n];
endmodule
