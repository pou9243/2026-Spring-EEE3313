`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 15:24:09
// Design Name: 
// Module Name: dff_tb
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


module dff_tb;
reg clk;
reg clr;
reg D;
wire Q;
wire Qbar;

dff ff0(.clk(clk), .clr(clr), .D(D), .Q(Q), .Qbar(Qbar));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    clr = 1; D = 0; #10;
    
    clr = 0;
    D = 1; #10; D = 0; #10; D = 0; #10; D = 1; #10;
    
    clr = 1;
    D = 1; #10; D = 0; #10; D = 0; #10; D = 1; #10;
    
    clr = 0; #10;
    $finish;
end
endmodule