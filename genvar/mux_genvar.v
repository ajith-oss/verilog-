module mux_genvar(input [3:0] a,b,input sel,output [3:0] y);
genvar i;
generate
for(i=0;i<4;i=i+1) begin : mux_block
assign y[i] = sel ? a[i] : b[i];
end
endgenerate
endmodule
