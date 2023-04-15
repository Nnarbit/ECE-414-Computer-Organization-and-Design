`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:51 09/30/2022 
// Design Name: 
// Module Name:    SevenSegmentDisplayDriver 
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
module SevenSegmentDisplayDriver(
	input[3:0] A,
	input[3:0] B,
	input[3:0] S,
	output[6:0] Aout,
	output[6:0] Bout,
	output[6:0] Sout
    );
	
	SevenSegmentDecoder D1 (A, Aout);
	SevenSegmentDecoder D2 (B, Bout);
	SevenSegmentDecoder D3 (S, Sout);

endmodule
