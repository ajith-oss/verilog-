module vending_mealy(input clk,reset,input [1:0] coin,output reg dispense,change);
parameter s0=2'b00,s1=2'b01;
reg [1:0] state,next_state;
always @(posedge clk or posedge reset) begin
if(reset)
	state<=s0;
else
	state<=next_state;
end
always @(*) begin
	dispense=0;
	change=0;
	next_state=state;
	case(state)
		s0: begin
			if(coin == 2'b01)
				next_state=s1;
			else if(coin == 2'b10) begin
				dispense=1;
			        next_state=s0;
		end
	end
		s1: begin
			if(coin == 2'b01) begin
				dispense=1;
			        next_state=s0;
				end else if(coin == 2'b10) begin
				dispense=1;
			        change=1;
			        next_state=s0;
		end
	end
endcase
end
endmodule

