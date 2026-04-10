module moore_10110_tb;
reg clk,reset,x;
wire y;
moore_10110 dut(.clk(clk),.reset(reset),.x(x),.y(y));
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
x=0;
@(posedge clk)
reset=0;
@(posedge clk) x=1;
@(posedge clk) x=0;
@(posedge clk) x=1;
@(posedge clk) x=1;
@(posedge clk) x=0;
@(posedge clk) x=1;
@(posedge clk) x=0;
#20 $finish;
end
initial begin
	$monitor("time=%0t ckl=%b reset=%b x=%b y=%b",$time,clk,reset,x,y);
	$dumpfile("wave.vcd");
	$dumpvars(0);
end
endmodule
