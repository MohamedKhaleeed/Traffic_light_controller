`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 12:59:14 PM
// Design Name: 
// Module Name: tlc_fsm
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


module tlc_fsm#(
    parameter n = 13)(
    input clk,reset_n,
    input timer_done,
    input Sa, Sb,
    output reg timer_reset,
    output reg [n-1 : 0] final_value,
    output reg Ga, Ya, Ra, Gb, Yb, Rb
    );
    
    reg [2:0] curr_state, next_state;
    localparam s0 = 3'b000;
    localparam s1 = 3'b001;
    localparam s2 = 3'b010;
    localparam s3 = 3'b011;
    localparam s4 = 3'b100;
    localparam s5 = 3'b101;
    
    always@(posedge clk, negedge reset_n)begin
        if(~reset_n)
            curr_state <= 'b0;
        else
            curr_state <= next_state;
    end
    
    always@(*)begin
        next_state = curr_state;
        final_value = 999;
        Ga = 0;
        Ya = 0;
        Ra = 0;
        Gb = 0;
        Yb = 0;
        Rb = 0;
        case(curr_state)
            s0: begin
                final_value = 4999;
                Ga = 1;
                Rb = 1;
                
                if(timer_done)
                    next_state = s1;
                else
                    next_state = s0;
            end 
            s1: begin
                final_value = 999;
                Ga = 1;
                Rb = 1;
                
                if(timer_done & Sb)
                    next_state = s2;
                else
                    next_state = s1;
            end       
            s2: begin
                final_value = 999;
                Ya = 1;
                Rb = 1;
                
                if(timer_done)
                    next_state = s3;
                else
                    next_state = s2;
            end     
            s3: begin
                final_value = 3999;
                Ra = 1;
                Gb = 1;
                
                if(timer_done)
                    next_state = s4;
                else
                    next_state = s3;
            end  
            s4: begin
                final_value = 999;
                Ra = 1;
                Gb = 1;
                
                if(timer_done & (Sa | ~Sb))
                    next_state = s5;
                else
                    next_state = s4;
            end      
            s5: begin
                final_value = 999;
                Ra = 1;
                Yb = 1;
                
                if(timer_done)
                    next_state = s0;
                else
                    next_state = s5;
            end    
            default:next_state = curr_state;
        endcase
    end
endmodule
