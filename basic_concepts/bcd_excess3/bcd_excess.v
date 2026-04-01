module bcd_excess(input [3:0]bcd,output [3:0]exc);
assign exc=bcd+4'b0011;
endmodule
