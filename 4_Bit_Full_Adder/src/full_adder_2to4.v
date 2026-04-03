`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 09:20:36
// Design Name: 
// Module Name: full_adder_2to4
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

module full_adder_2bit(
input[1:0] A, B,
input C_in,
output[1:0] S,
output C_out
    );
    
    wire C1;

    full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(C_in), .S(S[0]), .C_out(C1));
    full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(C1), .S(S[1]), .C_out(C_out));
endmodule

module full_adder_2to4(
input[3:0] A, B,
input C_in,
output[3:0] S, 
output C4
    );
    
    wire C_mid;
    
    full_adder_2bit FA2b0 (.A(A[1:0]), .B(B[1:0]), .C_in(C_in), .S(S[1:0]), .C_out(C_mid));
    full_adder_2bit FA2b1 (.A(A[3:2]), .B(B[3:2]), .C_in(C_mid), .S(S[3:2]), .C_out(C4));
endmodule
