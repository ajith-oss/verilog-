module half_sub_d2_tb;
reg a,b;
wire diff,bo;
half_sub_d1 dut(.a(a),.b(b),.diff(diff),.bo(bo));
initial begin
$display("a b|diff bo");
$monitor("%b %b|%b %b",a,b,diff,bo);
a=0;b=0;#2;
a=0;b=1;#2;
a=1;b=0;#2;
a=1;b=1;#2;
$dumpfile("wave.vcd");
$dumpvars(0,half_sub_d2_tb);
$finish;
end
endmodule
