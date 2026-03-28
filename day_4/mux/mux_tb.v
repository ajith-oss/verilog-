//test bench for mux2*1 datflow model
/*module mux2to1_tb;
reg [1:0] d;
reg s;
wire y;
mux2to1 uut(.d(d),.s(s),.y(y));
integer i;
initial begin
$display("s d0 d1|y");
$monitor("%b %b %b|%b",s,d[0],d[1],y);
for (i=0;i<8;i=i+1) begin
{s,d}=i;
#10;
end
$finish;
end
endmodule*/
//test bench for mux2*1 behavioural model
/*module mux2to1_tb;
reg d0,d1,s;
wire y;
mux2to1 uut(.d0(d0),.d1(d1),.s(s),.y(y));
integer i;
initial begin
	$display("s d0 d1|y");
	$monitor("%b %b %b|%b",d0,d1,s,y);
	for(i=0;i<8;i=i+1) begin
		{s,d0,d1}=i;
		#10;
	end
	$finish;
end
endmodule*/

module mux4to1_tb;
reg [3:0] d;
reg [1:0] s;
wire y;
mux4to1 uut(.d(d),.s(s),.y(y));
integer i;
initial begin
$display("s d|y");
$monitor("%b %b|%b",s,d,y);
for (i=0;i<64;i=i+1) begin
{s,d}=i;
#10;
end
$finish;
end
endmodule


