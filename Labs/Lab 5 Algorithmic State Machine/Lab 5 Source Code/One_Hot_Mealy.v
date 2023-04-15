`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:22 11/07/2022 
// Design Name: 
// Module Name:    One_Hot_Mealy 
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
module One_Hot_Mealy(
    input data_in_A, data_in_B,
    input clk, reset,
    output reg count_out
    );
	 parameter S0=5'b10000, S1=5'b01000, S2=5'b00100, S3=5'b00010, S4=5'b00001;
	 reg [4:0] present_state, next_state;
	 
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

