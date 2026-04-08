module counter_tb;
reg clk,reset,enable;
wire [1:0] count;
counter dut(.clk(clk),.reset(reset),.enable(enable),.count(count));
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
enable=0;
#10 reset=0;
#10 enable=1;
#40 enable=0;
#20 enable=1;
#40 $finish;
end
initial begin
$monitor("time=%0t reset=%b clk=%b enable=%b count=%b",$time,reset,clk,enable,count);
end
endmodule
