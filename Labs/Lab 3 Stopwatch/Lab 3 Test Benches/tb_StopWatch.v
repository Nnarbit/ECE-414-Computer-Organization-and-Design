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

module tb_StopWatch;

    // Inputs
    reg clk;
    reg reset;
    reg pause;

    // outputs
    wire [3:0] num_1;
    wire [3:0] num_2;
    wire [3:0] num_3;
    wire [3:0] num_4;

    // Instantiate the Unit Under Test (UUT)
    Time_Counter uut (
        .clk(clk),
        .reset(reset),
        .pause(pause),
        .num_1(num_1),
        .num_2(num_2),
        .num_3(num_3),
        .num_4(num_4)
    );
    integer i, j, k;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        pause = 0;
        #10;

        clk = 0;
        reset = 1;
        pause = 0;
        #10;

        clk = 0;
        reset = 0;
        pause = 0;
        #10;

        for(i = 0; i < 31'd500000000; i = i + 1)
        begin
            clk = 0;
            #1;
            clk = 1;
            #1;
        end

        clk = 1;
        reset = 0;
        pause = 0;
        #10;

        for(i = 0; i < 31'd500000; i = i + 1)
            #1 clk = ~clk;

        clk = 0;
        reset = 0;
        pause = 0;
        #100;

        for (j = 0; j < 31'd2500; j = j + 1)
            #1 clk = ~clk;

        clk = 0;
        reset = 0;
        pause = 1;
        #100;

        for(k = 0; k < 31'd2500; k = k + 1)
            #1 clk = ~clk;

    end

endmodule