module t_latch_tb;
reg en,t;
wire q,qbar;
t_latch dut(.en(en),.t(t),.q(q),.qbar(qbar));
integer i;
initial begin
$display("en t|q qbar");
$monitor("%b %b|%b %b",en,t,q,qbar);
en=1;
for(i=0;i<2;i=i+1) begin
t=i;
#10;
end
$finish;
end
endmodule
