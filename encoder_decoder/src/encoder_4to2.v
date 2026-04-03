`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/26 15:16:31
// Design Name: 
// Module Name: encoder_4to2
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


//module encoder_4to2(
//input D0, D1, D2, D3,
//output reg A, B
//    );
//    always @(*) begin
//    case ({D3, D2, D1, D0})
//    4'b0001: begin A = 0; B = 0; end
//    4'b0010: begin A = 0; B = 1; end
//    4'b0100: begin A = 1; B = 0; end
//    4'b1000: begin A = 1; B = 1; end
//    default: begin A = 0; B = 0; end
//    endcase
//    end
//endmodule

module encoder_4to2(
input D0, D1, D2, D3,
output A, B
    );
    or or0(B, D1, D3);
    or or1(A, D2, D3);
endmodule
