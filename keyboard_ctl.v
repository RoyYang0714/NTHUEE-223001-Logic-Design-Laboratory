`timescale 1ns / 1ps
module keyboard_ctl(
    input clk, 
    input rst, 
    inout PS2_DATA, 
    inout PS2_CLK, 
    output reg left, 
    output reg right, 
    output reg up, 
    output reg down,
    output reg out_d, 
    output reg out_f,
    output reg out_j,
    output reg out_k,
    output reg out_enter,
    output reg out_esc
    );

wire [511:0] key_down;
wire [8:0] last_change;
wire key_valid;

KeyboardDecoder U4 (.key_down(key_down), .last_change(last_change), .key_valid(key_valid), .PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .clk(clk), .rst(rst));

always@*
if (rst)
begin
    left = 0;
    right = 0; 
    up = 0;
    down = 0;
    out_d = 0; 
    out_f = 0;
    out_j = 0;
    out_k = 0;
    out_enter = 0;
    out_esc = 0;    
end
else
begin
    if (key_down[9'h6B] & key_valid) left = 1;
    else left = 0;
    if (key_down[9'h174] & key_valid) right = 1;
    else right = 0;
    if (key_down[9'h175] & key_valid) up = 1;
    else up = 0;
    if (key_down[9'h172] & key_valid) down = 1;
    else down = 1;
    if (key_down[9'h23]) out_d = 1;
    else out_d = 0;
    if (key_down[9'h2B]) out_f = 1;
    else out_f = 0;
    if (key_down[9'h3B]) out_j = 1;
    else out_j = 0;
    if (key_down[9'h42]) out_k = 1;
    else out_k = 0;
    if (key_down[9'h5A] & key_valid) out_enter = 1;
    else out_enter = 0;
    if (key_down[9'h76] & key_valid) out_esc = 1;
    else out_esc = 0;
end

endmodule