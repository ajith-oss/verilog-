module tb_uart;

reg clk = 0;
reg reset = 1;
reg tx_start = 0;
reg [7:0] data_in = 8'hA5;

wire tx;
wire tx_done;
wire [7:0] rx_data;
wire rx_done;

always #5 clk = ~clk;

uart_top dut(
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .data_in(data_in),
    .rx(tx),       
    .tx(tx),
    .tx_done(tx_done),
    .rx_data(rx_data),
    .rx_done(rx_done)
);

initial begin
    $monitor("time=%0t | tx=%b | tx_done=%b | rx=%b | rx_data=%b | rx_done=%b | data_in=%b",
             $time, tx, tx_done, tx, rx_data, rx_done,data_in);
clk=0;
   reset = 1;
    tx_start = 0;
    data_in = 8'h00;

    #20;
    reset = 0;
    #20;
    data_in = 8'hA5; 
    tx_start = 1;

    #10;
    tx_start = 0;
    #200000;
    data_in = 8'h3C;
    tx_start = 1;

    #10;
    tx_start = 0;

    #200000;

    $finish;
end

endmodule


