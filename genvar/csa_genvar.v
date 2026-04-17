module csa_gen#(parameter n=8)(input [n-1:0] a,b,input cin,output [n-1:0] sum,output cout);
wire [n:0] carry;
wire carry[0]=cin;
genvar i;
generate
for(i=0;i<8;i=i+1) begin :fa_block
wire sum0,sum1;
wire c0,c1;
full_adder fa0(.a(a),.b(b),.cin(1'b0),.sum(sum0),.carry(c0));
full_adder fa1(.a(a),.b(b),.cin(1'b1),.sum(sum1),.carry(c1));
assign sum[i]=carry[i] ? sum0:sum1;
assign carry[i+1]=carry[i] ? c0:c1;
end
endgenerate
assign cout=carry[n];
endmodule
