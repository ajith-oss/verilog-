module pipo_tb;
reg clk,reset;
reg [3:0] pin;
wire [3:0] q;
pipo dut(.reset(reset),.clk(clk),.pin(pin),.q(q));
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
pin=4'b0000;
$display("reset clk pin|q");
$monitor("%b %b %b|%b",reset,clk,pin,q);
#10 reset=0;
#10 pin=1011;
#10 pin=0110;
#10 pin=1110;
#10 pin=1100;
#10 reset=1;
#10 reset=0;
#10 pin=1010;
#20 $finish;
end
endmodule

