`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 10:57:04
// Design Name: 
// Module Name: mux_8bit_tb
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


module mux_8bit_tb;
reg[2:0] S;
reg[7:0] D;
wire Q;

MUX_8bit mux0(.S(S), .D(D), .Q(Q));

initial begin
$monitor("Time = %t | S = %b, D = %b | Q = %b", $time, S, D, Q);
S = 3'b000; D = 8'b10101010; #10;
S = 3'b001; #10;
S = 3'b010; #10;
S = 3'b011; #10;
S = 3'b100; #10;
S = 3'b101; #10;
S = 3'b110; #10;
S = 3'b111; #10;
$finish;
end
endmodule
