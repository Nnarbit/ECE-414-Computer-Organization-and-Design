`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:12 10/28/2022 
// Design Name: 
// Module Name:    div_controller 
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
module div_controller(
	input sub_count, clk, reset,
	input [3:0] counter,
	output reg AB_Load, A_ShiftLeft,
	output reg R_Load, R_ShiftLeft,
	output reg Q_ShiftLeft
	); 
	parameter nBit = 16;
	parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101;
	 
	reg [2:0] state;

	always@(posedge clk or posedge reset)
	begin
		if(reset)
			state <= s0;
		else
		begin
			case(state)
				s0: state <= s1;
				s1:
				begin
					if(sub_cout)
						state <= s3;
					else
						state <= s2;
				end
	
				s2:
				begin
					if(counter == nBit-1)
						state <= s5;
					else
						state <= s4;
				end
				
				s3:
				begin
					if(counter == nBit-1)
						state <= s5;
					else
						state <= s4;
				end
				
				s4: state <= s1;
				s5: state <= s5;
				default: state <= s0;
			endcase
		end
	end
	
	always@(state)
	begin
		case(state)
			s0: 
			begin
				AB_Load <= 1'b1;
				A_ShiftLeft <= 1'b0;
				R_Load <= 1'b0;
				R_ShiftLeft <= 1'b0;
				Q_ShiftLeft <= 1'b0;
			end
			
			s1: 
			begin
				AB_Load <= 1'b0;
				A_ShiftLeft <= 1'b0;
				R_ShiftLeft <= 1'b1;
			end
			
			s2: 
			begin
				R_Load <= 1'b0;
				R_ShiftLeft <= 1'b0;
				Q_ShiftLeft <= 1'b1;
			end
			
			s3:
			begin
				R_Load <= 1'b1;
				R_ShiftLeft <= 1'b0;
				Q_ShiftLeft <= 1'b1;
			end
			
			s4: 
			begin
				A_ShiftLeft <= 1'b1;
				R_Load <= 1'b0;
				R_ShiftLeft <= 1'b0;
				Q_ShiftLeft <= 1'b0;
			end
			
			s5: 
			begin
				R_load <= 1'b0;
				Q_ShiftLeft <= 1'b0;
			end
		endcase
	end
endmodule
