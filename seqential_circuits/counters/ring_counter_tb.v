module ring_counter_tb;
reg clk,reset;
wire [3:0] q;
ring_counter dut(.clk(clk),.reset(reset),.q(q));
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
#10 reset=0;
#80 $finish;
end
initial begin
$display("time\tclk\treset\tq");
$monitor("%0t\t%b\t%b\t%b",$time,clk,reset,q);
end
endmodule
