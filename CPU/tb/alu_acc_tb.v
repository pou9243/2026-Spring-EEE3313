`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/02 17:08:04
// Design Name: 
// Module Name: alu_acc_tb
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


module alu_acc_tb;
reg clk;
reg[3:0] A, B;
reg[1:0] opcode;
wire[3:0] Y, ACC;

alu_acc uut(.clk(clk), .A(A), .B(B), .opcode(opcode), .Y(Y), .ACC(ACC));

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
A = 4'd10; B = 4'd3; opcode = 2'b00; #10
A = 4'd07; B = 4'd3; opcode = 2'b01; #10
A = 4'b1001; B = 4'b1110; opcode = 2'b10; #10
A = 4'b1100; B = 4'b1010; opcode = 2'b11; #10
$finish;
end
endmodule
