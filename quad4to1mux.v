`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2024 02:03:11 PM
// Design Name: 
// Module Name: quad4to1mux
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


module quad4to1mux(
    // inputs
    input [3:0] D0,
    input [3:0] D1,
    input [3:0] D2,
    input [3:0] D3,
    input [1:0] S,
    
    // outputs
    output reg [3:0] Y
    );
    always @(*) begin
        case (S)
            0 : Y = D0;
            1 : Y = D1;
            2 : Y = D2;
            3 : Y = D3;
        endcase
    end
    
endmodule


