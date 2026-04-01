module odd_parity_generator_tb;
reg a,b,cin,p;
wire error;
integer i;
integer total_ones;
odd_parity uut(.a(a),.b(b),.cin(cin),.p(p),.error(error));
initial begin
$display("a b cin p|error|total_ones|excepted_parity");
$display("-----------------------------------------------");
for(i=0;i<16;i=i+1) begin
{a,b,cin,p}=i;
#1;
total_ones=a+b+cin+p;
if(total_ones%2==1)
$display("%b %b %b %b|%b|%d   |odd(correct)",a,b,cin,p,error,total_ones);
else
$display("%b %b %b %b|%b|%d   |even(wrong)",a,b,cin,p,error,total_ones);
end
$finish;
end
endmodule
