`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/13 11:36:19
// Design Name: 
// Module Name: fa_tb
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


module fa_tb;
reg[3:0] A, B;
reg C_in;
wire[3:0] S;
wire C_out;

full_adder_4bit UUT (.A(A), .B(B), .C_in(C_in), .S(S), .C4(C_out));

initial begin
$monitor("time=%0t | A=%b B=%b Cin=%b | S=%b Cout=%b", $time, A, B, C_in, S, C_out);
A = 4'b1111; B = 4'b0001; C_in = 0; #10;
A = 4'b1010; B = 4'b0101; C_in = 0; #10;
A = 4'b1111; B = 4'b1111; C_in = 0; #10;
A = 4'b1111; B = 4'b1111; C_in = 1; #10;
A = 4'b1001; B = 4'b0110; C_in = 0; #10;
A = 4'b1000; B = 4'b1000; C_in = 0; #10;
$finish;
end
endmodule
