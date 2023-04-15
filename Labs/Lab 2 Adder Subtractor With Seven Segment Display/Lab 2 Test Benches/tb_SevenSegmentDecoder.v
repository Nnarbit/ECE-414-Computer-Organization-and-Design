`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:05:57 09/30/2022
// Design Name:   SevenSegmentDecoder
// Module Name:   C:/Users/Brandon/Desktop/Xilinx/ECE414Lab2RERE/tb_SevenSegmentDecoder.v
// Project Name:  ECE414Lab2RERE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SevenSegmentDecoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_SevenSegmentDecoder;

	// Inputs
	reg [3:0] in;

	// Outputs
	wire [6:0] out;

	// Instantiate the Unit Under Test (UUT)
	SevenSegmentDecoder uut (
		.in(in), 
		.out(out)
	);
	
	reg[3:0] i;
	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i = 0; i < 16; i = i + 1) begin
			in = i;
			#50
		end
	end
      
endmodule

