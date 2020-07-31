`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 17:10:42
// Design Name: 
// Module Name: lift_main
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


module lift_main(
    input clk_1s,
    input clk_200ms,
    input [15:0] sw,
    output reg [3:0] lift_num=4'b0011,
    output reg lift_open=1
    );
    parameter N=99_999999;
    reg [15:0] btn,btn_buff;
    reg [1:0] lift_state=0;//0：静止 1：上升 2：下降
    //

    always@(posedge clk_200ms)//防抖
       btn<=sw;
    //
    always@(posedge clk_1s)
    begin
       btn_buff=btn;
       case(lift_state)
       0:      if((btn_buff&(1<<lift_num))>0)//当前层有按键
                 begin lift_open=1;      btn_buff=btn_buff&(~(1<<lift_num));
                 end 
              
               else
                 begin lift_num=lift_num;     lift_open=0;
                 end
       1:      if((btn_buff&(1<<lift_num))>0)//当前层有按键
                 begin lift_open=1;      btn_buff=btn_buff&(~(1<<lift_num)); 
                 end 
              
               else
                 begin lift_num=lift_num+1;   lift_open=0;
                 end
       2:      if((btn_buff&(1<<lift_num))>0)//当前层有按键
                 begin lift_open=1;      btn_buff=btn_buff&(~(1<<lift_num));  
                 end
               
               else
                 begin lift_num=lift_num-1;   lift_open=0;
                 end
        endcase    
    end


always@(lift_open)
   begin
       lift_state=0;
       #(5*N);
       //
       if((btn_buff&(1<<lift_num))>0)//当前层有呼叫
          begin
              lift_state<=0;
          end
      
       else if((btn_buff>>(lift_num+1))>0)//上层有呼叫
          begin
              lift_state<=1;
          end
       
       else if((btn_buff<<(16-lift_num))>0)//下层有呼叫
          begin
              lift_state<=2;
          end
   end
endmodule
