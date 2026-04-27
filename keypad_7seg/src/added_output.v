`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 19:56:07
// Design Name: 
// Module Name: added_output
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


module added_output(
input clk,
input[3:0] data_in,
input in_pulse,
output reg[3:0] tens, ones
    );
    reg[3:0] value_buff1 = 4'd0;
    reg[3:0] value_buff2 = 4'd0;
    reg[4:0] data_out = 5'd0; // Maximum possible value for data_out is 9 + 9 = 18. Hence we need 5-bit register to correctly represent the added result.
    
    // Add logic
    always @(posedge clk) begin
        if (in_pulse) begin
            if (data_in == 4'd15) begin
                data_out <= (value_buff1 + value_buff2);
            end
            else if (data_in <= 4'd9) begin
                value_buff1 <= value_buff2;
                value_buff2 <= data_in;
                data_out <= {1'b0, data_in};
            end
        end
    end
    
    // Digit extraction logic
    always @(*) begin
        if (data_out < 5'd10) begin
            tens = 4'd0;
            ones = data_out; // Here, we are assigning 5-bit value to 4-bit register, but we are using only 4 bits (0 ~ 9) anyway, so no worries!
        end
        else if (data_out >= 5'd10) begin
            tens =  4'd1;
            ones = (data_out - 5'd10);
            // tens = (data_out / 10); or ones = (data_out % 10); is also possible, but using dividing logic just for extracting digits is wasteful.
        end
    end
endmodule
