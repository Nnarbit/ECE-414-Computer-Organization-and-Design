`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:15 10/28/2022 
// Design Name: 
// Module Name:    div_toplevel 
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
module div_toplevel(
	input [nBit-1:0] A, B
	input clk, reset,
	output [nBit-1:0] R, Q
	);					  
	parameter nBit = 16;
	wire [nBit-1:0] R_output;
	wire [nBit-1:0] Q_output;
	wire AB_Load, A_ShiftLeft;
	wire R_Load, R_ShiftLeft;
	wire Q_ShiftLeft;
	wire sub_cout;
	wire [3:0] counter;

	Controller #(nBit) count(sub_count, clk, reset, counter, AB_Load, A_ShiftLeft, R_Load, R_ShiftLeft, Q_ShiftLeft);
	Datapath #(nBit) data(A, B, clk, reset, AB_Load, A_ShiftLeft, R_Load, R_ShiftLeft, Q_ShiftLeft, counter, sub_count, R_output, Q_output);
	assign R = R_output;
	assign Q = Q_output;
	
endmodule
