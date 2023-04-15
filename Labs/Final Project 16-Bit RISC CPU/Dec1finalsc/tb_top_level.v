`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:00:31 12/01/2022
// Design Name:   top_level
// Module Name:   C:/Users/raini/Desktop/414 labs/Dec1finalsc/tb_top_level.v
// Project Name:  Dec1finalsc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_top_level;

	// Inputs
	reg reset;
	reg clk;

	// Outputs
	wire UART_TX;

	// Instantiate the Unit Under Test (UUT)
	top_level uut (
		.reset(reset), 
		.clk(clk), 
		.UART_TX(UART_TX)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1;
		#100;
		
		reset = 0;
		#100;

	end
   
	always
	#5 clk = ~clk;   
endmodule

