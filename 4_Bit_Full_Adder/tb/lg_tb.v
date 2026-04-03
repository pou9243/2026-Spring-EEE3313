`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/13 10:37:10
// Design Name: 
// Module Name: lg_tb
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


module lg_tb;
reg a, b, c;
wire y;

logic_gate uut (.A(a), .B(b), .C(c), .Y(y));

initial begin
a <= 1; b <= 1; c <= 0;
#20 a <= 0; b <= 0;
#20 c <= 1;
#20 a <= 1; b <= 1; c <= 0;
#20 a <= 0; b <= 1;
#20 $finish;
end
endmodule
