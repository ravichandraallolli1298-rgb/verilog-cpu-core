module pc_tb;

    reg clk, reset;
    wire [4:0] pc_out;

    pc uut (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out)
    );

    initial begin
        $dumpfile("pc.vcd");
        $dumpvars(0, pc_tb);

        clk = 0; reset = 1; #10;
        reset = 0;

        #100;
        $finish;
    end

    always #5 clk = ~clk;

endmodule
