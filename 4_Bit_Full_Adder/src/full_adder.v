`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/13 11:03:56
// Design Name: 
// Module Name: full_adder
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


module full_adder(
input A, B, Cin,
output S, C_out
    );
    
    wire S1, C1, C2;
    
    half_adder_behav HA1 (.A(A), .B(B), .S(S1), .C(C1));
    half_adder_behav HA2 (.A(S1), .B(Cin), .S(S), .C(C2));
    or (C_out, C1, C2);
    
endmodule
