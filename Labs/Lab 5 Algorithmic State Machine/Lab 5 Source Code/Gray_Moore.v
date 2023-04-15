`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:04 11/07/2022 
// Design Name: 
// Module Name:    Gray_Moore 
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
module Gray_Moore(
    input data_in_A, data_in_B,
    input clk, reset,
    output reg count_out
    );
	 parameter S0=3'b000, S1=3'b100, S2=3'b110, S3=3'b111, S4=3'b101;
	 reg [2:0] state;
	 
	 always @(posedge clk or posedge reset) begin 
	   if(reset) state<=S0;
		else begin
			case(state)
				S0: begin
						if(data_in_A==data_in_B) state<=S1;
						else state<=S0;
					 end
				S1: begin
						if(data_in_A==data_in_B) state<=S2;
						else state<=S0;
					 end
				S2: begin
						if(data_in_A==data_in_B) state<=S3;
						else state<=S0;
					 end
				S3: begin
						if(data_in_A==data_in_B) state<=S4;
						else state<=S0;
					 end
				S4: begin
						if(data_in_A==data_in_B) state<=S4;
						else state<=S0;
					 end
			endcase
		end
	 end
		
	 always @(state) begin
		case(state)
			S0: count_out=0;
			S1: count_out=0;
			S2: count_out=0;
			S3: count_out=0;
			S4: count_out=1;
		endcase
	 end
		
endmodule
