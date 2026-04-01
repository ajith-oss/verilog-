module jk_latch_tb;
reg en,j,k;
wire q,qbar;
jk_latch dut(.j(j),.k(k),.en(en),.q(q),.qbar(qbar));
integer i;
initial begin
$display("en j k|q qbar");
$monitor("%b %b %b|%b %b",en,j,k,q,qbar);
en=1;
for(i=0;i<4;i=i+1) begin
{j,k}=i;
#10;
end
en=0;j=0;k=0;#10;
en=0;j=1;k=1;#10;
$finish;
end
endmodule
