module and_gate_d2_tb;
reg a,b;
wire y;
and_gate_d1 uut(.a(a),.b(b),.y(y));
initial begin
$display("a b| y");
$monitor("%b %b| %b",a,b,y);
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
$dumpfile("wave.vcd");
$dumpvars(0,and_gate_d2_tb);
$finish;
end
endmodule

