module parity_transmitter(input [7:0] data_in,input start,clk,output reg serial_out);
function parity_check(input [7:0] d);
begin
parity_check=^d;
end
endfunction
task send_packet(input [7:0] p_data);
reg p_bit;
integer i;
begin
p_bit=parity_check(p_data);
for(i=0;i<8;i=i+1) begin
@(posedge clk);
serial_out=p_data[i];
end
@(posedge clk);
serial_out=p_bit;
@(posedge clk);
serial_out=1'b1;
end
endtask
initial serial_out=1'b1;
always @(posedge start) begin
send_packet(data_in);
end
endmodule
