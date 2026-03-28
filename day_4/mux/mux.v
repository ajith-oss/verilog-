/*mux 2*1 using dataflow model
module mux2to1(input [1:0]d,input s,output y);
assign y=(~s&d[0]|s&d[1]);
endmodule*/
//mux 2*1 using behavioural model;
/*module mux2to1(input d0,d1,s,output reg y);
always @(*)
begin
	if(s==0)
	y=d0;
else
	y=d1;
end
endmodule*/

//mux4*1 using dataflow
/*module mux4to1(input [3:0]d,input [1:0]s,output y);
assign y=d[s];
endmodule*/
//4*1 mux using behavioural
module mux4to1(input [3:0]d,input[1:0]s,output reg y);
always @(*)
begin
	if(s==2'b00)
		y=d[0];
	else if(s==2'b01)
		y=d[1];
	else if(s==2'b10)
		y=d[2];
	else 
		y=d[3];
end
endmodule


