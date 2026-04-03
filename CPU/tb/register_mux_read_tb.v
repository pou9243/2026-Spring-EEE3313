`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/02 16:45:27
// Design Name: 
// Module Name: register_mux_read_tb
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


module register_mux_read_tb;
reg[3:0] R0, R1, R2, R3, R4, R5, R6, R7;
reg[2:0] muxA_sel, muxB_sel;
wire[3:0] BUS_A, BUS_B;

register_mux_read uut(
.R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), .R6(R6), .R7(R7),
.muxA_sel(muxA_sel), .muxB_sel(muxB_sel), 
.BUS_A(BUS_A), .BUS_B(BUS_B));

initial begin
R0 = 4'b0000; R1 = 4'b0001; R2 = 4'b0010; R3 = 4'b0011;  
R4 = 4'b0100; R5 = 4'b0101; R6 = 4'b0110; R7 = 4'b0111;
{muxA_sel, muxB_sel} = {3'b000, 3'b000}; #10
{muxA_sel, muxB_sel} = {3'b100, 3'b001}; #10
{muxA_sel, muxB_sel} = {3'b011, 3'b110}; #10
{muxA_sel, muxB_sel} = {3'b101, 3'b011}; #10
R5 = 4'b1000; #10;
$finish;
end
endmodule