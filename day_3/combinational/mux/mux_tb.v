module mux4to1_tb;
reg [3:0] d;
reg [1:0] s;
wire y;
mux4to1 uut(.d(d),.s(s),.y(y));
integer i;
initial begin
$display("s d|y");
$monitor("%b %b|%b",s,d,y);
for(i=0;i<64;i=i+1) begin
{s,d}=i;
#10;
end
$finish;
end
endmodule
