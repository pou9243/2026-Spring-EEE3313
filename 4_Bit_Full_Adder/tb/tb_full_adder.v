`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/13 11:09:49
// Design Name: 
// Module Name: tb_full_adder
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


module tb_full_adder;
reg A, B, Cin;

wire Sum, Cout;

full_adder UUT (.A(A), .B(B), .Cin(Cin), .S(Sum), .C_out(Cout));

initial begin
$display(" A B Cin | Sum Cout ");
$display("-----------------------------------");
A = 0; B = 0; Cin = 0; #10;
$display(" %b %b %b | %b %b", A, B, Cin, Sum, Cout);
A = 0; B = 0; Cin = 1; #10;
$display(" %b %b %b | %b %b", A, B, Cin, Sum, Cout);
A = 0; B = 1; Cin = 0; #10;
$display(" %b %b %b | %b %b", A, B, Cin, Sum, Cout);
A = 0; B = 1; Cin = 1; #10;
$display(" %b %b %b | %b %b", A, B, Cin, Sum, Cout);
A = 1; B = 0; Cin = 0; #10;
$display(" %b %b %b | %b %b", A, B, Cin, Sum, Cout);
A = 1; B = 0; Cin = 1; #10;
$display(" %b %b %b | %b %b", A, B, Cin, Sum, Cout);
A = 1; B = 1; Cin = 0; #10;
$display(" %b %b %b | %b %b", A, B, Cin, Sum, Cout);
A = 1; B = 1; Cin = 1; #10;
$display(" %b %b %b | %b %b", A, B, Cin, Sum, Cout);
$finish;
end
endmodule
