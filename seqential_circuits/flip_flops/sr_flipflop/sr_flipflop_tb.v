module sr_flipflop_tb;
reg clk,s,r;
wire q;
sr_flipflop dut(.clk(clk),.s(s),.r(r),.q(q));
always #5 clk=~clk;
integer i;
initial begin
clk=0;
s=0;r=0;
#10 s=0;r=0;
#10 s=1;r=0;
#10 s=0;r=1;
#10 s=1;r=1;
#10 s=0;r=0;
#20 $finish;
end
initial begin
$display("clk s r|q");
$monitor("%b %b %b|%b",clk,s,r,q);
end
endmodule


