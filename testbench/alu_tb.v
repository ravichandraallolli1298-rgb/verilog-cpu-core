module alu_tb;

    reg [18:0] a, b;
    reg [2:0] alu_ctrl;
    wire [18:0] result;
    wire zero;

    alu uut (
        .a(a),
        .b(b),
        .alu_ctrl(alu_ctrl),
        .result(result),
        .zero(zero)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        a = 19'd25; b = 19'd10; alu_ctrl = 3'b000; #10;
        a = 19'd25; b = 19'd10; alu_ctrl = 3'b001; #10;
        a = 19'd25; b = 19'd10; alu_ctrl = 3'b010; #10;
        a = 19'd25; b = 19'd10; alu_ctrl = 3'b011; #10;
        a = 19'd25; b = 19'd10; alu_ctrl = 3'b100; #10;

        a = 19'd15; b = 19'd15; alu_ctrl = 3'b001; #10;

        $finish;
    end

endmodule
