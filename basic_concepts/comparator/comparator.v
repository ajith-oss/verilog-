module comparator(input a,b,output a_gt_b,a_eq_b,a_ls_b);
assign a_gt_b=a&(~b);
assign a_eq_b=(a&b)|(~a&~b);
assign a_ls_b=~a&b;
endmodule
