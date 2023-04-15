`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:31 10/28/2022 
// Design Name: 
// Module Name:    Counter 
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

module Counter(
	input clk,
	input reset,
	input [3:0] num,
	output [3:0] counter);
	reg [3:0] c;
					
	always@(posedge clk, or posedge reset)
	begin
		if(reset)
			c <= 4'b0000;
		else if (c == num)
			c <= 4'b0000;
		else
			c <= c + 4'b0001;
	end

	assign counter = c;

endmodule
