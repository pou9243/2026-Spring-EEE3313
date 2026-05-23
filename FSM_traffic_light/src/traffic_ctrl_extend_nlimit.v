`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/23 14:51:48
// Design Name: 
// Module Name: traffic_ctrl_extend_nlimit
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


module traffic_ctrl_extend_nlimit #(
parameter integer T_YELLOW = 3,
parameter integer T_WALK   = 5,
parameter integer EXT_LMT  = 3
)(
input clk,
input btn,
output reg [2:0] car,
output reg [1:0] ped
    );
    // Car traffic light: {R, Y, G}
    localparam [2:0]
        CAR_R = ~(3'b100),
        CAR_Y = ~(3'b010),
        CAR_G = ~(3'b001);
    
    // Pedestrian traffic light: {R, G}
    localparam [1:0]
        PED_R = ~(2'b10),
        PED_G = ~(2'b01);
    
    // FSM states
    localparam [1:0]
        S0 = 2'd0,  // Car go
        S1 = 2'd1,  // Yellow
        S2 = 2'd2,  // Pedestrian go
        S3 = 2'd3;  // Dummy state for resetting sec_cnt
        
    reg [1:0] Currentstate = S0;
    reg [1:0] Nextstate;
    
    // Counters
    integer sec_cnt = 0;
    integer ext_cnt = 0;
    
    // sec_cnt done flags for state transition
    wire done_yellow = (Currentstate == S1) && (sec_cnt >= T_YELLOW - 1);
    wire done_walk   = (Currentstate == S2) && (sec_cnt >= T_WALK - 1);
    
    // State Transition, sec_cnt reset, ext_cnt increment/reset logic
    always @(posedge clk) begin
        Currentstate <= Nextstate;
        if (Nextstate != Currentstate)
            sec_cnt <= 0;     
        else
            sec_cnt <= sec_cnt + 1;
        
        if (Currentstate == S1 && done_yellow)
            ext_cnt <= 0;
        else if (Currentstate == S2 && btn && (ext_cnt < EXT_LMT))
            ext_cnt <= ext_cnt + 1;
    end
    
    // Moore Machine, Output
    always @(*) begin
        case (Currentstate)
            S0: begin
                car = CAR_G;
                ped = PED_R;
            end
            
            S1: begin
                car = CAR_Y;
                ped = PED_R;
            end
            
            S2: begin
                car = CAR_R;
                ped = PED_G;
            end
            
            S3: begin
                car = CAR_R;
                ped = PED_G;
            end

            default: begin
                car = CAR_G;
                ped = PED_R;
            end
        endcase
    end

    // Moore Machine, Next State
    always @(*) begin
        case (Currentstate)
            S0: begin
                if (btn)
                    Nextstate = S1;
                else
                    Nextstate = S0;
            end
            
            S1: begin
                if (done_yellow)
                    Nextstate = S2;
                else
                    Nextstate = S1;
            end
            
            S2: begin
                if (done_walk)
                    Nextstate = S0;
                else if (btn && (ext_cnt < EXT_LMT))
                    Nextstate = S3;
                else
                    Nextstate = S2;
            end
            
            S3: begin
                Nextstate = S2;
            end
            
            default: begin
                Nextstate = S0;
            end
        endcase
    end
endmodule
