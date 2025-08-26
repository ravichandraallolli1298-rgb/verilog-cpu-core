module regalu_tb;

    reg clk, rst, reg_write;
    reg [3:0] read_reg1, read_reg2, write_reg;
    reg [31:0] write_data;
    reg [2:0] alu_ctrl;
    wire [31:0] read_data1, read_data2, result;
    wire zero;

    regfile rf (
        .clk(clk),
        .rst(rst),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .reg_write(reg_write),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    alu a1 (
        .a(read_data1),
        .b(read_data2),
        .alu_ctrl(alu_ctrl),
        .result(result),
        .zero(zero)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("regalu.vcd");
        $dumpvars(0, regalu_tb);

        clk = 0; rst = 1; reg_write = 0;
        #10 rst = 0;

        write_reg = 4'd1; write_data = 32'd10; reg_write = 1;
        #10 reg_write = 0;

        write_reg = 4'd2; write_data = 32'd20; reg_write = 1;
        #10 reg_write = 0;

        read_reg1 = 4'd1; read_reg2 = 4'd2; alu_ctrl = 3'b000;
        #10;

        alu_ctrl = 3'b001;
        #10;

        $finish;
    end
endmodule
