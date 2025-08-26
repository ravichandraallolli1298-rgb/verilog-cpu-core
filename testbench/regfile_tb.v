module regfile_tb;

    reg clk, rst, reg_write;
    reg [3:0] read_reg1, read_reg2, write_reg;
    reg [18:0] write_data;
    wire [18:0] read_data1, read_data2;

    regfile uut (
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

    initial begin
        $dumpfile("C:/Users/Ravichandra Allolli/Desktop/verilog/IVerilog_codes/regfile.vcd");
        $dumpvars(0, regfile_tb);

        clk = 0;
        rst = 1;
        reg_write = 0;
        #5 rst = 0;

        write_reg = 4'd1; 
        write_data = 19'd25; 
        reg_write = 1; 
        #10 reg_write = 0;

        write_reg = 4'd2; 
        write_data = 19'd50; 
        reg_write = 1; 
        #10 reg_write = 0;

        read_reg1 = 4'd1;
        read_reg2 = 4'd2;
        #10;

        $finish;
    end

    always #5 clk = ~clk;

endmodule
