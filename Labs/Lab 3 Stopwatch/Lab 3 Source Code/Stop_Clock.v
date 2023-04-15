`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:58 10/28/2022 
// Design Name: 
// Module Name:    Time_Location
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

module Stop_Clock(
    input clk,
    input reset,
    input pause,
    output reg out
    );
    parameter nBit = 18;
    reg [nBit-1:0] counter;

    always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            counter <= 1'b0;
            out <= 1'b1;
        end
        else
        begin
            if(pause)
            
            else
                counter <= counter;
        end
    end
    
endmodule