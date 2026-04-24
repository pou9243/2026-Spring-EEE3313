`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 16:23:25
// Design Name: 
// Module Name: register_PIPO_tb
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


module register_PIPO_tb;
reg clk;
reg clr;
reg[7:0] D;
wire[7:0] Q;

register_PIPO u0 (.clk(clk), .clr(clr), .D(D), .Q(Q));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    clr = 1; D = 8'b00000000; #10;
    clr = 0;
    
    D = 8'b00100101; #10;
    D = 8'b11111111; #10;
    
    clr = 1;
    D = 8'b00000001; #10;
    D = 8'b11110000; #10;
    
    clr = 0; #10;
    $finish;
end
endmodule
