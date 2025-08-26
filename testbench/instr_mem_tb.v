module instr_mem_tb;

    reg [4:0] addr;
    wire [31:0] instr;

    instr_mem uut (
        .addr(addr),
        .instr(instr)
    );

    initial begin
        $dumpfile("instr_mem.vcd");
        $dumpvars(0, instr_mem_tb);

        addr = 5'd0; #10;
        addr = 5'd1; #10;
        addr = 5'd2; #10;
        addr = 5'd3; #10;
        addr = 5'd4; #10;

        $finish;
    end

endmodule
