//half sub
module half_sub_g(input a,b,output diff,bout);
wire w1;
xor x1(diff,a,b);
not (w1,a);
and (bout,w1,b);
endmodule
//full sub
module full_sub_g(input a,b,bin,output diff,bout);
wire d1,b1,b2;
half_sub_g hs1(.a(a),.b(b),.diff(d1),.bout(b1));
half_sub_g hs2(.a(d1),.b(bin),.diff(diff),.bout(b2));
or (bout,b1,b2);
endmodule
