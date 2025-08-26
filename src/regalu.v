module regalu (
    input clk,
    input rst,
    input [3:0] read_reg1,
    input [3:0] read_reg2,
    input [3:0] write_reg,
    input [2:0] alu_ctrl,
    input reg_write,
    output [31:0] result,
    output zero
);
    wire [31:0] a, b;
    regfile rf (
        .clk(clk),
        .rst(rst),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(result),
        .reg_write(reg_write),
        .read_data1(a),
        .read_data2(b)
    );
    alu alu_inst (
        .a(a),
        .b(b),
        .alu_ctrl(alu_ctrl),
        .result(result),
        .zero(zero)
    );
endmodule
