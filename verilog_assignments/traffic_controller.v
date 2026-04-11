module traffic_controller(input clk,reset,emergency,pedestrain,traffic_ns,traffic_ew,output reg[2:0] ns_light,output reg[2:0] ew_light);
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5;
reg [2:0] state,next_state;
reg [3:0] timer;
always @(posedge clk or posedge reset) begin
if(reset)
state<=s0;
else
state<=next_state;
end
always @(posedge clk or posedge reset) begin
if(reset)
timer<=0;
else if(state != next_state)
timer<=0;
else
timer<=timer+1;
end
always @(*) begin
case(state)
s0 : begin
if(emergency)
next_state=s5;
else if(pedestrain)
next_state=s4;
else if(timer == (traffic_ns ? 10:5))
next_state=s1;
else
next_state=s0;
end

s1 : begin
if(emergency)
next_state=s5;
else if(timer == 3)
next_state=s2;
else
next_state=s1;
end

s2 : begin
if(emergency)
next_state=s5;
else if(timer == (trafic_ew ? 10:5))
next_state=s3;
else if(pedestrain)
next_state=s4;
else
next_state=s2;
end

s3 : begin
if(emergency)
next_state=s5;
else if(timer == 3)
next_state=s0;
else
next_state=s3;
end

s4 : begin
if(emergency)
next_state=s5;
else if(timer == 4)
next_state=s0;
else
next_state=s4;
end

s5 : begin 
if(!emergency)
next_state=s0;
else
next_state=s5;
end
endcase
end

always @(*) begin
ns_light=3'b100;
ew_light=3'b100;
case(state)
s0 : begin
ns_light=3'b001;
ew_light=3'b100;
end

s1 : begin
ns_light=3'b010;
ew_light=3'b100;
end

s2 : begin
ns_light=3'b100;
ew_light=3'b001;
end

s3 : begin
ns_light=3'b100;
ew_light=3'b010;
end

s4 : begin
ns_light=3'b100;
ew_light=3'b100;
end

s5 : begin
ns_light=3'b100;
ew_light=3'b100;
end
endcase
end
endmodule




