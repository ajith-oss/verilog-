module inverter_gen(input [7:0] a,output [7:0] y);
genvar i;
generate
for(i=0;i<8;i=i+1) begin : inv_block
assign y[i]=~a[i];
end
endgenerate
endmodule
