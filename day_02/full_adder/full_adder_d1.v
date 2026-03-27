module full_adder_d1(input a,b,cin,output sum,carry);
assign sum=(a^b^cin);
assign carry=(a&b|cin&(a^b));
endmodule

