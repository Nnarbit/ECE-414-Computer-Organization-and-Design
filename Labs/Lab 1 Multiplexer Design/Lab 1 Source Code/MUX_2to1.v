`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:04 09/15/2022 
// Design Name: 
// Module Name:    MUX_2to1 
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
module MUX_2to1(
    input [1:0] In,
    input S,
    output Out
    );

	 wire A,B,C; //W indicates the output wire from a specific module
	 
	 and and1(A, C, In[0]); 
	 and and2(B, S, In[1]); 
	 not not1(C, S);
	 or or1(Out, A, B);
	 
endmodule
