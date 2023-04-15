`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:00 09/16/2022 
// Design Name: 
// Module Name:    FullAdder1 
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
module FullAdder1(
    input a,
    input b,
	input cin,
    output cout,
    output sum
    );
	 
	 wire HA1sum, HA1cout, HA2cout;
	 HalfAdder1 HA1(a,b,HA1sum,HA1cout);
	 HalfAdder1 HA2(HA1sum,cin,sum,HA2cout);
	 or(cout,HA2cout,HA1cout);
	 

endmodule
