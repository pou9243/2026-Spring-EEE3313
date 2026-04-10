`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/02 19:30:44
// Design Name: 
// Module Name: simple_cpu_tb
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


module simple_cpu_tb;
reg clk, write;
reg[2:0] muxA_sel, muxB_sel;
reg[2:0] opcode;
reg[2:0] D_addr;
wire[3:0] O0, O1, O2, O3, O4, O5, O6, O7;

simple_cpu uut0(
.clk(clk), .write(write), 
.muxA_sel(muxA_sel), .muxB_sel(muxB_sel),
.opcode(opcode), .D_addr(D_addr),
.O0(O0), .O1(O1), .O2(O2), .O3(O3), .O4(O4), .O5(O5), .O6(O6), .O7(O7)
);

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
{opcode, D_addr, muxA_sel, muxB_sel} = 12'b000000001010;
write = 1'b1; #20; write = 1'b0;
{opcode, D_addr, muxA_sel, muxB_sel} = 12'b001000111011;
write = 1'b1; #20; write = 1'b0;
{opcode, D_addr, muxA_sel, muxB_sel} = 12'b010000101010;
write = 1'b1; #20; write = 1'b0;
{opcode, D_addr, muxA_sel, muxB_sel} = 12'b011000101010;
write = 1'b1; #20; write = 1'b0;
{opcode, D_addr, muxA_sel, muxB_sel} = 12'b100011111110;
write = 1'b1; #20; write = 1'b0;
{opcode, D_addr, muxA_sel, muxB_sel} = 12'b101011101010;
write = 1'b1; #20; write = 1'b0;
{opcode, D_addr, muxA_sel, muxB_sel} = 12'b110011101010;
write = 1'b1; #20; write = 1'b0;
{opcode, D_addr, muxA_sel, muxB_sel} = 12'b110011101101;
write = 1'b1; #20; write = 1'b0;
{opcode, D_addr, muxA_sel, muxB_sel} = 12'b111011101010;
write = 1'b1; #20; write = 1'b0;
#10 $finish;
end
endmodule
