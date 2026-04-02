module sipo_tb;
reg clk,reset,sin;
wire [3:0]q;
sipo dut(.clk(clk),.reset(reset),.sin(sin),.q(q));
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
sin=0;
$display(" reset clk sin | q");
$monitor("%b %b %b|%b",reset,clk,sin,q);
#10 reset=0;
#10 sin=1;
#10 sin=0;
#10 sin=1;
#10 sin=1;
#20 $finish;
end
endmodule


