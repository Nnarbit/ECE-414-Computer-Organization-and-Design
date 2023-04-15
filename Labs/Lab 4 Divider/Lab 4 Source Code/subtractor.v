`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:31 10/28/2022 
// Design Name: 
// Module Name:    subtractor 
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
module subtractor(
	input [nBit-1:0] A, C,
	output [nBit-1:0] D,
	output Bout
	);		
	parameter nBit = 16;
	wire [nBit-1:0] Bin, B;
	assign Bin = ~C + 1'b1;
	
	genvar i;
	
	generate
		for(i=0; i <= nBit-1; i=i+1)
		begin: generate_subtractor
			if(i==0)
				half_adder ha(A[0], Bin[0], D[0], B[0]);
			else
				full_adder fa(A[i], Bin[i], B[i-1], D[i], B[i]);
		end
		assign Bout = B[nBit-1];
	endgenerate
endmodule
