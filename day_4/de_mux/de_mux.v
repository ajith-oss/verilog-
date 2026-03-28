module demux1to2_df(input a,input s,output d0,output d1);
assign d0=a&~s;
assign d1=a&s;
endmodule
module demux1to2_bf(input a,input s,output reg d0,output reg d1);
always @ (*) begin
d0=0;
d1=0;
if (s==0)
d0=a;
else
d1=a;
end
endmodule
module top_module(input a,input s,output d0_df,d1_df,output d0_bf,d1_bf);
demux1to2_df u1(.a(a),.s(s),.d0(d0_df),.d1(d1_df));
demux1to2_bf u2(.a(a),.s(s),.d0(d0_bf),.d1(d1_bf));
endmodule


