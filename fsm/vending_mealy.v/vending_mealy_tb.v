module vending_mealy_tb;
reg clk,reset;
reg [1:0] coin;
wire dispense,change;
vending_mealy dut(.clk(clk),.reset(reset),.coin(coin),.dispense(dispense),.change(change));
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
coin=2'b00;
 #12 reset = 0; 

    @(posedge clk);
    coin = 2'b01;

    @(posedge clk);
    coin = 2'b01;
    @(posedge clk);
    coin = 2'b00;

    @(posedge clk);
    coin = 2'b10;
    @(posedge clk);
    coin =2'b00;

    @(posedge clk);
    coin = 2'b01;

    @(posedge clk);
    coin = 2'b10;
    @(posedge clk);
    coin = 2'b00;

    #20 $finish;
end
initial begin
$dumpfile("wave.vcd");
$dumpvars(0);
$monitor("time=%0t clk=%b reset=%b coin=%b dispense=%b change=%b state=%b next_state=%b",$time,clk,reset,coin,dispense,change,dut.state,dut.next_state);
end
endmodule

