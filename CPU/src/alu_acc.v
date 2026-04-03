`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/02 16:58:19
// Design Name: 
// Module Name: alu_acc
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


module alu_acc(
input clk,
input[3:0] A, B,
input[1:0] opcode,
output reg[3:0] ACC
    );
/*
    always @(*) begin
    case (opcode)
    2'b00: Y = (A + B);
    2'b01: Y = (A - B);
    2'b10: Y = (A & B);
    2'b11: Y = (A | B);
    default: Y = 4'b0000;
    endcase
    end
*/ 
    wire[3:0] Y_add, Y_sub, Y_and, Y_or;
    wire[3:0] YtoACC;

    add_4bit add0(.A(A), .B(B), .Y(Y_add));
    sub_4bit sub0(.A(A), .B(B), .Y(Y_sub));
    and_4bit and0(.A(A), .B(B), .Y(Y_and));
     or_4bit  or0(.A(A), .B(B),  .Y(Y_or));
    
    MUX_4bit mux(.D0(Y_add), .D1(Y_sub), .D2(Y_and), .D3(Y_or), .S(opcode), .Q(YtoACC));
    
    always @(posedge clk) begin
    ACC <= YtoACC;
    end
endmodule

module add_4bit(
input[3:0] A, B,
output[3:0] Y
    );
    assign Y = A + B;   
endmodule

module sub_4bit(
input[3:0] A, B,
output[3:0] Y
    );
    assign Y = A - B;   
endmodule

module and_4bit(
input[3:0] A, B,
output[3:0] Y
    );
    assign Y = A & B;   
endmodule

module or_4bit(
input[3:0] A, B,
output[3:0] Y
    );
    assign Y = A | B;   
endmodule
