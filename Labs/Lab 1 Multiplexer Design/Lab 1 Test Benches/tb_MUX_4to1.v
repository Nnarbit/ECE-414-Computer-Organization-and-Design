`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:44:52 09/16/2022
// Design Name:   MUX_4to1
// Module Name:   C:/Users/Brandon/Desktop/Xilinx/Lab1/tb_MUX_4to1.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX_4to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_MUX_4to1;

	// Inputs
	reg [3:0] In;
	reg [1:0] S;

	// Outputs
	wire Out;

	// Instantiate the Unit Under Test (UUT)
	MUX_4to1 uut (
		.In(In), 
		.S(S), 
		.Out(Out)
	);
	
	reg [2:0] i; //for S bits
	reg [4:0] j; //for In bits
	initial begin
		// Initialize Inputs
		In = 0;
		S = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i = 0; i < 4; i = i + 1) begin
			S = i;
			for (j = 0; j < 16; j = j + 1) begin
				In = j;
				#10;
			end
		end
	end
      
endmodule

