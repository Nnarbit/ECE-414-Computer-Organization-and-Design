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
    input [7:0] num_1, num_2,
    input clk_main, reset,
    output [7:0] sev_seg_leds,
    output [3:0] led_disable, led_enable
    );
	
	// Register and Wire Definitions
	wire [7:0] num_3, num_4;
	wire clk_slw;
	reg [14:0] clk_div;
	
	Divider #(8) d(num_1, num_2, clk_slw, reset, num_3, num_4);
	sev_seg_with_clk dd(num_3[7:4], num_3[3:0], num_4[7:4], num_4[3:0], clk_div[14], reset, sev_seg_leds, led_disable, led_enable);
	ip_clk_div clk_5M(clk_main, clk_slw);
	
	always @ (posedge clk_slw)	
	begin
		if (reset)
			clk_div <= 15'd0 ;
		else 								
			clk_div <= clk_div + 15'd1 ;	
	end

endmodule