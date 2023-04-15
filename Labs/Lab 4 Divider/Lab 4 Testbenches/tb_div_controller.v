module tb_div_controller;

    // Inputs
    reg sub_count;
    reg clk;
    reg reset;
    reg [3:0] counter;

    // Outputs
    wire AB_Load;
    wire A_ShiftLeft;
    wire R_Load;
    wire R_ShiftLeft;
    wire Q_ShiftLeft;

    // Instantiate the Unit Under Test (UUT)
    Controller uut (
        .sub_count(sub_count),
        .clk(clk),
        .reset(reset),
        .counter(counter),
        .AB_Load(AB_Load),
        .A_ShiftLeft(A_ShiftLeft),
        .R_Load(R_Load),
        .R_ShiftLeft(R_ShiftLeft),
        .Q_ShiftLeft(Q_ShiftLeft)
    );

    initial begin // clock
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin // reset
        reset = 1'b1; // S0 and S1
        #10;
        reset = 1'b0;
        #10;
    end

    initial begin // input testing
        #10;
        sub_count = 0;
        counter = 0;
        #20;

        sub_count = 0; // S5
        counter = 15;
        #20;

        reset = 1'b1'; // S0 and S1
        #10;
        reset = 1'b0;
        #10;

        #10; // S3
        sub_count = 1;
        counter = 0;
        # 20;

        sub_count = 1; // S4
        counter = 0;
        #20;
    end
endmodule