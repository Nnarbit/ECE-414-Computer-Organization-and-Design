`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:44 09/16/2022 
// Design Name: 
// Module Name:    HalfAdder1 
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
module HalfAdder1(
    input a,
    input b,
    output Sum,
    output Cout
    );

	 xor(Sum, a, b);
	 and(Cout, a, b);
	 
endmodule
