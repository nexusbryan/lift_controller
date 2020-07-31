`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 16:24:34
// Design Name: 
// Module Name: lift_open_led
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


module lift_open_led(
    input lift_open,
    input [3:0] lift_num,
    output reg [15:0] led
    );
    always@*
       begin
          if(lift_open)
            case(lift_num)
             0:    led<=16'b0000000000000001;
             1:    led<=16'b0000000000000010;
             2:    led<=16'b0000000000000100;
             3:    led<=16'b0000000000001000;
             4:    led<=16'b0000000000010000;
             5:    led<=16'b0000000000100000;
             6:    led<=16'b0000000001000000;
             7:    led<=16'b0000000010000000;
             8:    led<=16'b0000000100000000;
             9:    led<=16'b0000001000000000;
             10:   led<=16'b0000010000000000;
             11:   led<=16'b0000100000000000;
             12:   led<=16'b0001000000000000;
             13:   led<=16'b0010000000000000;
             14:   led<=16'b0100000000000000;
             15:   led<=16'b1000000000000000;
          default: led<=16'b0000000000000000;
          endcase
         else
           led<=16'b0000000000000000;
       end
endmodule
