`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:50 09/28/2013 
// Design Name: 
// Module Name:    sev_seg_with_clk 
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
module sev_seg_with_clk(
    input [3:0] num_1,					// input number one
    input [3:0] num_2,					// input number two
	 input [3:0] num_3,					// input number three
	 input [3:0] num_4,					// input number four
	 input clk,								// we need a clk to switch between multiple digits
	 input reset,							// reset signal 
	 output  [7:0] sev_seg_leds,		// controls the 8 individual LEDs in all sev_seg digits
	 output  [3:0]led_disable,			// connected to disable the 5 displays that will not be used 
	 output  reg [3:0]led_enable		// connected to drive the 3 displays that will be used
    );
	 
	 
	 reg[1:0] sel = 0;
	 assign led_disable = 4'b1111;		// disable other 5 digits
	 
	 // We will toggle the register "sel" at every rising clock edge
	 // This register will be used to switch the display between two displays
	 // led_enable[2] controls the leftmost display, led_enable[1] controls the middle display (right of leftmost display), led_enable[0] controls the display to the right (right of middle display)
	 // The displays are activated when the corresponding enable bit goes to LOW
	 always @ (posedge clk or posedge reset)		// Whenever the clock or the reset signal goes high, this block will be activated
	 begin
		if (reset)								// If reset is high
		begin
			sel = 2'b00;					   // sel signal is brought to 0
			led_enable = 3'b1111;			// all four displays are turned off
		end
		else										// If reset button is not pressed
		begin
		
			for(sel = 0; sel < 4; sel = sel + 1) begin
				led_enable = sel[0] ? (sel[1] ? (4'b1011) : (3'b1101) ) : (sel[1] ? (3'b0111) : (3'b1110) );
			end
			
			
		end				
	 end
	 
	 sev_seg_decoder decoder1(.num_in(sel[0] ? (sel[1] ? (num_4):(num_2)) : (sel[1] ? (num_3):(num_1))), .sev_seg_leds(sev_seg_leds));
	 // So, num_3 controls the leftmost display, num_2 controls the middle, and num_1 controls the rightmost
 	 
endmodule
