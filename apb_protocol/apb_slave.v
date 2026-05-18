module apb_slave(
input PCLK,
input PRESETn,

input PSEL,
input PENABLE,
input PWRITE,

input [7:0] PADDR,
input [31:0] PWDATA,

output reg [31:0] PRDATA,
output PREADY,
output PSLVERR
);

reg [31:0] mem [0:3];
integer i;

assign PREADY  = 1'b1;
assign PSLVERR = 1'b0;

wire [1:0] addr = PADDR[3:2];

always @(posedge PCLK or negedge PRESETn) begin
    if(!PRESETn) begin
        for(i=0;i<4;i=i+1)
            mem[i] <= 32'd0;
    end
    else begin
        if(PSEL && PENABLE && PWRITE)
            mem[addr] <= PWDATA;
    end
end

always @(posedge PCLK or negedge PRESETn) begin
    if(!PRESETn)
        PRDATA <= 32'd0;
    else if(PSEL && PENABLE && !PWRITE)
        PRDATA <= mem[addr];
end

endmodule
