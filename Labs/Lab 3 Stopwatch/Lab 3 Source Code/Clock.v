`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:52 10/28/2022 
// Design Name: 
// Module Name:    Clock
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

module Clock(
    input clk,
    input reset,
    input pause,
    input [nBit-1:0] limit,
    output reg out
    );
    parameter nBit = 18;
    reg [nBit-1:0] counter;

    always @(posedge clk or posedge reset or posedge pause)
    begin
        if(reset)
        begin
            counter <= 1'b0;
            out <= 1'b1;
        end
        else
        begin
            if (pause)
                counter <= counter;
            else
            begin
                if (coutner == limit)
                begin
                    counter <= 1'b0;
                    out <= ~out;
                end
                else
                begin
                    counter <= counter + 1'b1;
                    out <= out;
                end
            end
        end
    end

endmodule