`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 10:39:00
// Design Name: 
// Module Name: mux_4bit_tb
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


module mux_4bit_tb;
reg[1:0] S;
reg[3:0] D;
wire Q;

MUX_4bit mux0(.S(S), .D(D), .Q(Q));

initial begin
$monitor("Time = %t | S = %b, D = %b | Q = %b", $time, S, D, Q);
S = 2'b00; D = 4'b1110; #10;
S = 2'b01; #10;
S = 2'b10; #10;
S = 2'b11; #10;
$finish;
end
endmodule
