`timescale 1ns / 1ps
module onepulse(clk, rst_n, in_trig, out_pulse); 
input clk, rst_n, in_trig; 
output reg out_pulse;

// Declare internal nodes 
reg in_trig_delay;

always @(posedge clk or posedge rst_n)  
if (rst_n)    in_trig_delay <= 1'b0;  
else    in_trig_delay <= in_trig;

// Pulse generation 
assign out_pulse_next = in_trig & (~in_trig_delay); 

always @(posedge clk or posedge rst_n)  
if (rst_n)    out_pulse <=1'b0;  
else    out_pulse <= out_pulse_next; 

endmodule