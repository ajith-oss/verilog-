module tb;
reg a,s;
wire d0_df,d1_df,d0_bf,d1_bf;
top_module uut(.a(a),.s(s),.d0_df(d0_df),.d1_df(d1_df),.d0_bf(d0_bf),.d1_bf(d1_bf));
initial begin
$display("d s|DF(d0 d1)|BF(d0 d1)");
$monitor("%b %b|%b %b|%b %b",a,s,d0_df,d1_df,d0_bf,d1_bf);
a=1;
s=0;#10;
s=1;#10;
a=0;
s=0;#10;
s=1;#10;
$finish;
end
endmodule
