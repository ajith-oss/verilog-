module uart_rx(
    input clk,
    input reset,
    input rx,
    input rx_tick,
    output reg [7:0] rx_data,
    output reg rx_done
);

parameter IDLE=0, START=1, DATA=2, STOP=3;

reg [1:0] state;
reg [2:0] bit_index;
reg [7:0] data_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        rx_done <= 0;
        rx_data <= 0;
        bit_index <= 0;
    end else begin
        rx_done <= 0;

        case(state)

        IDLE: begin
            if (rx == 0)
                state <= START;
        end

        START: begin
            if (rx_tick) begin
                bit_index <= 0;
                state <= DATA;
            end
        end

        DATA: begin
            if (rx_tick) begin
                data_reg[bit_index] <= rx;

                if (bit_index == 7)
                    state <= STOP;
                else
                    bit_index <= bit_index + 1;
            end
        end

        STOP: begin
            if (rx_tick) begin
                rx_data <= data_reg;
                rx_done <= 1;
                state <= IDLE;
            end
        end

        endcase
    end
end

endmodule


