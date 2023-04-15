`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:50 09/28/2013 
// Design Name: 
// Module Name:    sev_seg_with_clk 
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
module sev_seg_with_clk(
    input [3:0] num_1,				
    input [3:0] num_2,					
	input [3:0] num_3,
	input [3:0] num_4,
	input clk,								
	input reset,							
	output [7:1] sev_seg_leds,		
	output [3:0] led_disable,			
	output reg [3:0] led_enable		
    );
	reg [2:0] sel;
	reg [3:0] bus;
	
	assign led_disable = 4'b1111;		
	
	always @ (posedge clk or posedge reset)		
	begin
		if (reset)								
		begin
			sel <= 3'b000;		 				
			led_enable <= 4'b1111;				
		end
		else										
		begin
			sel[2] <= sel[1] & sel[0];
			sel[1] <= sel[1] ^ sel[0];
			sel[0] <= ~sel[0];

			case(sel)
				3'b001: 
				begin
					led_enable <= 4'b0111;
					bus <= num_1;
				end
				3'b010:
				begin
					led_enable <= 4'b1011;
					bus <= num_2;
				end
				3'b011:
				begin
					led_enable <= 4'b1101;
					bus <= num_3;
				end
				3'b100:
				begin
					led_enable <= 4'b1110;
					bus <= num_4;
				end
				default : led_enable <= 4'bxxxx;
			endcase
		end
	end	

	 Sev_Seg_Decoder dec1(bus, .sev_seg_leds);
	 
endmodule