`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:14:29 09/16/2022
// Design Name:   DFMUX_2to1
// Module Name:   C:/Users/Brandon/Desktop/Xilinx/ECE414Remake/tb_DFMUX_2to1.v
// Project Name:  ECE414Remake
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DFMUX_2to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_DFMUX_2to1;

	// Inputs
	reg [1:0] In;
	reg S;

	// Outputs
	wire Out;

	// Instantiate the Unit Under Test (UUT)
	DFMUX_2to1 uut (
		.In(In), 
		.S(S), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		In = 0;
		S = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		In = 0;
		S = 0;
		#100;
		
		In = 1;
		S = 0;
		#100;
		
		In = 2;
		S = 0;
		#100;
		
		In = 3;
		S = 0;
		#100;
		
		In = 0;
		S = 1;
		#100;
		
		In = 1;
		S = 1;
		#100;
		
		In = 2;
		S = 1;
		#100;
		
		In = 3;
		S = 1;
		#100;
	end
      
endmodule

