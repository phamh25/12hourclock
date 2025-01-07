`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2024 02:18:41 PM
// Design Name: 
// Module Name: multiplexer_counter
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


module multiplexer_counter (
    input clk,                // input
    output reg [1:0] dig      // output
);
    reg [17:0] counter;       // *was [26:0] for 27 bit but modified to 18 bit, uses 27 bits for sequential circuit of choice

    // procedural block to increment counter for clock
    always @(posedge clk) begin
        counter <= counter + 1;
    end

    // outputs the bits
    always @(posedge clk) begin
        dig <= counter[17:16];
    end
endmodule



