module traffic_tb;
reg clk,reset;
wire [2:0] A;
wire [2:0] B;
traffic dut(.clk(clk),.reset(reset),.A(A),.B(B));
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
#10 reset=0;
#100 $finish;
end
initial begin
$dumpfile("wave.vcd");
$dumpvars(0);
$monitor("time=%0t clk=%b reset=%b A=%b B=%b",$time,clk,reset,A,B);
end
endmodule
