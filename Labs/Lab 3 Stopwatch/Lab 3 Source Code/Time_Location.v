`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:30 10/28/2022 
// Design Name: 
// Module Name:    Time_Location
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Time_Location(
        input clk,
        input reset,
        input pause,
        input [nBit-1:0] limit,
        input [3:0] stop,
        output next,
        output [3:0] num
    );
    parameter nBit = 18;
    wire count;

    Clock #(nBit) place(clk, reset, pause, limit, count);
    Counter increment(count, reset, stop, num);
    assign next = count;

endmodule