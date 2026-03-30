module bcd_segment_tb;
reg [3:0] a;
wire [6:0] seg;
bcd_segment dut(.a(a),.seg(seg));
integer i;
initial begin
$display("a |seg");
$monitor("%b |%b",a,seg);
for(i=0;i<10;i=i+1) begin 
a=i;
#10;
end
$finish;
end
endmodule
