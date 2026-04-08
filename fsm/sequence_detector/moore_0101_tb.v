module moore_0101_tb;
reg clk,reset,x;
wire y;
moore_0101 dut(.clk(clk),.reset(reset),.x(x),.y(y));
always #5 clk=~clk;
initial begin
$monitor("time=%0t clk=%b reset=%b x=%b y=%b",$time,clk,reset,x,y);
clk=0;
reset=1;
x=0;
@(posedge clk) reset=0;
x=0;
@(posedge clk)
x=1;
@(posedge clk)
x=0;
@(posedge clk)
x=1;
@(posedge clk)
x=0;
@(posedge clk)
x=1;
@(posedge clk)
$finish;
end
endmodule 
