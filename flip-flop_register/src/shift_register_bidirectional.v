`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 16:55:23
// Design Name: 
// Module Name: shift_register_bidirectional
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


module shift_register_bidirectional(
input clk,
input clr,
input SRI, SLI,
input DIR,
output SRO, SLO,
output[7:0] Q
    );
    
    wire Q0; wire Q1; wire Q2; wire Q3; wire Q4; wire Q5; wire Q6; wire Q7;
    wire D0; wire D1; wire D2; wire D3; wire D4; wire D5; wire D6; wire D7;
    
    MUX_2bit muxA(.A(SRI), .B(Q1), .S(DIR), .Q(D0)); MUX_2bit muxB(.A(Q0), .B(Q2), .S(DIR), .Q(D1));
    MUX_2bit muxC(.A(Q1), .B(Q3), .S(DIR), .Q(D2)); MUX_2bit muxD(.A(Q2), .B(Q4), .S(DIR), .Q(D3));
    MUX_2bit muxE(.A(Q3), .B(Q5), .S(DIR), .Q(D4)); MUX_2bit muxF(.A(Q4), .B(Q6), .S(DIR), .Q(D5));
    MUX_2bit muxG(.A(Q5), .B(Q7), .S(DIR), .Q(D6)); MUX_2bit muxH(.A(Q6), .B(SLI), .S(DIR), .Q(D7));
    
    dff QA (.clk(clk), .clr(clr), .D(D0), .Q(Q0));
    dff QB (.clk(clk), .clr(clr), .D(D1), .Q(Q1));
    dff QC (.clk(clk), .clr(clr), .D(D2), .Q(Q2));
    dff QD (.clk(clk), .clr(clr), .D(D3), .Q(Q3));
    dff QE (.clk(clk), .clr(clr), .D(D4), .Q(Q4));
    dff QF (.clk(clk), .clr(clr), .D(D5), .Q(Q5));
    dff QG (.clk(clk), .clr(clr), .D(D6), .Q(Q6));
    dff QH (.clk(clk), .clr(clr), .D(D7), .Q(Q7));
    
    assign Q = {Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7};
    assign SRO = Q7;
    assign SLO = Q0;
endmodule
