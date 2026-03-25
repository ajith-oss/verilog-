module or_g2_tb;
reg a,b;
wire y;
or_gate_g1 uut(.a(a),.b(b),.y(y));
initial begin
$display("a b|y");
$monitor("%b %b|%b",a,b,y);
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
$dumpfile("wave.vcd");
$dumpvars(0,or_g2_tb);
$finish;
end
endmodule
