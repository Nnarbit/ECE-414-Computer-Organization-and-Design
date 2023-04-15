`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:17:39 09/23/2022
// Design Name:   FullAdder1
// Module Name:   tb_FullAdder1.v
// Project Name:  ECE414Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FullAdder1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FullAdder1;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire cout;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	FullAdder1 uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);
	reg[1:0] i;
	reg[1:0] j;
	reg[1:0] n;
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i = 0; i < 2; i = i + 1) begin
			cin = i;
			for (j = 0; j < 2; j = j + 1) begin
				a = j;
				for (n = 0; n < 2; n = n +1)begin
					b = n;
					#10;
				end
			end
		end
	end
      
endmodule

