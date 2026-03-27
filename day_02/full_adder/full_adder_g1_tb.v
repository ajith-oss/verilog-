module full_adder_g2_tb;
reg a,b,cin;
wire sum,carry;
full_adder_g1 dut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
initial begin
$display("a b cin|sum carry");
$monitor("%b %b %b|%b %b",a,b,cin,sum,carry);
{a,b,cin}= 3'b000;#10;
{a,b,cin}= 3'b001;#10;
{a,b,cin}= 3'b010;#10;
{a,b,cin}= 3'b011;#10;
{a,b,cin}= 3'b100;#10;
{a,b,cin}= 3'b101;#10;
{a,b,cin}= 3'b110;#10;
{a,b,cin}= 3'b111;#10;
$dumpfile("wave.vcd");
$dumpvars(0);
$finish;
end
endmodule
