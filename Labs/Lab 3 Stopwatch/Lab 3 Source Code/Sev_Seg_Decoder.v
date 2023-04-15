`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:43 09/28/2013 
// Design Name: 
// Module Name:    Sev_Seg_Decoder 
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
module Sev_Seg_Decoder(
    input  [3:0] num_in,					// number to display in binary form
    output reg [7:1] sev_seg_leds		// controls the eight individual LEDs in the 7-segment display 
    );
	reg [7:1] tmp;

	// lights up the proper LEDs for each digit (remember that the LEDs are active low)
	always @(num_in)
	begin
		case (num_in)			
			4'h0: tmp = 7'b1000000;
			4'h1: tmp = 7'b1111001;
			4'h2: tmp = 7'b0100100;
			4'h3: tmp = 7'b0110000;
			4'h4: tmp = 7'b0011001;
			4'h5: tmp = 7'b0010010;
			4'h6: tmp = 7'b0000010;
			4'h7: tmp = 7'b1111000;
			4'h8: tmp = 7'b0000000;
			4'h9: tmp = 7'b0010000;
			default: tmp = 7'b0111111;
		endcase
	end 

	assign sev_seg_leds[7:1] = tmp;
	 
endmodule
