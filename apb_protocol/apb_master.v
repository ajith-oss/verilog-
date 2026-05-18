module apb_master(

input PCLK,
input PRESETn,

input start,
input write,
input [7:0] addr,
input [31:0] wdata,

input PREADY,
input [31:0] PRDATA,

output reg PSEL,
output reg PENABLE,
output reg PWRITE,
output reg [7:0] PADDR,
output reg [31:0] PWDATA,

output reg [31:0] rdata,
output reg done
);

parameter IDLE=2'b00, SETUP=2'b01, ACCESS=2'b10;

reg [1:0] state, next_state;
reg [31:0] prdata_ff;

always @(posedge PCLK or negedge PRESETn) begin
    if(!PRESETn) state <= IDLE;
    else state <= next_state;
end

always @(*) begin
    case(state)
        IDLE:   next_state = start ? SETUP : IDLE;
        SETUP:  next_state = ACCESS;
        ACCESS: next_state = PREADY ? IDLE : ACCESS;
        default: next_state = IDLE;
    endcase
end

always @(posedge PCLK or negedge PRESETn) begin
    if(!PRESETn)
        prdata_ff <= 0;
    else
        prdata_ff <= PRDATA;
end

always @(posedge PCLK or negedge PRESETn) begin
    if(!PRESETn) begin
        PSEL<=0; PENABLE<=0; PWRITE<=0;
        PADDR<=0; PWDATA<=0;
        rdata<=0; done<=0;
    end
    else begin
        case(state)
            IDLE: begin
                PSEL<=0; PENABLE<=0; done<=0;
            end

            SETUP: begin
                PSEL<=1; PENABLE<=0;
                PADDR<=addr;
                PWRITE<=write;
                PWDATA<=wdata;
            end

            ACCESS: begin
                PSEL<=1; PENABLE<=1;
                if(PREADY) begin
                    done<=1;
                    if(!PWRITE) rdata<=prdata_ff;
                end
            end
        endcase
    end
end

endmodule

