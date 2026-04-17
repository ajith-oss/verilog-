module full_adder(input a,b,cin,output reg sum,carry);
task adder_full(input fa,fb,fin,output fsum,fcarry);
begin
fsum=fa^fb^fin;
fcarry=(fa&fb)|(fin&(fa^fb));
end
endtask
always @(*) begin
adder_full(a,b,cin,sum,carry);
end
endmodule
