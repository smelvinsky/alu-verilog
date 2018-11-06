/* 
 * ALU Verilog example testbench (iverilog 10.1)
 */

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

        $dumpfile("test.vcd");
        $dumpvars;

        $write("%c[1;35m",27); 
        $display("ALU testbench...\n");
        $write("%c[0m",27);

        $display("FLAGS [4:0]:");
        $display("|   4   |  3   |   2   |   1    |    0    |");
        $display("| EQUAL | ZERO | CARRY | PARITY | COMPARE |");

        $display("ADD:");
        Opcode = 0; 
        A = 36; 
        B = 58;
        #10;
        $display("A=%d, B=%d, Opcode=%d, Out=%d, Flags=%b \t\t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("ADD + CARRY:");
        Opcode = 0; 
        A = 250; 
        B = 250;
        #10;
        $display("A=%d, B=%d, Opcode=%d, Out=%d, Flags=%b \t\t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("SUBSTRACT:");
        Opcode = 1; 
        A = 137; 
        B = 26;
        #10;
        $display("A=%d, B=%d, Opcode=%d, Out=%d, Flags=%b \t\t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("SUBSTRACT + CARRY:");
        Opcode = 1; 
        A = 26; 
        B = 137;
        #10;
        $display("A=%d, B=%d, Opcode=%d, Out=%d, Flags=%b \t\t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("INCREMENT A:");
        Opcode = 2; 
        A = 68; 
        #10;
        $display("A=%d, Opcode=%d, Out=%d, Flags=%b \t\t\t%d\n", A, Opcode, Out, Flags, $time);

        $display("INCREMENT A + CARRY:");
        Opcode = 2; 
        A = 255; 
        #10;
        $display("A=%d, Opcode=%d, Out=%d, Flags=%b \t\t\t%d\n", A, Opcode, Out, Flags, $time);

        $display("DECREMENT A:");
        Opcode = 3; 
        A = 68; 
        #10;
        $display("A=%d, Opcode=%d, Out=%d, Flags=%b \t\t\t%d\n", A, Opcode, Out, Flags, $time);

        $display("DECREMENT A + CARRY:");
        Opcode = 3; 
        A = 0; 
        #10;
        $display("A=%d, Opcode=%d, Out=%d, Flags=%b \t\t\t%d\n", A, Opcode, Out, Flags, $time);

        $display("SHIFT A LEFT:");
        Opcode = 4; 
        A = 170; 
        #10;
        $display("A=%b, Opcode=%d, Out=%b, Flags=%b %d\t\t\n", A, Opcode, Out, Flags, $time);

        $display("SHIFT A RIGHT:");
        Opcode = 5; 
        A = 85; 
        #10;
        $display("A=%b, Opcode=%d, Out=%b, Flags=%b %d\t\t\n", A, Opcode, Out, Flags, $time);

        $display("ROTATE A LEFT:");
        Opcode = 6; 
        A = 170; 
        #10;
        $display("A=%b, Opcode=%d, Out=%b, Flags=%b %d\t\n", A, Opcode, Out, Flags, $time);

        $display("ROTATE A RIGHT:");
        Opcode = 7; 
        A = 85; 
        #10;
        $display("A=%b, Opcode=%d, Out=%b, Flags=%b %d\t\n", A, Opcode, Out, Flags, $time);

        $display("AND:");
        Opcode = 8; 
        A = 86; 
        B = 34;
        #10;
        $display("A=%b, B=%b, Opcode=%d, Out=%b, Flags=%b \t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("OR:");
        Opcode = 9; 
        A = 86; 
        B = 34;
        #10;
        $display("A=%b, B=%b, Opcode=%d, Out=%b, Flags=%b \t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("XOR:");
        Opcode = 10; 
        A = 86; 
        B = 34;
        #10;
        $display("A=%b, B=%b, Opcode=%d, Out=%b, Flags=%b \t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("NOR:");
        Opcode = 11; 
        A = 86; 
        B = 34;
        #10;
        $display("A=%b, B=%b, Opcode=%d, Out=%b, Flags=%b \t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("NAND:");
        Opcode = 12; 
        A = 86; 
        B = 34;
        #10;
        $display("A=%b, B=%b, Opcode=%d, Out=%b, Flags=%b \t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("NEGATE A:");
        Opcode = 13; 
        A = 15; 
        #10;
        $display("A=%b, Opcode=%d, Out=%b, Flags=%b %d\t\n", A, Opcode, Out, Flags, $time);

        $display("NOP:");
        Opcode = 14; 
        #10;
        $display("A=%b, B=%b, Opcode=%d, Out=%b, Flags=%b \t%d\n", A, B, Opcode, Out, Flags, $time);

        $display("SWAP NIBBLES A:");
        Opcode = 15; 
        A = 90; 
        #10;
        $display("A=%b, Opcode=%d, Out=%b, Flags=%b %d\t\n", A, Opcode, Out, Flags, $time);

    end
endmodule