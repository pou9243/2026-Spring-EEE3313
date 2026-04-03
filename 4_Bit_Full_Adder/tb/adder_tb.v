`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/13 10:57:46
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;
reg a, b;
wire s, c;

half_adder_behav adder1 (.A(a), .B(b), .S(s), .C(c));

initial begin
a <= 0; b <= 0;
#10 b <= 1;
#10 a <= 1; b <= 0;
#10 b <= 1;
#20 $finish;
end
endmodule
