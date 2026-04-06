module mealy_0011_tb;
reg clk,reset,x;
wire y;
mealy_0011 dut(.clk(clk),.reset(reset),.x(x),.y(y));
always #5 clk=~clk;
initial begin
	$display("time clk reset x y");
clk=0;
reset=1;
x=0;
#10 reset=0;
#10 x=0;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=0;
#10 x=1;
#10 x=1;
#20 $finish;
end
always @(clk) begin
	$display("%0t %b %b %b %b",$time,clk,reset,x,y);
end 
endmodule
