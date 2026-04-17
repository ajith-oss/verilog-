module ripple_tb;
parameter N=4;
reg [N-1:0] a,b;
reg cin;
wire [N-1:0] sum;
wire cout;
ripple_carry #(N) dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
integer i;
initial begin
cin=0;
for(i=0;i<16;i=i+1) begin
{a,b}=i;
cin = i%2;
#10;
end
$finish;
end
initial begin
	$monitor("time=%0t a=%b b=%b cin=%b sum=%b cout=%b",$time,a,b,cin,sum,cout);
	$dumpfile("wave.vcd");
	$dumpvars(0);
end
endmodule

