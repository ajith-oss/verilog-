module half_sub_g1(input a,b,output diff,bo);
wire w1;
xor x1(diff,a,b);
not n1(w1,a);
and a1(bo,w1,b);
endmodule


