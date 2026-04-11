module traffic_controller_tb;
reg clk,reset,traffic_ns,traffic_ew,emergency,pedestrain;
wire [2:0] ns_light;
wire [2:0] ew_light;
traffic_controller dut(.clk(clk),.reset(reset),.traffic_ns(traffic_ns),.traffic_ew(traffic_ew),.emergency(emergency),.pedestrain(pedestrain),.ns_light(ns_light),.ew_light(ew_light));
always #5 clk=~clk;
initial begin
clk=0;
reset=1;
emergency=0;
pedestrain=0;
traffic_ns=0;
traffic_ew=0;

  #10 reset = 0;
    #50;
    traffic_ns = 1;
    #100;
    traffic_ns =0;
    pedestrian = 1;
    #10 pedestrian = 0;
    #100;
    emergency = 1;
    #50;
    emergency = 0;
    #100;
    traffic_ew = 1;
    #100;
    traffic_ew = 0;
    #100;
    $finish;
    end
initial begin
	 $monitor("time=%0t | NS=%b EW=%b | emer=%b ped=%b t_ns=%b t_ew=%b",
              $time, ns_light, ew_light, emergency, pedestrian, traffic_ns, traffic_ew);
      $dumpfile("wave.vcd");
      $dumpfile(0);
      end
      endmodule




