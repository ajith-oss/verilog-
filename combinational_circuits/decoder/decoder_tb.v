module decoder_tb;
reg [1:0]d;
wire[3:0]y;
decoder uut(.d(d),.y(y));
integer i;
initial begin
$display("d |y");
$monitor("%b |%b",d,y);
for(i=0;i<4;i=i+1) begin
d=i;
#10;
end
$finish;
end
endmodule
