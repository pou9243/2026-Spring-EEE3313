`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 16:46:53
// Design Name: 
// Module Name: register_SIPO_tb
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


module register_SIPO_tb;
reg clk;
reg clr;
reg D;
wire[7:0] Q;

register_SIPO u0 (.clk(clk), .clr(clr), .D(D), .Q(Q));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    clr = 1; D = 0; #10;
    clr = 0;
    
    D = 1; #10; D = 0; #10; D = 0; #10; D = 1; #10;
    D = 1; #10; D = 1; #10; D = 1; #10; D = 0; #10;
    
    #80;
    $finish;
end
endmodule
