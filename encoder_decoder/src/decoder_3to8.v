`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/27 10:15:41
// Design Name: 
// Module Name: decoder_3to8
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


module decoder_3to8(
input E, A0, A1, A2,
output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
    );
    wire Y0_mid, Y1_mid;
    wire X0, X1; // Dummy output for 2 to 4 decoder dec0. These wires connect to the unused output ports of dec0.
    
    decoder_2to4 dec0(     .E(E), .A0(A2),  .A1(0), .Y0(Y0_mid), .Y1(Y1_mid), .Y2(X0), .Y3(X1));
    decoder_2to4 dec1(.E(Y0_mid), .A0(A0), .A1(A1),     .Y0(Y0),     .Y1(Y1), .Y2(Y2), .Y3(Y3));
    decoder_2to4 dec2(.E(Y1_mid), .A0(A0), .A1(A1),     .Y0(Y4),     .Y1(Y5), .Y2(Y6), .Y3(Y7));
endmodule
