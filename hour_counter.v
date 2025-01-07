`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Heidi Pham
// 
// Create Date: 10/20/2024 08:26:21 PM
// Module Name: hour_counter
// Project Name: 12 Hour Clock for Basys3
//
// Description: A counter for the hours which implements minutes counter. Also
//              maps the logic for the buttons to set a time and debounces 
//              them as well
// 
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module hour_counter(
    // inputs
    input clk,
    input enable_minute,       
    input btnL,                
    input btnR,       
    
    // outputs        
    output reg [3:0] min_ones, // minutes ones place (D0)
    output reg [3:0] min_tens, // minutes tens place (D1)
    output reg [3:0] hour_ones, // hours ones place (D2)
    output reg [1:0] hour_tens  // hours tens digit (D3)
);
    // TESTING: initialize values to 12:59 at startup
    initial begin
        min_ones = 9;       // 9 (ones digit)
        min_tens = 5;       // 50 (tens digit)
        hour_ones = 2;      // 12 (ones digit)
        hour_tens = 1;      // 12 (tens digit)
    end

    reg btnL_last = 0; // previous state of button btnL
    reg btnR_last = 0; // previous state of button btnR

    // implements debouncing logic so the buttons work 
    // to increase the hours and minutes only by one when pressed
    always @(posedge clk) begin
        // debounce logic for btnL
        if (btnL && !btnL_last) begin
            // update hours
            if (hour_ones == 2 && hour_tens == 1) begin // if at 12
                hour_ones <= 1; // reset to 1
                hour_tens <= 0; // reset tens place
            end 
            else if (hour_ones == 9) begin
                hour_ones <= 0; // reset ones place
                hour_tens <= hour_tens + 1; // update hours tens place
            end 
            else begin
                hour_ones <= hour_ones + 1; // update hours ones place
            end
        end
        btnL_last <= btnL; // update previous state of btnL

        // debounce logic for btnR
        if (btnR && !btnR_last) begin
            // update minutes
            if (min_ones == 9) begin
                min_ones <= 0;
                if (min_tens == 5) begin
                    min_tens <= 0; // reset minutes to 00
                end 
                else begin
                    min_tens <= min_tens + 1; // update minutes tens place
                end
            end 
            else begin
                min_ones <= min_ones + 1; // Update minutes ones place
            end
        end
        btnR_last <= btnR; // update previous state of btnR

        // handles minute overflow and hour increment
        if (enable_minute) begin
            if (min_ones == 9) begin
                min_ones <= 0;
                if (min_tens == 5) begin
                    min_tens <= 0;
                    // hours on minute overflow
                    if (hour_ones == 2 && hour_tens == 1) begin // if at 12:59
                        hour_ones <= 1; // reset to 1:00
                        hour_tens <= 0;
                    end 
                    else if (hour_ones == 9) begin
                        hour_ones <= 0;
                        hour_tens <= hour_tens + 1;
                    end 
                    else begin
                        hour_ones <= hour_ones + 1;
                    end
                end 
                else begin
                    min_tens <= min_tens + 1; // increment minute tens place
                end
            end 
            else begin
                min_ones <= min_ones + 1; // increment minute ones place
            end
        end
    end
endmodule







