/* ALU Verilog example
 * |---- OPCODE ----|         |----- OPERATION -----|
 * |     0b0000     |         |     out = a + b     |
 * |     0b0001     |         |     out = a - b     |
 * |     0b0010     |         |     out = a * b     | 
 * |     0b0011     |         |     out = a / b     |
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
 * |     0b1110     |         | *compare => flags*  |
 * |     0b1111     |         |   *swap nibbles*    |
 */
 
 module alu
 (
     input  [7:0] a,b,
     input  [3:0] opcode,
     output [7:0] out,
     output [7:0] flags
 );