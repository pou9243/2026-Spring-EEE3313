`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/26 14:49:42
// Design Name: 
// Module Name: decoder_2to4
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


//module decoder_2to4(
//input E, A0, A1,
//output reg Y0, Y1, Y2, Y3
//    );
//    always @(*) begin
//    Y0 = 0; Y1 = 0; Y2 = 0; Y3 = 0;
//    case ({E, A1, A0})
//    3'b100: Y0 = 1;
//    3'b101: Y1 = 1;
//    3'b110: Y2 = 1;
//    3'b111: Y3 = 1;
//    endcase
//    end
//endmodule

module decoder_2to4(
input E, A0, A1,
output Y0, Y1, Y2, Y3
    );
    wire notA0;
    wire notA1;
    
    not n0(notA0, A0);
    not n1(notA1, A1);
    
    and and0(Y0, E, notA0, notA1);
    and and1(Y1, E,    A0, notA1);
    and and2(Y2, E, notA0,    A1);
    and and3(Y3, E,    A0,    A1);
endmodule
