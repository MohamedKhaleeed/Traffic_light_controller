module tlc_dp (
    input clk,
	input rst,
	input [4:0] done_val,
	output reg cnt_done
);

reg [4:0] counter;

always @(posedge clk, posedge rst)begin
    if(rst)begin
        counter <= 0;
        cnt_done <= 0;		
	end
	else begin
        counter <= counter + 1;
        
        if(done_val == counter)begin
            cnt_done = 1;
        end
        else begin
            cnt_done <= 0;
        end
		
	end
end
endmodule