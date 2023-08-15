`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 02:24:33 PM
// Design Name: 
// Module Name: tlc_controller_tb
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


module tlc_controller_tb();
    parameter n = 13;
    reg clk,reset_n;
    reg Sa, Sb;
    wire Ga, Ya, Ra, Gb, Yb, Rb;
    
    tlc_controller#(.n(n)) dut(
        .clk(clk),
        .reset_n(reset_n),
        .Sa(Sa),
        .Sb(Sb),
        .Ga(Ga),
        .Ya(Ya),
        .Ra(Ra),
        .Gb(Gb),
        .Yb(Yb),
        .Rb(Rb)
    );
    
    localparam T = 10;
    always begin
        clk = 0;
        #(T/2)
        clk = 1;
        #(T/2);
    end
    
    initial begin 
        reset_n = 0;
        Sb = 0;
        Sa = 0;
        #3
        reset_n = 1;
        repeat(8100)@(negedge clk);
        Sb = 1;
        repeat(8100)@(negedge clk);
        Sb = 0;
        repeat(8100)@(negedge clk);
        Sb = 1;
        Sa = 1;
        repeat(40100)@(negedge clk);
        $finish;  
    end
endmodule
