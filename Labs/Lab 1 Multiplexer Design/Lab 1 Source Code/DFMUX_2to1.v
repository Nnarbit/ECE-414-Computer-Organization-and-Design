`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:23:41 09/15/2022 
// Design Name: 
// Module Name:    DFMUX_2to1 
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
module DFMUX_2to1(
    input [1:0] In,
    input S,
    output Out
    );
	
	 assign Out = (S)?In[1]:In[0];
	 
endmodule
