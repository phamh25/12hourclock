`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Heidi Pham
// 
// Create Date: 10/20/2024 08:28:12 PM
// Module Name: top_clock
// Project Name: 12 Hour Clock for Basys3
//
// Description: This file uses the modules made for the Hw6 solutions 
//              to implement a 12 hour clock. Led15 blinks for ever second while
//              hours can be set using the 'btnL' button and minutes can be 
//              set using the 'btnR' button. 
//
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module top_clock(
    // inputs
    input clk,          // clock
    input btnL,         // left button
    input btnR,         // right button
    
    // outputs
    output [6:0] seg,   // segments
    output [3:0] an,    // anodes
    output [15:0] led   // leds
);

wire enable_second, enable_minute;        // wires for seconds and minutes enables
wire [3:0] min_ones, min_tens, hour_ones; // wires for minutes ones, tens and hours ones place
wire [1:0] hour_tens;                     // wire for hours ones place

// inititalize the second, minute, and hour counters
second_counter sec (.clk(clk), .enable_second(enable_second), .led_1hz(led[15]));
minute_counter min (.clk(clk), .enable_second(enable_second), .enable_minute(enable_minute));
hour_counter hour (.clk(clk), .enable_minute(enable_minute), .btnL(btnL), .btnR(btnR),
                  .min_ones(min_ones), .min_tens(min_tens), .hour_ones(hour_ones), .hour_tens(hour_tens));

// display controller
display_controller disp (.clk(clk), .D0(min_ones), .D1(min_tens), .D2(hour_ones), .D3(hour_tens), .segments(seg), .digit_enable(an));

endmodule



