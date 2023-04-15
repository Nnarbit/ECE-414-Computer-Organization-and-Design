`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:19:40 11/07/2022
// Design Name:   Sequential_Moore
// Module Name:   C:/Users/Brandon/Desktop/Xilinx/Assignment5/tb_Sequential_Moore.v
// Project Name:  Assignment5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sequential_Moore
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Sequential_Moore;

	// Inputs
	reg data_in_A;
	reg data_in_B;
	reg clk;
	reg reset;

	// Outputs
	wire count_out;

	// Instantiate the Unit Under Test (UUT)
	Sequential_Moore uut (
		.data_in_A(data_in_A), 
		.data_in_B(data_in_B), 
		.clk(clk), 
		.reset(reset), 
		.count_out(count_out)
	);
	initial begin //clock
		clk = 1;
		forever #25 clk = ~clk;
	end
	
	initial begin //resets
		reset = 1;
		#10;
		reset = 0;
	end
	
	initial begin //inputs
		data_in_A = 0; //1
		data_in_B = 1;
		#50;
		data_in_A = 1; //2
		data_in_B = 1;
		#50;
		data_in_A = 1; //3
		data_in_B = 1;
		#50;
		data_in_A = 0; //4
		data_in_B = 0;
		#50;
		data_in_A = 1; //5
		data_in_B = 1;
		#50;
		data_in_A = 1; //6
		data_in_B = 0;
		#50;
		data_in_A = 1; //7
		data_in_B = 1;
		#50;
		data_in_A = 0; //8
		data_in_B = 0;
		#50;
		data_in_A = 0; //9
		data_in_B = 0;
		#50;
		data_in_A = 0; //10
		data_in_B = 0;
		#50;
		data_in_A = 1; //11
		data_in_B = 1;
		#50;
		data_in_A = 1; //12
		data_in_B = 1;
		#50;
		data_in_A = 0; //13
		data_in_B = 1;
		#50;
	end
	
endmodule
