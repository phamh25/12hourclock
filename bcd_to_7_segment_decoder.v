`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2024 04:59:15 PM
// Design Name: 
// Module Name: bcd_to_7_segment_decoder
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


module bcd_to_7_segment_decoder(
    input [3:0] X,  // 4-bit BCD number
    output [6:0] Y  // Y[0] is segment a, Y[1] is segment b, etc.
    );
    
    wire a,b,c,d,e,f,g;
    wire w,x,y,z;
    assign {w,x,y,z} = X[3:0];

    assign a = ~w & ~x & ~y & z | ~w & x & ~y & ~z | w & x & ~y & z | w & ~x & y & z;
    assign b = x & y & ~z | w & y & z | ~w & x & ~y & z | w & x & ~y & ~z;
    assign c = ~w & ~x & y & ~z | w & x & y | w & x & ~z;
    assign d = ~w & ~x & ~y & z | ~w & x & ~y & ~z | w & ~x & y & ~z | x & y & z;
    assign e = ~w & z | ~w & x & ~y | ~x & ~y & z;
    assign f = ~w & ~x & z | ~w & ~x & y | ~w & y & z | w & x & ~y & z;
    assign g = ~w & ~x & ~y | w & x & ~y & ~z | ~w & x & y & z;
    assign Y[6:0] = {g,f,e,d,c,b,a};
 
endmodule

