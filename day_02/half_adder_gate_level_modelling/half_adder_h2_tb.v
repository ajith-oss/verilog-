module half_adder_h2_tb;
reg a,b;
wire sum,carry;
half_adder dut(.a(a),.b(b),.sum(sum),.carry(carry));
initial begin
$display("a b | sum carry");
$monitor("%b %b|%b %b",a,b,sum,carry);
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
$dumpfile("wave.vcd");
$dumpvars(0,half_adder_h2_tb);
$finish;
end
endmodule

