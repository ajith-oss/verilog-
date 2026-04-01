module trafic_controller_tb;
reg main_sensor;
reg side_sensor;
wire main_red,side_red;
wire main_green,side_green;
traffic_controller uut(.main_sensor(main_sensor),.side_sensor(side_sensor),.main_green(main_green),.main_red(main_red),.side_green(side_green),.side_red(side_red));
integer i;
initial begin
$display("main_sensor side_sensor|main_green main_red side_green side_red");
$monitor("%b %b|%b %b %b %b",main_sensor,side_sensor,main_green,main_red,side_green,side_red);
for(i=0;i<4;i=i+1) begin
{main_sensor,side_sensor}=i;
#1;
end
$finish;
end
endmodule
