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
input[2:0] opcode,
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
    wire[3:0] Y_add, Y_sub, Y_and, Y_or, Y_xor, Y_not, Y_com, Y_inc;
    wire[3:0] YtoACC;

    add_4bit add0(.A(A), .B(B), .Y(Y_add));
    sub_4bit sub0(.A(A), .B(B), .Y(Y_sub));
    and_4bit and0(.A(A), .B(B), .Y(Y_and));
     or_4bit  or0(.A(A), .B(B),  .Y(Y_or));
    xor_4bit xor0(.A(A), .B(B), .Y(Y_xor));
    not_4bit not0(.A(A), .B(B), .Y(Y_not));
    com_4bit com0(.A(A), .B(B), .Y(Y_com));
    inc_4bit inc0(.A(A), .B(B), .Y(Y_inc));
    
    MUX_8bit mux(.D0(Y_add), .D1(Y_sub), .D2(Y_and), .D3(Y_or),
    .D4(Y_xor), .D5(Y_not), .D6(Y_com), .D7(Y_inc), .S(opcode), .Q(YtoACC));
    
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

module xor_4bit(
input[3:0] A, B,
output[3:0] Y
    );
    assign Y = A ^ B;   
endmodule

module not_4bit(
input[3:0] A, B,
output[3:0] Y
    );
    assign Y = ~A;   
endmodule

module com_4bit(
input[3:0] A, B,
output reg[3:0] Y
    );
    always @(*) begin
    if  (A == B) Y = 4'b0001;
    else Y = 4'b0000;
    end  
endmodule

module inc_4bit(
input[3:0] A, B,
output[3:0] Y
    );
    assign Y = A + 1;
endmodule
