module fsm_cc4_3A
(output reg gnt,
input dly, done, req, clk, rst_n);
parameter [1:0] IDLE = 2'b00,
BBUSY = 2'b01,
BWAIT = 2'b10,
BFREE = 2'b11;
reg [1:0] state, next;
always @(posedge clk or negedge rst_n)
if (!rst_n) state <= IDLE;
else state <= next;
always @(state or dly or done or req) begin
next = 2'bx;
case (state)
IDLE : if (req) next = BBUSY;
else next = IDLE;
BBUSY: if (!done) next = BBUSY;
else if ( dly) next = BWAIT;
else next = BFREE;
BWAIT: if (!dly) next = BFREE;
else next = BWAIT;
BFREE: if (req) next = BBUSY;
else next = IDLE;
endcase
end
always @(posedge clk or negedge rst_n)
if (!rst_n) gnt <= 1'b0;
else begin
gnt <= 1'b0;
case (next)
IDLE, BFREE: ; // default outputs
BBUSY, BWAIT: gnt <= 1'b1;
endcase
end
endmodule