`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:04 09/30/2022 
// Design Name: 
// Module Name:    SevenSegmentDecoder 
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
module SevenSegmentDecoder(
	input [3:0] in,
	output [6:0] out
    );
		
	reg [6:0] temp;
	always @(in) begin
	case (in)
	  0 : temp = 7'b1111110;
      1 : temp = 7'b0110000;
      2 : temp = 7'b1101101;
      3 : temp = 7'b1111001;
      4 : temp = 7'b0110011;
      5 : temp = 7'b1011011;
      6 : temp = 7'b1011111;
      7 : temp = 7'b1110000;
      8 : temp = 7'b1111111;
      9 : temp = 7'b1111011;
      10 : temp = 7'b1110111; 
      11 : temp = 7'b0011111;
      12 : temp = 7'b1001110;
      13 : temp = 7'b0111101;
      14 : temp = 7'b1001111;
      15 : temp = 7'b1000111;
	endcase
	end
	
	assign out = temp;
endmodule
