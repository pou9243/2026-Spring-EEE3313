`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/02 17:37:00
// Design Name: 
// Module Name: register_write_tb
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


module register_write_tb;
reg clk;
reg write;
reg[2:0] D_addr;
reg[3:0] Data_in;
wire[3:0] R0, R1, R2, R3, R4, R5, R6, R7;

register_write uut(.clk(clk), .write(write), .D_addr(D_addr), .Data_in(Data_in),
.R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), .R6(R6), .R7(R7));

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
Data_in = 4'b1000;
D_addr = 3'b000; write = 1'b0; #10;
D_addr = 3'b000; write = 1'b1; #10;
D_addr = 3'b100; write = 1'b1; #10;
D_addr = 3'b011; write = 1'b1; #10;
$finish;
end
endmodule
