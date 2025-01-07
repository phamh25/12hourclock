`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Heidi Pham
// 
// Create Date: 10/21/2024 11:44:30 AM
// Module Name: second_counter
// Project Name: 12 Hour Clock for Basys3
//
// Description: A counter for each second and determines led blinking timings
//
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module second_counter(
    // input
    input clk,      
    
    // outputs           
    output reg enable_second,  
    output reg led_1hz         
);
    reg [26:0] counter;        // 50 million clock cycles (0.5 seconds because 
                               // blinking lights should blink for every second so
                               // they would be lit for 0.5 secs and turn off for 
                               // 0.5 seconds)

    always @(posedge clk) begin
        if (counter == 50_000_000 - 1) begin // if half a second has passed
            counter <= 0;
            enable_second <= 1;  // enable signal for 1 clock cycle
            led_1hz <= ~led_1hz; // light every 0.5 second
        end 
        else begin
            counter <= counter + 1;
            enable_second <= 0;  // default: 0 when not at 0.5 second mark
        end
    end
endmodule

