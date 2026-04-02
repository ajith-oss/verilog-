module siso_r_tb;
reg clk,din,reset;
wire dout;
siso_r dut(.reset(reset),.clk(clk),.din(din),.dout(dout));
always #5 clk=~clk;
integer i;
reg [7:0]data;
initial begin
$display(" reset clk din |dout");
$monitor("%b %b %b|%b",reset,clk,din,dout);
clk=0;
reset=1;
din=0;
#10 reset=0;
data=8'b10110100;
for (i=7;i>=0;i=i-1) begin
din=data[i];
#10;
end
#20 $finish;
end
endmodule

