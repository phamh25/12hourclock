`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2024 05:25:23 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,         // 100 MHz clock
    input [15:0] sw,   // switches
    output [15:0] led, // LEDs
    output [6:0] seg,  // 7-segment displays
    output [3:0] an    // anodes (active low enables for each 7-segment digit)
    );

    assign led = sw;    // connect switches to LEDs
    
    display_controller U1 (clk,sw[3:0],sw[7:4],sw[11:8],sw[15:12],seg,an);
    
endmodule

