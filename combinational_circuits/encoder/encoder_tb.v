
/*module encoder4to2_tb;
reg [3:0]d;
wire [1:0]y;
encoder4to2 dut(.d(d),.y(y));
initial begin
$display("d |y");
$monitor("%b |%b",d,y);
d=4'b0001;#10;
d=4'b0010;#10;
d=4'b0100;#10;
d=4'b1000;#10;

d=4'b0000;#10;
d=4'b0101;#10;
d=4'b1010;#10;
d=4'b1111;#10;



$finish;
end
endmodule*/

module encoder4to2_tb;
reg [3:0]d;
wire[1:0]y;
encoder4to2 dut(.d(d),.y(y));
integer i;
initial begin
	$display("d |y");
	$monitor("%b |%b",d,y);
	for(i=0;i<16;i=i+1) begin
		d=i;
		#10;

end
$finish;
end
endmodule
