module tlc_controller(
    input clk, 
	input rst,
	input cnt_done,
	output reg dp_rst,
	output reg [4:0] dp_value,
	output reg red,
 	output reg yellow,
	output reg green
);

reg [2:0] curr_state, next_state;
parameter [2:0] rr = 3'd0,
                wr = 3'd1,
				ry = 3'd2,
				wy = 3'd3,
				rg = 3'd4,
				wg = 3'd5;
				
//state register
always @(posedge clk)begin
    if(rst)begin
    curr_state <= rr;
    end
	else begin
    curr_state <= next_state;	
	end
end

//state logic 
always @(*)begin
    dp_rst = 0;
	dp_value = 0;
	red = 0;
	yellow = 0;
	green = 0;
	
	case(curr_state)
	    rr: begin
            dp_rst = 1;
	    	dp_value = 28;
	    	red = 1;
	    	
	    	next_state = wr;
        end
	    wr: begin
	        dp_rst = 0;
	    	red = 1;
	    	
	    	if(cnt_done == 1)next_state == ry;
	    	else next_state = wr;
	    end
	    ry: begin
            dp_rst = 1;
	    	dp_value = 3;
	    	yellow = 1;
	    	
	    	next_state = wy;
        end
	    wy: begin
	        dp_rst = 0;
	    	yellow = 1;
	    	
	    	if(cnt_done == 1)next_state == rg;
	    	else next_state = wy;
	    end
	    rg: begin
            dp_rst = 1;
	    	dp_value = 28;
	    	green = 1;
	    	
	    	next_state = wg;
        end
	    wg: begin
	        dp_rst = 0;
	    	green = 1;
	    	
	    	if(cnt_done == 1)next_state == rr;
	    	else next_state = wg;
	    end	
	endcase	
end
endmodule