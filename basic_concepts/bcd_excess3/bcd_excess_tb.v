module bcd_excess_tb;
reg [3:0] bcd;
wire [3:0]exc;
bcd_excess uut(.bcd(bcd),.exc(exc));
integer i;
initial begin
$display("bcd |exc");
$monitor("%b  |%b",bcd,exc);
for(i=0;i<10;i=i+1) begin
bcd=i;
#10;
end
$finish;
end
endmodule
