`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 10:07:26
// Design Name: 
// Module Name: fa_4to8_tb
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


module fa_4to8_tb;
reg[7:0] A, B;
reg C_in;
wire[7:0] S;
wire C_out;

full_adder_4to8 UUT (.A(A), .B(B), .C_in(C_in), .S(S), .C_out(C_out));

initial begin
$monitor("time=%0t | A=%b B=%b Cin=%b | S=%b Cout=%b", $time, A, B, C_in, S, C_out);
A = 8'b11111111; B = 8'b00000001; C_in = 0; #10;
A = 8'b10101010; B = 8'b01010101; C_in = 0; #10;
A = 8'b11111111; B = 8'b11111111; C_in = 0; #10;
A = 8'b11111111; B = 8'b11111111; C_in = 1; #10;
A = 8'b10011001; B = 8'b01100110; C_in = 0; #10;
A = 8'b10000000; B = 8'b10000000; C_in = 0; #10;
$finish;
end
endmodule
