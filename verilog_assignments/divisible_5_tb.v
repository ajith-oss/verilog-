module divisible_5_tb;
reg clk,reset,x;
wire y;
divisible_5 dut(.clk(clk),.reset(reset),.x(x),.y(y));
always #5 clk=~clk;
initial begin 
	clk=0;
	reset=1;
	x=0;
	#10 reset=0;
	#10 x=1;
	#10 x=0;
	#10 x=1;

	#10 x=1;
	#10 x=1;
	#10 x=0;
	
	#10 x=1;
	#10 x=1;
	#10 x=1;

	#10 x=1;
	#10 x=0;
	#10 x=1;
	#10 x=0;

#20 $finish;
end
initial begin
	$monitor("time=%0t clk=%b reset=%b x=%b y=%b",$time,clk,reset,x,y);
	$dumpfile("wave.vcd");
	$dumpvars(0);
end
endmodule
