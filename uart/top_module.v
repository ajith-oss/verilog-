module uart_top(
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,
    input rx,
    output tx,
    output tx_done,
    output [7:0] rx_data,
    output rx_done
);

wire tx_tick, rx_tick;

baud_gen_tx #(434) u1 (
    .clk(clk),
    .reset(reset),
    .tx_tick(tx_tick)
);

baud_gen_rx #(434) u2 (
    .clk(clk),
    .reset(reset),
    .rx_tick(rx_tick)
);

uart_tx u3 (
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx_tick(tx_tick),
    .tx(tx),
    .tx_done(tx_done)
);

uart_rx u4 (
    .clk(clk),
    .reset(reset),
    .rx(rx),
    .rx_tick(rx_tick),
    .rx_data(rx_data),
    .rx_done(rx_done)
);

endmodule
