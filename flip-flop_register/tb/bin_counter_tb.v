`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 15:46:32
// Design Name: 
// Module Name: bin_counter_tb
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


module bin_counter_tb;
reg clk;
reg clr;
wire[7:0] Q;

bin_counter u0(.clk(clk), .clr(clr), .Q(Q));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    clr = 1; #10
    clr = 0;
    #300;
    clr = 1; #10;
    clr = 0;
    #300;
    $finish;
end
endmodule
