module tb_div_toplevel;

    // Inputs
    reg [15:0] A;
    reg [15:0] B;
    reg clk;
    reg reset;

    // Outputs
    wire [15:0] R;
    wire [15:0] Q;

    // Instantiate the Unit Under Test (UUT)
    tb_div_toplevel uut (
        .A(A),
        .B(B),
        .clk(clk),
        .reset(reset),
        .R(R),
        .Q(Q)
    );
    initial begin //clock
        clk = 1'b0;
        forever #1 clk = ~clk;
    end

    initial begin // reset
        reset = 1'b1;
        #10;
        reset = 1'b0;
    end

    initial begin // input testing
        A = 100;
        B = 20;
        #200;

        rest = 1'b1;
        #10;
        reset = 1'b0;

        A = 55;
        B = 7;
        #200;
    end

endmodule