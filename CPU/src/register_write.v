`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/02 17:27:21
// Design Name: 
// Module Name: register_write
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


module register_write(
input clk,
input write,
input[2:0] D_addr,
input[3:0] Data_in,
output /*reg*/[3:0] R0, R1, R2, R3, R4, R5, R6, R7
    );
/*    
    initial begin
    R0 = 4'b0000; R1 = 4'b0001; R2 = 4'b0010; R3 = 4'b0011;
    R4 = 4'b0100; R5 = 4'b0101; R6 = 4'b0110; R7 = 4'b0111;
    end
    
    always @(posedge clk) begin
    if (write) begin
    case (D_addr)
    3'b000: R0 <= Data_in; 3'b001: R1 <= Data_in;
    3'b010: R2 <= Data_in; 3'b011: R3 <= Data_in;
    3'b100: R4 <= Data_in; 3'b101: R5 <= Data_in;
    3'b110: R6 <= Data_in; 3'b111: R7 <= Data_in;
    default: ;
    endcase
    end
    end
endmodule
*/  
    wire dec_0, dec_1, dec_2, dec_3, dec_4, dec_5, dec_6, dec_7;
    wire load_en0, load_en1, load_en2, load_en3, load_en4, load_en5, load_en6, load_en7;
    
    decoder_3to8 dec(.A(D_addr),
    .Y0(dec_0), .Y1(dec_1), .Y2(dec_2), .Y3(dec_3), .Y4(dec_4), .Y5(dec_5), .Y6(dec_6), .Y7(dec_7));
    
    and and0(load_en0, write, dec_0); and and1(load_en1, write, dec_1);
    and and2(load_en2, write, dec_2); and and3(load_en3, write, dec_3);
    and and4(load_en4, write, dec_4); and and5(load_en5, write, dec_5);
    and and6(load_en6, write, dec_6); and and7(load_en7, write, dec_7);
    
    reg_en #(.INIT_VAL(4'b0000)) reg0(.clk(clk), .Data_in(Data_in), .load_en(load_en0), .Data_out(R0));
    reg_en #(.INIT_VAL(4'b0001)) reg1(.clk(clk), .Data_in(Data_in), .load_en(load_en1), .Data_out(R1));
    reg_en #(.INIT_VAL(4'b0010)) reg2(.clk(clk), .Data_in(Data_in), .load_en(load_en2), .Data_out(R2));
    reg_en #(.INIT_VAL(4'b0011)) reg3(.clk(clk), .Data_in(Data_in), .load_en(load_en3), .Data_out(R3));
    reg_en #(.INIT_VAL(4'b0100)) reg4(.clk(clk), .Data_in(Data_in), .load_en(load_en4), .Data_out(R4));
    reg_en #(.INIT_VAL(4'b0101)) reg5(.clk(clk), .Data_in(Data_in), .load_en(load_en5), .Data_out(R5));
    reg_en #(.INIT_VAL(4'b0110)) reg6(.clk(clk), .Data_in(Data_in), .load_en(load_en6), .Data_out(R6));
    reg_en #(.INIT_VAL(4'b0111)) reg7(.clk(clk), .Data_in(Data_in), .load_en(load_en7), .Data_out(R7));
endmodule


// register with load enable
module reg_en #(parameter INIT_VAL = 4'b0000) (
input clk,
input[3:0] Data_in,
input load_en,
output reg[3:0] Data_out
    );
    initial begin
    Data_out = INIT_VAL;
    end
    
    always @(posedge clk) begin
    if (load_en) begin
    Data_out <= Data_in;
    end
    end
endmodule
