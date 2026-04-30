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
    localparam TARGET_CNT = 16'd1000;
    
    reg[15:0] hold_cnt = 16'd0;
    reg[3:0] tracking_value = 4'd0;
    
    always @(posedge clk) begin
        if (valid_in) begin
            // Count-up if data_in is stable.
            if (tracking_value == data_in) begin
                if (hold_cnt <= TARGET_CNT) begin
                    hold_cnt <= hold_cnt + 16'd1;
                end
            end
            else begin
                tracking_value <= data_in;
                hold_cnt <= 16'd0;
            end
            
            // Update data_out and generate a pulse if the condition is met.
            if (hold_cnt == TARGET_CNT) begin
                data_out <= tracking_value;
                out_pulse <= 1'b1; // single-clock pulse
            end
            else begin
                out_pulse <= 1'b0; // single-clock pulse
            end
        end
       
        // Hold data_out & initialize the necessary values when valid_in is 0.
        else begin
            data_out <= data_out;
            out_pulse <= 1'b0;
            hold_cnt <= 16'd0;
        end
    end
endmodule
