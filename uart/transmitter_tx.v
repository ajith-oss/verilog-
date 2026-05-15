module uart_tx(
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,
    input tx_tick,
    output reg tx,
    output reg tx_done
);

parameter IDLE=0, START=1, DATA=2, STOP=3;

reg [1:0] state;
reg [7:0] data_reg;
reg [2:0] bit_index;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        tx <= 1'b1;
        tx_done <= 0;
        bit_index <= 0;
    end else begin
        tx_done <= 0;

        case (state)

        IDLE: begin
            tx <= 1'b1;
            bit_index <= 0;
            if (tx_start) begin
                data_reg <= data_in;
                state <= START;
            end
        end

        START: begin
            tx <= 0;
            if (tx_tick)
                state <= DATA;
        end

        DATA: begin
            if (tx_tick) begin
                tx <= data_reg[bit_index];

                if (bit_index == 7)
                    state <= STOP;
                else
                    bit_index <= bit_index + 1;
            end
        end

        STOP: begin
            tx <= 1;
            if (tx_tick) begin
                tx_done <= 1;
                state <= IDLE;
            end
        end

        endcase
    end
end

endmodule
