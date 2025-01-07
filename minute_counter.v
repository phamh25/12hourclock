`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Heidi Pham
// 
// Create Date: 10/20/2024 08:26:21 PM
// Module Name: minute_counter
// Project Name: 12 Hour Clock for Basys3
//
// Description: A minutes counter which implements the seconds counter
// 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module minute_counter(
    // inputs
    input clk,                
    input enable_second,  
    
    //outputs     
    output reg enable_minute 
);
    reg [6:0] second_counter;  // 7-bit counter to count up to 120 for 0.5 second signal
                               // due to led timing (120 signal timing = 60 secs

    always @(posedge clk) begin
        if (enable_second) begin
            if (second_counter == 119) begin // a min have passed (0.5s * 120)
                second_counter <= 0;
                enable_minute <= 1;  // enable the minute counter for 1 cycle
            end else begin
                second_counter <= second_counter + 1;
                enable_minute <= 0;  // 0 when not at 60 secs
            end
        end 
        else begin
            enable_minute <= 0;  // only change during enable_second pulse
        end
    end
endmodule








