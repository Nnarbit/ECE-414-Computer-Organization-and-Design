`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:52:15 09/16/2022 
// Design Name: 
// Module Name:    MUX_4to1 
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
module MUX_4to1(
    input [3:0] In,
    input [1:0] S, 
    output Out
    );
	 
	 wire A, B;
	 wire [1:0] C;
	 assign C = {A, B};
	 
	 //MSB of S is assigned to the first stage of multiplexers and LSB to second stage
	 //first stage includes mux1 and mux 2 while second stage includes only mux3
	 MUX_2to1 mux1 (In[3:2], S[1], A);
	 MUX_2to1 mux2 (In[1:0], S[1], B);
	 DFMUX_2to1 mux3 (C, S[0], Out);
	 
endmodule
