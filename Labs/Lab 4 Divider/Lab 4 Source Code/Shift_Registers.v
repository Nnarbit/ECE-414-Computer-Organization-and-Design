`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:10 10/28/2022 
// Design Name: 
// Module Name:    Shift_Registers
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
module shift_reg(
	input [nBit-1:0] Input,
	input clk, load, clr,
	input Shift_Left, Shift_Right, Shift_In,
	output reg [nBit-1:0] Output
	);
	parameter nBit = 16;
	
	always@(negedge clk)
	begin
		if(clr)
			Output <= 1'b0;
		else
		begin
			if(load)
				Output <= Input;
			else if (Shift_Left)
				Output <= {out[nBit-2:0], Shift_In};
			else if (Shift_Right)
				Output <= {Shift_In, Output[nBit-1:1]};
			else
				Output <= Output;
		end
	end	
endmodule
