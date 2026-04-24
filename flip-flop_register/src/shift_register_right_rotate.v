`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 18:56:38
// Design Name: 
// Module Name: shift_register_right_rotate
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


module shift_register_right_rotate(
input clk,
input clr,
output[7:0] Q
    );
    
    wire Q0; wire Q1; wire Q2; wire Q3; wire Q4; wire Q5; wire Q6; wire Q7;
    wire D0; wire D1; wire D2; wire D3; wire D4; wire D5; wire D6; wire D7;
    
    assign D0 = Q7; assign D1 = Q0; assign D2 = Q1; assign D3 = Q2;
    assign D4 = Q3; assign D5 = Q4; assign D6 = Q5; assign D7 = Q6;
    
    dff QA (.clk(clk), .clr(clr), .D(D0), .Q(Q0));
    dff QB (.clk(clk), .clr(clr), .D(D1), .Q(Q1));
    dff QC (.clk(clk), .clr(clr), .D(D2), .Q(Q2));
    dff QD (.clk(clk), .clr(clr), .D(D3), .Q(Q3));
    dff QE (.clk(clk), .clr(clr), .D(D4), .Q(Q4));
    dff QF (.clk(clk), .clr(clr), .D(D5), .Q(Q5));
    dff QG (.clk(clk), .clr(clr), .D(D6), .Q(Q6));
    dff QH (.clk(clk), .clr(clr), .D(D7), .Q(Q7));
    
    assign Q = {Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7};
    
    initial begin // If it works, it works.
        force {Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7} = 8'b00001010;
        #6 release {Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7};
    end
endmodule
