`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:18 11/07/2022 
// Design Name: 
// Module Name:    Sequential_Mealy 
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
module Sequential_Mealy(
    input data_in_A, data_in_B,
    input clk, reset,
    output reg count_out
    );
	 parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
	 reg [2:0] present_state, next_state;
	 
	 always @(posedge clk or posedge reset) begin
		if(reset) present_state<=S0;
		else present_state<=next_state;
	 end
	 
	 always @(*) begin
		case(present_state)
			S0: begin
					if(data_in_A==data_in_B) begin
						next_state<=S1;
						count_out<=0;
					end
					else begin
						next_state<=S0;
						count_out<=0;
					end
				 end
			S1: begin
					if(data_in_A==data_in_B) begin
						next_state<=S2;
						count_out<=0;
					end
					else begin
						next_state<=S0;
						count_out<=0;
					end
				 end
			S2: begin
					if(data_in_A==data_in_B) begin
						next_state<=S3;
						count_out<=0;
					end
					else begin
						next_state<=S0;
						count_out<=0;
					end
				 end
			S3: begin
					if(data_in_A==data_in_B) begin
						next_state<=S4;
						count_out<=1;
					end
					else begin
						next_state<=S0;
						count_out<=0;
					end
				 end
			S4: begin
					if(data_in_A==data_in_B) begin
						next_state<=S4;
						count_out<=1;
					end
					else begin
						next_state<=S0;
						count_out<=0;
					end
				 end
		endcase
	 end
endmodule
