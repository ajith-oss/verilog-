//half sub
module half_sub_d(input a,b,output diff,bout);
assign diff=(a^b);
assign bout=(~a&b);
endmodule
//ful sub
module full_sub_d(input a,b,bin,output diff,bout);
wire b1,c1,d1;
assign d1=(a^b);
assign b1=(~a&b);
assign diff=(d1^bin);
assign c1=(~d1&bin);
assign bout=b1|c1;
endmodule
