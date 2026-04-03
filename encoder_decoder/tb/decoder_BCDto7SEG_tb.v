`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/27 14:27:24
// Design Name: 
// Module Name: decoder_BCDto7SEG_tb
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


module decoder_BCDto7SEG_tb;
reg[3:0] BCD;
wire[6:0] SEG;

decoder_BCDto7SEG dec0(.BCD(BCD), .SEG(SEG));

initial begin
$display("BCD  |  SEG");
$display("-----------");
$monitor("%d  |  %b", BCD, SEG);
BCD = 4'd0; #10;
BCD = 4'd1; #10;
BCD = 4'd2; #10;
BCD = 4'd3; #10;
BCD = 4'd4; #10;
BCD = 4'd5; #10;
BCD = 4'd6; #10;
BCD = 4'd7; #10;
BCD = 4'd8; #10;
BCD = 4'd9; #10;
BCD = 4'd15; #10;
$finish;
end
endmodule
