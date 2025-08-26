module instr_mem (
    input [4:0] addr,
    output [31:0] instr
);

    reg [31:0] memory [0:31];

    initial begin
        memory[0] = 32'b00000000000100010000000000000000;
        memory[1] = 32'b00000000001000100000000000000001;
        memory[2] = 32'b00000000001100110000000000000010;
        memory[3] = 32'b00000000010001000000000000000011;
        memory[4] = 32'b00000000010101010000000000000100;
    end

    assign instr = memory[addr];

endmodule
