module tlc_top(
    input clk,
	input rst,
    output red,
	output yellow,
	output green
);
wire dp_rst, cnt_done;
wire [4:0] dp_val;

tlc_controller controller (
    .clk(clk),
	.rst(rst),
	.red(red),
	.yellow(yellow),
	.green(green),
	.cnt_done(cnt_done),
	.dp_rst(dp_rst),
	.dp_value(dp_val)
);

tlc_dp dp(
    .clk(clk),
	.rst(dp_rst),
	.cnt_done(cnt_done),
	.done_val(dp_val)
);

endmodule