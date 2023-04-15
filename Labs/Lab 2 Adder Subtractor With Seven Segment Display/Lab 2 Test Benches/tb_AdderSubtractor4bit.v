`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:44:41 09/30/2022
// Design Name:   AdderSubtractor4bit
// Module Name:   tb_AdderSubtractor4bit.v
// Project Name:  ECE414Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AdderSubtractor4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_AdderSubtractor4bit;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg E;

	// Outputs
	wire [3:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	AdderSubtractor4bit uut (
		.A(A), 
		.B(B), 
		.E(E), 
		.S(S), 
		.cout(cout)
	);
	
	reg [2:0] i;
	reg [4:0] j;
	reg [4:0] k;
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		E = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for(i=0;i<2;i=i+1) begin
			E = i;
			for(j=0;j<16;j=j+1) begin
				A = j;
				for(k=0;k<16;k=k+1) begin
					B = k;
					#10;
				end
			end
		end
	end
      
endmodule

