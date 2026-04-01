module priority_encoder_tb;
reg [3:0]d;
wire [1:0]y;
priority_encoder uut(.d(d),.y(y));
integer i;
initial begin 
$display("d   |y");
$monitor("%b  |%b",d,y);
for(i=0;i<16;i=i+1) begin
d=i;
#10;
end
$finish;
end
endmodule
