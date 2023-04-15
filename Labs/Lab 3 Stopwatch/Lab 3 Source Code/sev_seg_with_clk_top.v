`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:22 09/28/2013 
// Design Name: 
// Module Name:    sev_seg_with_clk_top 
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
module sev_seg_with_clk_top(
    input clk_main,
	input reset,
	input pause,
	output [7:1] seven_seg_leds,
	output [3:0] led_disable,
	output reg [3:0] led_enable
    );
	wire [3:0] num_1;
	wire [3:0] num_2;
	wire [3:0] num_3;
	wire [3:0] num_4;
	wire clk_slw;
	wire clk_stop;
	wire [3:0] display;
	reg [14:0] clk_div;

	Time_Counter counter(clk_slw, reset, pause, num_1, num_2, num_3, num_4);
	Stop_Clock hold(clk_slw, reset, pause, clk_stop);

	always@(*)
	begin
		if(pause == 1)
			led_enable = clk_stop?4'b1111:display;
		else
			led_enable = display;
	end

	sev_seg_with_clk dd(num_1, num_2, num_3, num_4, clk_div[14], reset, sev_seg_leds, led_disable, display);
	ip_clk_div clk_5M(clk_main, clk_slw);

	always @(posedge clk_slw)
	begin
		if(reset)
			clk_div <= 15'd0;
		else
			clk_div <= clk_div + 15'd1;
	end
	
endmodule