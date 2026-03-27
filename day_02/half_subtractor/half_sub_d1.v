module half_sub_d1(input a,b,output diff,bo);
assign diff =a^b;
assign bo =(~a)&b;
endmodule
