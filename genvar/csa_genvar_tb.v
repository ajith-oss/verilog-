module csa_tb;
parameter n=8;
reg [n-1:0] a,b;
reg cin;
wire [n-1:0] sum;
wire cout;
csa_gen #(n) dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
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
