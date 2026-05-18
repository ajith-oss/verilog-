`timescale 1ns/1ps

module apb_tb;

reg PCLK;
reg PRESETn;

reg start;
reg write;
reg [7:0] addr;
reg [31:0] wdata;

wire [31:0] rdata;
wire done;

apb_top dut (
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .start(start),
    .write(write),
    .addr(addr),
    .wdata(wdata),
    .rdata(rdata),
    .done(done)
);

initial begin
    PCLK = 0;
    forever #5 PCLK = ~PCLK;
end

initial begin
    PRESETn = 0;
    #20 PRESETn = 1;
end

initial begin

    $monitor("time=%0t start=%b write=%b addr=%h wdata=%h rdata=%h done=%b",
              $time, start, write, addr, wdata, rdata, done);

    start = 0;
    write = 0;
    addr  = 0;
    wdata = 0;

    #25;

    addr  = 8'h08;
    wdata = 32'h12345678;
    write = 1;
    start = 1;

    #10;
    start = 0;

    wait(done);

    #20;

    addr  = 8'h08;
    write = 0;
    start = 1;

    #10;
    start = 0;

    wait(done);

    #20;
    $finish;

end

endmodule

