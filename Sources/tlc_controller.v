`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 02:06:49 PM
// Design Name: 
// Module Name: tlc_controller
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


module tlc_controller#(
    parameter n = 13)(
    input clk,reset_n,
    input Sa, Sb,
    output Ga, Ya, Ra, Gb, Yb, Rb
    );
    wire timer_done;
    wire [n-1 : 0] final_value;
    
    tlc_timer#(.n(n)) timer(
        .clk(clk),
        .reset_n(reset_n),
        .final_value(final_value),
        .timer_done(timer_done)
    );
    
    tlc_fsm#(.n(n)) fsm(
        .clk(clk),
        .reset_n(reset_n),
        .final_value(final_value),
        .timer_done(timer_done),
        .Sa(Sa),
        .Sb(Sb),
        .Ga(Ga),
        .Ya(Ya),
        .Ra(Ra),
        .Gb(Gb),
        .Yb(Yb),
        .Rb(Rb)
    );
endmodule
