module adder_function(input a,b,cin,output sum,carry);
function add_sum(input fa,fb,fin);
begin
add_sum=fa^fb^fin;
end
endfunction
function add_carry(input fa,fb,fin);
begin
add_carry=(fa&fb)|(fin&(fa^fb));
end
endfunction
assign sum=add_sum(a,b,cin);
assign carry=add_carry(a,b,cin);
endmodule

