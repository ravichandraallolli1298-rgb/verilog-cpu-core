module regfile (
    input clk,
    input rst,
    input [3:0] read_reg1,
    input [3:0] read_reg2,
    input [3:0] write_reg,
    input [18:0] write_data,
    input reg_write,
    output [18:0] read_data1,
    output [18:0] read_data2
);
    reg [31:0] registers [15:0];
    integer i;
    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 16; i = i + 1) registers[i] <= 32'b0;
        end else if (reg_write) begin
            registers[write_reg] <= write_data;
        end
    end
endmodule
