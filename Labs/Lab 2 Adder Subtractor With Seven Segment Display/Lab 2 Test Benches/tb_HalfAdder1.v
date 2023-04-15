`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:33 09/16/2022
// Design Name:   HalfAdder1
// Module Name:   tb_HalfAdder1.v
// Project Name:  ECE414Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HalfAdder1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_HalfAdder1;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	HalfAdder1 uut (
		.a(a), 
		.b(b), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 0;
		b = 0;
		#100;
		a = 0;
		b = 1;
		#100;
		a = 1;
		b = 0;
		#100;
		a = 1;
		b = 1;
		#100;
		
	end
      
endmodule

