module full_adder_g1(input a,b,cin,output sum,carry);
wire w1,w2,w3;
xor x1(w1,a,b);  //w1=(a^b)
xor x2(sum,w1,cin);
//carry logic
and a1(w2,a,b);  //w2=a&b
and a2(w3,w1,cin);  //w3=w1&cin
or o1(carry,w2,w3);
endmodule

