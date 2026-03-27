module half_adder(input a,b,output sum,carry);
assign sum=a^b;
assign carry=a&b;
endmodule

module full_adder_data(input a,b,cin,output sum,cout);
wire s1,c1,c2;
assign s1=a^b;
assign c1=a&b;
assign sum=s1^cin;
assign c2=s1&cin;
assign cout=c1|c2;
endmodule
