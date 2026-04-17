module mux_genvar_tb;
reg [3:0] a,b;
reg sel;
wire [3:0] y;
mux_genvar dut(.a(a),.b(b),.sel(sel),.y(y));
initial begin
a=4'b0001;
b=4'b1000;
sel=1'b0;
#10
sel=1'b1;
#10
a=4'b1100;
b=4'b1010;
sel=1'b1;
#10
sel=1'b0;
#10 $finish;
end
initial begin
$monitor("time=%0t a=%b b=%b sel=%b y=%b",$time,a,b,sel,y);
$dumpfile("wave.vcd");
$dumpvars(0);
end
endmodule
