`timescale 1ns / 1ps
`define sel_song1 4'b0000
`define sel_song2 4'b0001
`define play1 4'b0010   
`define play2 4'b0011   
`define ending 4'b0100  
`define play1_ps 4'b0101
`define play1_pm 4'b0110
`define play2_ps 4'b0111
`define play2_pm 4'b1000
module spectrum(
    input clk,
    input rst,
    input start_sign,
    input [3:0]mode,
    output reg [2:0] note,
    output reg [1359:0] num
);

always@ (posedge clk or posedge rst)
if (rst)
begin
    note <= 0;
    num <= 0;
end
else if (start_sign)
begin
    case (num)
    0 : begin note <= 3; num <= num + 1; end
    1 : begin note <= 3; num <= num + 1; end 
    2 : begin note <= 3; num <= num + 1; end 
    3 : begin note <= 3; num <= num + 1; end 
    4 : begin note <= 3; num <= num + 1; end 
    5 : begin note <= 3; num <= num + 1; end 
    6 : begin note <= 3; num <= num + 1; end 
    7 : begin note <= 3; num <= num + 1; end 
    8 : begin note <= 3; num <= num + 1; end 
    9 : begin note <= 3; num <= num + 1; end 
    10 : begin note <= 3; num <= num + 1; end
    default : begin note <= 4; num <= num + 1; end
    endcase 
end
else if (~(mode == `play1 | mode == `play2))begin note <= 4; num <= 0; end
else begin note <= note; num <= num; end

endmodule