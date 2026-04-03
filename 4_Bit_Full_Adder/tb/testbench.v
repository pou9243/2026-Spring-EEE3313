`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/12 20:16:51
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench;

reg[1:0] t_opcode;
reg[7:0] t_A;
reg[7:0] t_B;
wire[7:0] t_result;

alu alu_inst (.opcode(t_opcode), .A(t_A), .B(t_B), .result(t_result));

initial begin
t_opcode <= 0;
t_A <= 0;
t_B <= 0;
#10 t_A <= 8; t_B <= 7;
#10 t_A <= 10;
#10 t_opcode <= 1;
#10 t_B <= 4;
#10 $finish;
end
endmodule
