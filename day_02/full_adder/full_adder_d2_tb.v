module full_adder_d2_tb;
reg a,b,cin;
wire sum,carry;
full_adder_d1 dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
initial begin
$display("a b cin|sum carry");
$monitor("%b %b %b|%b %b",a,b,cin,sum,carry);
{a,b,cin}= 3'b000;#2;
{a,b,cin}= 3'b001;#2;
{a,b,cin}= 3'b010;#2;
{a,b,cin}= 3'b011;#2;
{a,b,cin}= 3'b100;#2;
{a,b,cin}= 3'b101;#2;
{a,b,cin}= 3'b110;#2;
{a,b,cin}= 3'b111;#2;
$dumpfile("wave.vcd");
$dumpvars(0);
$finish;
end
endmodule
