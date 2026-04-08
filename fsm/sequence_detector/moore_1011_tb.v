module moore_1011_tb;
reg clk,reset,x;
wire y;
moore_1011 dut(.clk(clk),.reset(reset),.x(x),.y(y));
always #5 clk=~clk;
initial begin
$display("time\tclk\treset\tx\ty");
$monitor("%t0\t%b\t%b\t%b\t%b",$time,clk,reset,x,y);
clk=0;
reset=1;
x=0;
#12 reset=0;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=0;
#20 $finish;
end
endmodule
