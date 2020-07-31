`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 16:34:46
// Design Name: 
// Module Name: clk_1s
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


module clkdiv_1s(
   input clk_100MHz,
   output clk_1s
   );
   parameter [30:0] clk_mode=31'd100000000;
   reg Clk=0;
   reg flag=0;
   reg Is_Odd=0;
   integer Count=0;
   
   always @(negedge clk_100MHz)
        begin
            Is_Odd=clk_mode[0];
            if(Count==clk_mode/2)
                flag=1;
            else
                flag=0;
        end
        
   always @(posedge clk_100MHz)
      begin
        if(Is_Odd)
            if(Count==clk_mode-1)
                begin
                    Count=0;
                    Clk=~Clk;
                end
            else if(Count==clk_mode/2)
                begin
                    Count=Count+1;
                    Clk=~Clk;
                end
            else
                Count=Count+1;
       else
            if(Count==clk_mode/2-1)
                begin
                     Count=0;
                     Clk=~Clk;
                end
            else
                Count=Count+1;
      end
   
   assign clk_1s=Clk|(flag&Is_Odd);
endmodule
