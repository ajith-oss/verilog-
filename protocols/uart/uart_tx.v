module uart_tx(input clk,reset,tx_start,baud_tick,input [7:0] data_in,output reg tx,busy);
parameter idle=2'b00,start=2'b01,data=2'b10,stop=2'b11;
reg [1:0] state,next_state;
reg [2:0] bit_index;
reg [7:0] data_reg;
always @(posedge clk or posedge reset) begin
if(reset)
state<=idle;
else
state<=next_state;
end
always @(*) begin
case(state)
idle : begin
if(tx_start)
next_state=start;
else
nex_state=idle;
end

start :  begin
if(baud_tick)
next_stat=data;
else
next_state=start;
end

data : begin
if(baud_tick && bit_index == 7)
next_state=stop;
else
next_state=data;
end

stop : begin
if(baud_tick)
next_state=idle;
else
next_state=stop;
end

default : 
next_state=idle;

endcase
end

always @(posedge clk or posedge reset) begin
if(reset) begin
tx<=1;
busy<=0;
bit_index<=0;
data_reg<=0;
end
case(state)
idle : begin
tx<=1;
busy<=0;
bit_index<=0;
data_reg<=0
if(tx_start)
data_reg<=data_in;
busy<=1;
end

start : begin
tx<=0;
end

data : begin
if(baud_tick) begin
tx<=data_reg[bit_index];
if(bit_index<7)
bit_index<=bit_index+1;
end
end

stop : begin
tx<=1;
end
endcase
endmodule
