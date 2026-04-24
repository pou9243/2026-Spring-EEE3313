`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 19:01:11
// Design Name: 
// Module Name: shift_register_right_rotate_tb
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


module shift_register_right_rotate_tb;
reg clk;
reg clr;
wire[7:0] Q;

shift_register_right_rotate u0(.clk(clk), .clr(clr), .Q(Q));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    clr = 0;
    repeat (16) @(posedge clk);
    $finish;
end
endmodule
