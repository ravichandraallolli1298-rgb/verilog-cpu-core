module cpu_tb;
    reg clk, rst;

    cpu uut (
        .clk(clk),
        .rst(rst)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, cpu_tb);

        rst = 1; #10;
        rst = 0;

        #200;
        $finish;
    end
endmodule
