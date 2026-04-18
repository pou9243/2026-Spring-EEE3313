`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/18 21:56:02
// Design Name: 
// Module Name: debouncer_no_press_detect
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


module debouncer_no_press_detect(
input clk,
input[3:0] data_in,
input valid_in,
output reg[3:0] data_out
    );
    
    reg[2:0] no_press_cnt = 3'd0;
    
    always @(posedge clk) begin
        if (valid_in) begin
            data_out <= data_in;
            no_press_cnt <= 3'd0;
        end
        else begin
            if (no_press_cnt < 3'd4) begin
                no_press_cnt <= no_press_cnt + 3'd1;
                data_out <= data_in;
            end
            else begin
                data_out <= 4'd0;
            end
        end
    end   
endmodule
