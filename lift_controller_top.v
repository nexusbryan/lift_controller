`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 15:48:09
// Design Name: 
// Module Name: lift_controller_top
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


module lift_controller_top(
    input wire clk_100MHz,
    input wire [15:0] sw,
    output wire [6:0] a_to_g,
    output wire [3:0] an,
    output wire dp,
    output wire [15:0] led
    );
    wire clk_1s,clk_200ms,clk_s,s,clk;
    wire lift_num,x;
    wire [3:0] l_n;
    wire lift_open;

   //电梯主模块
    lift_main u1(
      .clk_1s(clk_1s),
      .clk_200ms(clk_200ms),
      .sw(sw),
      .lift_num(l_n),
      .lift_open(lift_open)
      );
    //时钟分频模块
    clkdiv_top u2(
      .clk_100MHz(clk_100MHz),
      .clk_200ms(clk_200ms),
      .clk_1s(clk_1s),
      .clk_s(clk_s)
      );
    //气段显示器模块
    x7seg_lift u3(
      .x(l_n),
      .s(clk_s),
      .a_to_g(a_to_g),
      .an(an),
      .dp(dp)
      );
    //led显示开门模块
    lift_open_led u4(
      .lift_open(lift_open),
      .lift_num(l_n),
      .led(led)
      );
    
endmodule
