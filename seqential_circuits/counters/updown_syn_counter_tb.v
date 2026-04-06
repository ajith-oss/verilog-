module updown_syn_tb;
reg clk,reset,up;
wire [2:0] q;
updown_syn dut (.reset(reset),.clk(clk),.q(q),.up(up));
always #5 clk=~clk;
initial begin
	clk=0;
	reset=1;
	up=0;
	#10 reset=0;
	#80 up=1;
	#80 $finish;
end
initial begin 
	$display("time\treset\tclk\tq\tup");
	$monitor("%0t\t%b\t%b\t%b\t%b",$time,reset,clk,q,up);
end
endmodule
