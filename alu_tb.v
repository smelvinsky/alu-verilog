`timescale 1ns/1ps

`include "alu.v"

module alu_tb;

    reg  [7:0] A, B;
    reg  [3:0] Opcode;
    wire [7:0] Out;
    wire [4:0] Flags;

    integer i;

    alu uut(.a(A), 
            .b(B), 
            .opcode(Opcode), 
            .out(Out), 
            .flags(Flags));

    initial
    begin

        $dumpfile("alu_tb.vcd");
        $dumpvars;

        A = 0; B = 255; 

        for (i = 0; i <= 15; i = i + 1)
        begin
            Opcode = i;
            #10; 
            $display("czas=%d, A=%d, B=%d, Opcode=%d, Out=%d, Flags=%b", $time, A, B, Opcode, Out, Flags);
        end;

    end
endmodule