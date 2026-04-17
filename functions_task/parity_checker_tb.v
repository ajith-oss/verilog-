module parity_transmitter_tb;
reg clk,start;
reg [7:0] data_in;
wire serial_out;
parity_transmitter dut (.clk(clk),.start(start),.data_in(data_in),.serial_out(serial_out));
always #5 clk=~clk;
initial begin
	clk=0;
	start=0;
	data_in=8'b0;
	#10;
	data_in=8'b00000101;
	#10 start=1;
	#10 start=0;
	#120;
	data_in=8'b00001101;
	#10 start=1;
	#10 start=0;
	#120 $finish;
end
initial begin
	$monitor("time=%0t clk=%b start=%b data_in=%b serial_out=%b",$time,clk,start,data_in,serial_out);
	$dumpfile("wave.vcd");
	$dumpvars(0);
end
endmodule


