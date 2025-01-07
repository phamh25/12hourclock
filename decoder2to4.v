`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2024 10:40:55 AM
// Design Name: 
// Module Name: decoder2to4
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


module decoder2to4(
    input [1:0] A,
    output reg [3:0] Y
    );
    
    always @(*) begin
        case (A)
            0 : Y = 4'b1110;
            1 : Y = 4'b1101;
            2 : Y = 4'b1011;
            3 : Y = 4'b0111;
        endcase
    end
    
endmodule

