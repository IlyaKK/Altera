module binary_John_counter (clock,count);
parameter digits = 4;
parameter direction = "up";
parameter max = 16;
input clock;
output reg [digits-1:0] count = 0;
generate
if (direction == "up") always @(posedge clock) if (count == max - 1) count <= 0; else count <= count + 1;
else
if (direction == "down") always @(posedge clock) count <= {~count[0],count[digits-1:1]};
else begin
reg dir = 0;
wire reverse;
assign reverse = ( dir && count == 1) || (~dir && count == max - 2);
always @(posedge clock) if (reverse) dir <= ~dir;
always @(posedge clock) if (dir) count <= {~count[0],count[digits-1:1]};else if(count == 15)count <= count-7;
    else count <= count + 1;
end
endgenerate
endmodule
