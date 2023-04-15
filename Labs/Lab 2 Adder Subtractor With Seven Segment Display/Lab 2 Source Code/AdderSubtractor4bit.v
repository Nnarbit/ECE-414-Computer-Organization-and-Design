`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:36 09/23/2022 
// Design Name: 
// Module Name:    AdderSubtractor4bit 
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

module AdderSubtractor4bit(
	input [3:0] A,
	input [3:0] B,
	input E, //0 = add, 1 = subtract
	output [3:0] S,
	output cout
    );
	
	wire b0, b1, b2, b3;
	wire c0, c1, c2;
	xor(b0, B[0], E);
	xor(b1, B[1], E);
	xor(b2, B[2], E);
	xor(b3, B[3], E);
	
	FullAdder1 fa1 (A[0], b0, E, c0, S[0]);
	FullAdder1 fa2 (A[1], b1, c0, c1, S[1]);
	FullAdder1 fa3 (A[2], b2, c1, c2, S[2]);
	FullAdder1 fa4 (A[3], b3, c2, cout, S[3]);
endmodule
