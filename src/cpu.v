module cpu (
    input clk,
    input rst
);
    wire [4:0] pc_out;
    wire [31:0] instruction;
    wire [31:0] read_data1, read_data2, alu_result;
    wire zero;

    pc pc_inst (
        .clk(clk),
        .reset(rst),
        .pc_out(pc_out)
    );

    instr_mem imem (
        .addr(pc_out),
        .instr(instruction)
    );

    wire [3:0] rs1      = instruction[19:16];
    wire [3:0] rs2      = instruction[15:12];
    wire [3:0] rd       = instruction[23:20];
    wire [2:0] alu_ctrl = instruction[2:0];

    regfile rf (
        .clk(clk),
        .rst(rst),
        .read_reg1(rs1),
        .read_reg2(rs2),
        .write_reg(rd),
        .write_data(alu_result),
        .reg_write(1'b1),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    alu alu_inst (
        .a(read_data1),
        .b(read_data2),
        .alu_ctrl(alu_ctrl),
        .result(alu_result),
        .zero(zero)
    );
endmodule
