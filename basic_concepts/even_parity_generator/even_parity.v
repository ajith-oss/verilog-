module even_parity_ha(input a,b,cin,output y);
assign y=a^b^cin;
endmodule
module even_parity_ba(input a,b,cin,output reg y);
always @(*) begin
y=a^b^cin;
end
endmodule
module top_module(input a,b,cin,output y_ha,output y_ba);
even_parity_ha u1(.a(a),.b(b),.cin(cin),.y(y_ha));
even_parity_ba u2(.a(a),.b(b),.cin(cin),.y(y_ba));
endmodule

