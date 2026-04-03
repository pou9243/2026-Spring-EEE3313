`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/22 14:25:23
// Design Name: 
// Module Name: MUX_to_DEMUX
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


module MUX_to_DEMUX(
input[1:0] D,
input S,
output[1:0] O
    );
    
    wire Q;
    
    MUX_2bit mux0(.D(D), .S(S), .Q(Q));
    DEMUX_2bit demux0(.I(Q), .S(S), .O(O));
endmodule
