module comparator_tb;
reg a,b;
wire a_gt_b;
wire a_eq_b;
wire a_ls_b;
integer i;
comparator dut(.a(a),.b(b),.a_gt_b(a_gt_b),.a_eq_b(a_eq_b),.a_ls_b(a_ls_b));
initial begin
$display("a b|a_gt_b|a_eq_b|a_ls_b");
$monitor("%b %b|%b|%b|%b",a,b,a_gt_b,a_eq_b,a_ls_b);
for(i=0;i<4;i=i+1) begin
{a,b}=i;
#1;
end
$finish;
end
endmodule

