module apb_top(
    input         PCLK,
    input         PRESETn,
    input         start,
    input         write,
    input  [7:0]  addr,
    input  [31:0] wdata,
    output [31:0] rdata,
    output        done);
    wire        PSEL;
    wire        PENABLE;
    wire        PWRITE;
    wire [7:0]  PADDR;
    wire [31:0] PWDATA;
    wire [31:0] PRDATA;
    wire        PREADY;
    wire        PSLVERR;

    apb_master master_inst (

        .PCLK(PCLK),
        .PRESETn(PRESETn),

        .start(start),
        .write(write),
        .addr(addr),
        .wdata(wdata),

        .PREADY(PREADY),
        .PRDATA(PRDATA),

        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),

        .rdata(rdata),
        .done(done)

    );

    apb_slave slave_inst (

        .PCLK(PCLK),
        .PRESETn(PRESETn),

        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),

        .PRDATA(PRDATA),
        .PREADY(PREADY),
        .PSLVERR(PSLVERR)

    );

endmodule
