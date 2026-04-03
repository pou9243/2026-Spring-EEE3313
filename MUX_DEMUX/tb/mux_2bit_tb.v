`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 10:17:10
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;
reg S;
reg[1:0] D;
wire Q;

MUX_2bit mux0(.S(S), .D(D), .Q(Q));

initial begin
$monitor("Time = %t | S = %b, D[0] = %b, D[1] = %b | Q = %b", $time, S, D[0], D[1], Q);
S = 0; D[0] = 0; D[1] = 1; #10;
S = 1; #10;
S = 0; D[0] = 1; #10;
D[0] = 0; #10
$finish;
end
endmodule
