`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:22 10/28/2022 
// Design Name: 
// Module Name:    Time_Counter 
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

module Time_Counter(
    input clk,
    input reset,
    input pause,
    output [3:0] num_1,
    output [3:0] num_2,
    output [3:0] num_3,
    output [3:0] num_4
    );
    wire [3:0] out;
    wire [2:0] minute = 2'b10;
    wire [3:0] second = 3'b100;
    wire [17:0] ten_second = 18'd250000
    wire [3:0] double_sec = 4'b0101;
    wire [3:0] single_sec = 4'b1001;

    Time_Location #(18) b4(clk, reset, pause, ten_second, single_sec, out[0], num_4);
    Time_Location #(4) b3(out[0], reset, pause, second, single_sec, out[1], num_3);
    Time_Location #(4) b3(out[1], reset, pause, second, double_sec, out[2], num_2);
    Time_Location #(3) b3(out[2], reset, pause, minute, single_sec, out[3], num_1);

endmodule