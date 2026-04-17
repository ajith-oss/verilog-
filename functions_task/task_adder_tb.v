module full_adder_tb;
reg a,b,cin;
wire sum,carry;
full_adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
integer i;
initial begin
	$monitor("time=%0t a=%b b=%b cin=%b sum=%b carry=%b",$time,a,b,cin,sum,carry);
	for(i=0;i<8;i=i+1) begin
		{a,b,cin}=i;
		#10;
	end
	$finish;
end
endmodule
