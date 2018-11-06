
/* 
 * ALU Verilog example
 *
 * Instruction set:
 * |---- OPCODE ----|         |----- OPERATION -----|
 * |     0b0000     |         |     out = a + b     |
 * |     0b0001     |         |     out = a - b     |
 * |     0b0010     |         |     out = a + 1     | 
 * |     0b0011     |         |     out = a - 1     |
 * |     0b0100     |         |     out = a << 1    |
 * |     0b0101     |         |     out = a >> 1    |
 * |     0b0110     |         | out = *rotate left* |
 * |     0b0111     |         | out = *rotate right*|
 * |     0b1000     |         |    out = A and B    |
 * |     0b1001     |         |    out = A or B     |
 * |     0b1010     |         |    out = A xor B    |
 * |     0b1011     |         |    out = A nor B    |
 * |     0b1100     |         |    out = A nand B   |
 * |     0b1101     |         |      out = ~ A      |
 * |     0b1110     |         |        *nop*        |
 * |     0b1111     |         |   *swap nibbles*    |
 *
 * Status register:
 * |-- BIT --|   |-- BIT NAME --|   |------------------------------- FUNCTION ------------------------------|
 * |    4    |   |      E       |   |  Equal flag     - A & B are equal                                     |            
 * |    3    |   |      Z       |   |  Zero flag      - the result of instruction equals 0                  |
 * |    2    |   |      C       |   |  Carry flag     - an arithmetic carry or borrow has been generated    |
 * |    1    |   |      P       |   |  Parity flag    - indicates if the number of set bits is odd or even  |
 * |    0    |   |      G       |   |  Compare flag   - (greater flag) if A => B => 1; A < B => 0;          | 
 */
 
 module alu
 (
     input  [7:0] a,b,
     input  [3:0] opcode,
     output [7:0] out,
     output [4:0] flags
 );

    reg  [8:0] result;
    reg  [4:0] status_reg;

    assign flags = status_reg;
    assign out = result[7:0];

    always @ (*)
    begin
        case (opcode)
            4'b0000:
                result = a + b;
            4'b0001:
                result = a - b;
            4'b0010:  
               result = a + 1;
            4'b0011:
                result = a - 1;
            4'b0100:
                result = {1'b0, a << 1};
            4'b0101:
                result = {1'b0, a >> 1};
            4'b0110:
                result = {a[6:0], a[7]};
            4'b0111:
                result = {a[0], a[7:1]};
            4'b1000:
                result = a & b;
            4'b1001:
                result = a | b;
            4'b1010:
                result = a ^ b;
            4'b1011:
                result = {1'b0, ~(a | b)};
            4'b1100:
                result = {1'b0, ~(a & b)};
            4'b1101:
                result = {1'b0, ~a};
            4'b1110:
                result = result;
            4'b1111:
                result = {a[3:0], a[7:4]};    
            default: 
                result = a;
        endcase

        /* if not NOP command */
        if (opcode != 4'b1110)
            begin
                /* carry/borrow flag */
                status_reg[2] <= result[8];

                /* equal flag */
                if (a == b)
                    status_reg[4] <= 1'b1;
                else
                    status_reg[4] <= 1'b0;

                /* zero flag */
                if (result == 0)
                    status_reg[3] <= 1'b1;
                else
                    status_reg[3] <= 1'b0; 

                /* parity flag */
                status_reg[1] = ~^a;

                /* compare flag */
                if (a >= b)
                    status_reg[0] <= 1'b1;
                else
                    status_reg[0] <= 1'b0;
            end
    end

endmodule