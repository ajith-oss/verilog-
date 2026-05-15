module baud_gen_rx #(parameter clk_per_bit = 434)
(
    input clk,
    input reset,
    output reg rx_tick
);

reg [15:0] count;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        count <= 0;
        rx_tick <= 0;
    end
    else
    begin
        if(count == clk_per_bit-1)
        begin
            count <= 0;
            rx_tick <= 1'b1;
        end
        else
        begin
            count <= count + 1;
            rx_tick <= 1'b0;
        end
    end
end

endmodule

