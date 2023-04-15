`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:10 10/28/2022 
// Design Name: 
// Module Name:    div_datapath 
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
module div_datapath(
	input [nBit-1:0] A, B,
	input clk, reset,
	input AB_Load, A_ShiftLeft,
	input R_Load, R_ShiftLeft,
	input Q_ShiftLeft,
	output [3:0] shift_count,
	output sub_cout,
	output reg [nBit-1:0] R, Q
	);
	parameter nBit = 16;
	wire [3:0] counter;
	wire [nBit-1:0] A_output, B_output, R_output, Q_output, Subtract, is_empty;
	assign is_empty = 0;
	
	Counter bit_count(A_ShiftLeft, clk, reset, count);
	Shift_Registers #(nBit) ra(A, clk, AB_Load, 1'b0, A_ShiftLeft, 1'b0, 1'b0, A_output);								  
	Shift_Registers #(nBit) rb(B, clk, AB_Load, 1'b0, 1'b0, 1'b0, 1'b0, B_output);								  
	Shift_Registers #(nBit) rr(Subtract, clk, R_Load, AB_Load, R_ShiftLeft, 1'b0, A_output[nBit-1], R_output);								  
	N_Subtactor #(nBit) sub(R_output, B_output, Subtract, sub_count);								  
	Shift_Registers #(nBit) rq(is_empty, clk, 1'b0, AB_Load, Q_ShiftLeft, 1'b0, R_Load, Qoutput);
	
	assign shift_count = count;
	
	always@(posedge clk)
	begin
		if(counter == nBit-1)
		begin
			R <= R_output;
			Q <= Q_output;
		end
		else
		begin
			R <= 1'b0;
			Q <= 1'b0;
		end
	end

endmodule
