/*module mux2to1(input d0,d1,s,output y);
assign y=(~s&d0|s&d1);
endmodule*/

//mux4*1
module mux4to1(input [3:0] d,input [1:0] s,output y);
assign y=(s==2'b00) ? d[0]:
(s==2'b01) ? d[1]:
(s==2'b10) ? d[2]:
             d[3];
endmodule
