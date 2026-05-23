`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/23 16:12:40
// Design Name: 
// Module Name: traffic_ctrl_3way_auto
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


module traffic_ctrl_3way_auto #(
// Car straight
parameter integer T0_G = 10,
parameter integer T0_Y = 5,
parameter integer T0_AR = 2,

// Car left turn
parameter integer T1_G = 8,
parameter integer T1_Y = 5,
parameter integer T1_AR = 2,

// Pedestrian
parameter integer T2_G = 8,
parameter integer T2_AR = 2
)
(
input clk,
output reg [2:0] str,  // {R, Y, G}
output reg [2:0] left, // {R, Y, G}
output reg [1:0] ped   // {R, G}
    );
    // FSM states
    localparam [1:0] 
        S0 = 2'd0,  // Car straight states
        S1 = 2'd1,  // Car left turn states
        S2 = 2'd2;  // Pedestrian states
        
    reg [1:0] state = S0;
    
    // Reference times
    integer t_end_g, t_end_y, t_total;
    always @(*) begin
        case (state)
            S0: begin
                t_end_g = T0_G;
                t_end_y = T0_G + T0_Y;
                t_total = T0_G + T0_Y + T0_AR;
            end
            
            S1: begin
                t_end_g = T1_G;
                t_end_y = T1_G + T1_Y;
                t_total = T1_G + T1_Y + T1_AR;
            end
            
            S2: begin
                t_end_g = T2_G;
                t_total = T2_G + T2_AR;
            end
            
            default: begin
                t_end_g = 1; t_end_y = 2; t_total = 3;
            end
        endcase
    end
    
    // State Transition & sec_cnt reset
    integer sec_cnt = 0; 
    always @(posedge clk) begin
        if (sec_cnt >= t_total - 1) begin
            sec_cnt <= 0;
            case (state)
                S0: state <= S1;
                S1: state <= S2;
                S2: state <= S0;
                default: state <= S0;
            endcase
        end else
            sec_cnt <= sec_cnt + 1;
    end
    
    // Moore Machine
    always @(*) begin
        str = ~(3'b100); left = ~(3'b100); ped = ~(2'b10);  // Default: All Red
        case (state)
            S0: begin
                if (sec_cnt < t_end_g)
                    str = ~(3'b001);  // Micro-state: car straight go
                else if (sec_cnt < t_end_y)
                    str = ~(3'b010);  // Micro-state: car straight yellow
                else
                    str = ~(3'b100);  // Micro-state: car straight stop
            end
            
            // Micro-state between S0 & S1: All Red
            
            S1: begin
                if (sec_cnt < t_end_g)
                    left = ~(3'b001);  // Micro-state: car left turn go
                else if (sec_cnt < t_end_y)
                    left = ~(3'b010);  // Micro-state: car left turn yellow
                else
                    left = ~(3'b100);  // Micro-state: car left turn stop
            end
            
            // Micro-state between S1 & S2: All Red
            
            S2: begin
                if (sec_cnt < t_end_g)
                    ped = ~(2'b01);  // Micro-state: pedestrian go
                else
                    ped = ~(2'b10);  // Micro-state: pedestrian stop
            end
            
            // Micro-state between S2 & S0: All Red
        endcase
    end
endmodule
