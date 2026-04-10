`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/02 19:09:16
// Design Name: 
// Module Name: simple_cpu
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


module simple_cpu(
input clk, write,
input[2:0] muxA_sel, muxB_sel,
input[2:0] opcode,
input[2:0] D_addr,
output reg[3:0] O0, O1, O2, O3, O4, O5, O6, O7 // 'probe' for reading value stored in register
    );
    wire[3:0] R0, R1, R2, R3, R4, R5, R6, R7;
    wire[3:0] BUS_A, BUS_B;
    wire[3:0] ACC;
    
    register_mux_read uut0(
    .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), .R6(R6), .R7(R7),
    .muxA_sel(muxA_sel), .muxB_sel(muxB_sel), .BUS_A(BUS_A), .BUS_B(BUS_B));
    
    alu_acc uut1(
    .clk(clk), .A(BUS_A), .B(BUS_B), .opcode(opcode), .ACC(ACC)
    );
    
    register_write uut2(
    .clk(clk), .write(write), .D_addr(D_addr), .Data_in(ACC),
    .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), .R6(R6), .R7(R7)
    );
    
    always @(*)begin
    {O0, O1, O2, O3, O4, O5, O6, O7} = {R0, R1, R2, R3, R4, R5, R6, R7};
    end
endmodule
