`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Heidi Pham
// 
// Create Date: 10/04/2024 05:31:31 PM
// Module Name: display_controller
// Project Name: 12 Hour Clock for Basys3
//
// Description: Displays the numbers on the segment display and aids in turning
//              binary to decimal
// 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module display_controller(
    // inputs
    input clk,                
    input [3:0] D0,           // digit 0 (least significant digit)
    input [3:0] D1,           // digit 1
    input [3:0] D2,           // digit 2
    input [3:0] D3,           // digit 3 (most significant digit)
    
    // outputs
    output [6:0] segments,    // outputs for segments a through g
    output [3:0] digit_enable // enable for each digit
);
    wire [3:0] selected_bcd;   // wire for select
    wire [1:0] display_number; // wire to connect decoder and muxes

    // initialize mux, decoder, quad mux, and segment decoder
    multiplexer_counter mux_counter(clk, display_number);
    decoder2to4 decoder(display_number, digit_enable);
    quad4to1mux mux_quad(D0, D1, D2, D3, display_number, selected_bcd);
    bcd_to_7_segment_decoder segment(selected_bcd, segments);
endmodule

