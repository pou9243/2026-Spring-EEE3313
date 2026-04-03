`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/13 11:24:33
// Design Name: 
// Module Name: full_adder_4bit
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


module full_adder_4bit(
input[3:0] A, B,
input C_in,
output[3:0] S, output C4
    );
    
    wire C1, C2, C3;

    full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(C_in), .S(S[0]), .C_out(C1));
    full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(C1), .S(S[1]), .C_out(C2));
    full_adder FA2 (.A(A[2]), .B(B[2]), .Cin(C2), .S(S[2]), .C_out(C3));
    full_adder FA3 (.A(A[3]), .B(B[3]), .Cin(C3), .S(S[3]), .C_out(C4));   
endmodule
