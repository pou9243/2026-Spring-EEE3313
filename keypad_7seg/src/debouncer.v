`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/23 21:30:48
// Design Name: 
// Module Name: debouncer
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


module debouncer(
input clk,
input[3:0] data_in,
input valid_in,
output reg[3:0] data_out,
output reg out_pulse
    );
    reg[15:0] hold_cnt = 16'd0;
    reg[3:0] tracking_value = 4'd0;
    
    always @(posedge clk) begin
        out_pulse <= 0;
        if (valid_in) begin
            if (tracking_value == data_in) begin
                if (hold_cnt < 16'd1000) hold_cnt <= hold_cnt + 16'd1;
                if (hold_cnt == 16'd999) begin
                    data_out <= tracking_value;
                    out_pulse <= 1;
                end
                else begin
                    out_pulse <= 0;
                end
            end
            else begin
                tracking_value <= data_in;
                hold_cnt <= 16'd0;
                out_pulse <= 0;
            end
        end
        else begin
            data_out <= data_out;
        end
    end
endmodule
