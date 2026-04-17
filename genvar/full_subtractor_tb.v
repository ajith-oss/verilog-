module ripple_sub_tb;
parameter n=4;
reg [n-1:0] a,b;
reg bin;
wire [n-1:0] diff;
wire bout;
ripple_sub_genvar #(n) dut(.a(a),.b(b),.bin(bin),.diff(diff),.bout(bout));
integer i;
initial begin
bin=0;
for(i=0;i<16;i=i+1) begin
{a,b}=i;
bin = i%2;
#10;
end
$finish;
end
initial begin
	$monitor("time=%0t a=%b b=%b bin=%b diff=%b bout=%b",$time,a,b,bin,diff,bout);
	$dumpfile("wave.vcd");
	$dumpvars(0);
end
endmodule
