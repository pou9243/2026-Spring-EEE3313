`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/02 16:35:27
// Design Name: 
// Module Name: register_mux_read
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


module register_mux_read(
input[3:0] R0, R1, R2, R3, R4, R5, R6, R7,
input[2:0] muxA_sel, muxB_sel,
output[3:0] BUS_A, BUS_B
    );
/*
    always @(*) begin
    case (muxA_sel)
    3'b000: BUS_A = R0;    3'b001: BUS_A = R1;
    3'b010: BUS_A = R2;    3'b011: BUS_A = R3;
    3'b100: BUS_A = R4;    3'b101: BUS_A = R5;
    3'b110: BUS_A = R6;    3'b111: BUS_A = R7;
    default: BUS_A = 4'b0000;
    endcase
    case (muxB_sel)
    3'b000: BUS_B = R0;    3'b001: BUS_B = R1;
    3'b010: BUS_B = R2;    3'b011: BUS_B = R3;
    3'b100: BUS_B = R4;    3'b101: BUS_B = R5;
    3'b110: BUS_B = R6;    3'b111: BUS_B = R7;
    default: BUS_B = 4'b0000;
    endcase
    end
*/
    MUX_8bit muxA(.D0(R0), .D1(R1), .D2(R2), .D3(R3), .D4(R4), .D5(R5), .D6(R6), .D7(R7),
    .S(muxA_sel), .Q(BUS_A));
    MUX_8bit muxB(.D0(R0), .D1(R1), .D2(R2), .D3(R3), .D4(R4), .D5(R5), .D6(R6), .D7(R7),
    .S(muxB_sel), .Q(BUS_B));
endmodule
