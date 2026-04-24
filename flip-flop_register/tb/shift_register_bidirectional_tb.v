`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 17:20:03
// Design Name: 
// Module Name: shift_register_bidirectional_tb
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


module shift_register_bidirectional_tb;
reg clk;
reg clr;
reg SRI, SLI;
reg DIR;
wire SRO, SLO;
wire[7:0] Q;

shift_register_bidirectional u0(.clk(clk), .clr(clr), .SRI(SRI), .SLI(SLI), .DIR(DIR), .SRO(SRO), .SLO(SLO), .Q(Q));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    clr = 1; DIR = 0; SRI = 0; SLI = 0; #10
    clr = 0;
    
    DIR = 0;
    SRI = 1; #10; SRI = 0; #10; SRI = 1; #10; SRI = 1; #10;
    
    DIR = 1;
    SLI = 1; #10; SLI = 0; #10; SLI = 1; #10; SLI = 1; #10;
    
    clr = 1; #10;
    clr = 0; #10;
    $finish;
end
endmodule
