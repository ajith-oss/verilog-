module traffic_controller(input main_sensor,side_sensor,
output reg main_red,side_red,
output reg main_green,side_green);
always @(*) begin
if(side_sensor) begin
main_green=0;main_red=1;
side_green=1;side_red=0;
end
else begin
main_green=1;main_red=0;
side_green=0;side_red=1;
end
end
endmodule
