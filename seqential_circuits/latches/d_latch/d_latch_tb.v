module d_latch_tb;
reg d,en;
wire q,qbar;
d_latch dut(.d(d),.en(en),.q(q),.qbar(qbar));
integer i;
initial begin
$display("en d|q qbar");
$monitor("%b %b|%b %b",en,d,q,qbar);
en=1;
for(i=0;i<2;i=i+1)begin
d=i;
#10;
end
en=0;d=0;#10;
en=0;d=1;#10;
$finish;
end
endmodule
