`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 16:45:59
// Design Name: 
// Module Name: clkdiv_top
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


module clkdiv_top(
     input clk_100MHz,
     output clk_200ms,
     output clk_1s,
     output clk_s

    );
    clkdiv_200ms u1(.clk_100MHz(clk_100MHz),.clk_200ms(clk_200ms));
    clkdiv_1s    u2(.clk_100MHz(clk_100MHz),.clk_1s(clk_1s));
    clkdiv_s     u3(.clk_100MHz(clk_100MHz),.clk_s(clk_s));
endmodule
