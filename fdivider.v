`timescale 1ns / 1ps
module fdivider (clk, rst, clk_640hz, clk_320hz, clk_1hz, scan , clk_2hz);
input clk;
input rst;
output [1:0] scan;
output reg clk_1hz;
output reg clk_2hz;
output reg clk_320hz;
output reg clk_640hz;
    
reg [26:0]temp;
reg [26:0]temp2;
reg [26:0] tmp3;
reg [26:0] tmp4;

assign scan = tmp3 [18:17];
    
always@ (posedge clk or posedge rst)
if (rst) 
begin
    temp <= 27'd0;
    temp2 <= 27'd0;
    tmp3 <= 27'd0;
    tmp4 <= 27'd0;
end
else
begin
    if (temp == 27'd78125) 
    begin
        clk_640hz <= clk_640hz+1;
        temp <= 27'd0;
    end
    else temp = temp + 1;
    
    if (temp2 == 27'd312500) 
    begin
        clk_320hz <= clk_320hz+1;
        temp2 <= 27'd0;
    end
    else temp2 = temp2 + 1;  
    
    if (tmp3 == 27'd50000000) 
    begin
        clk_1hz <= clk_1hz+1;
        tmp3 <= 27'd0;
    end
    else tmp3 = tmp3 + 1;      

    if (tmp4 == 27'd25000000) 
    begin
        clk_2hz <= clk_2hz+1;
        tmp4 <= 27'd0;
    end
    else tmp4 = tmp4 + 1; 
end

endmodule