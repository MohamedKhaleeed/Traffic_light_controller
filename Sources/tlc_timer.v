`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 01:01:58 PM
// Design Name: 
// Module Name: tlc_timer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tlc_timer#(
    parameter n = 13)(
    input clk, reset_n,
    input [n-1 : 0] final_value,
    output timer_done
    );
    
    reg [n-1 : 0] curr_state, next_state;
    always@(posedge clk, negedge reset_n)begin
        if(~reset_n)
            curr_state <= 'b0;
        else
            curr_state <= next_state;
    end
    
    always@(*)begin
        next_state = curr_state;
        if(timer_done)
            next_state = 'b0;
        else
            next_state = curr_state + 1;
    end
    assign timer_done = (curr_state == final_value);
endmodule
