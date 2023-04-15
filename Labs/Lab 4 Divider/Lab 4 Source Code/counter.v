`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:31 10/28/2022 
// Design Name: 
// Module Name:    counter 
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
module counter(input increment,
					input clk,
					input clr,
					output reg [3:0] count);
					
	always@(posedge clk)
	begin
		if(clr)
			count <= 0;
		else
		begin
			if(increment)
				count <= count + 1'b1;
			else
				count <= count;
		end
	end
endmodule
