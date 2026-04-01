module d_flip_flop_tb;
reg d,clk;
wire q;
d_flip_flop dut(.clk(clk),.d(d),.q(q));
always #5 clk=~clk;
initial begin
clk=0;
d=0;
#10 d=0;
#10 d=1;
#10 d=0;
#10 d=1;
#20 $finish;
end
initial begin
$display("clk d|q");
$monitor("%b %b|%b",clk,d,q);
end
endmodule
