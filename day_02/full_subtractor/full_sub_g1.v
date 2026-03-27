module full_sub_g1(input a,b,bin,output diff,bout);
wire w1,w2,w3,w4,w5;
xor x1(w1,a,b);  //w1=a^b
xor x2(diff,w1,bin);
//carry logic
not(w2,a);
and(w3,w2,b); //w3=~a&b
and(w4,b,bin); //w4=b&bin 
and(w5,w2,bin); //w5=~a&bin
or(bout,w3,w4,w5);
endmodule
