`define sel_song1 4'b0000
`define sel_song2 4'b0001
`define play1 4'b0010
`define play2 4'b0011
`define ending 4'b0100
`define play1_ps 4'b0101
`define play1_pm 4'b0110
`define play2_ps 4'b0111
`define play2_pm 4'b1000
`timescale 1ns / 1ps
module timer(
    input [3:0] mode,
    input clk,
    input rst,
    output reg [3:0]out3_ssd,
    output reg [3:0]out2_ssd,
    output reg [3:0]out1_ssd,
    output reg [3:0]out0_ssd
    );

reg [3:0] out3_ssd_next; 
reg [3:0] out2_ssd_next;
reg [3:0] out1_ssd_next;
reg [3:0] out0_ssd_next;

always@*
begin
    if (rst)
    begin
        out3_ssd_next = 0;
        out2_ssd_next = 0;
        out1_ssd_next = 0;
        out0_ssd_next = 0;
    end
    else if (mode == `sel_song1 | mode == `sel_song2)
    begin
        out3_ssd_next = 0;
        out2_ssd_next = 0;
        out1_ssd_next = 0;
        out0_ssd_next = 0;
    end
    else if (out3_ssd == 9 & out2_ssd == 5 & out1_ssd == 9) 
    begin
        out3_ssd_next = 0;
        out2_ssd_next = 0;
        out1_ssd_next = 0;
        out0_ssd_next = out0_ssd + 1;
    end
    else if(out3_ssd == 9 & out2_ssd == 5)
    begin
        out3_ssd_next = 0;
        out2_ssd_next = 0;
        out1_ssd_next = out1_ssd + 1;
    end
    else if (out3_ssd == 9)
    begin
        out3_ssd_next = 0;
        out2_ssd_next = out2_ssd + 1;
    end
    else out3_ssd_next = out3_ssd + 1;
end

always@ (posedge clk or posedge rst)
if (rst)
begin
    out3_ssd <= 0;   
    out2_ssd <= 0;
    out1_ssd <= 0;
    out0_ssd <= 0;  
end
else if (mode == `sel_song1 | mode == `sel_song2)
begin
    out3_ssd <= 0;   
    out2_ssd <= 0;
    out1_ssd <= 0;
    out0_ssd <= 0;    
end
else if (mode == `ending | mode == `play1_ps | mode == `play1_pm | mode == `play2_ps | mode == `play2_pm)
begin
    out3_ssd <= out3_ssd;   
    out2_ssd <= out2_ssd;
    out1_ssd <= out1_ssd;
    out0_ssd <= out0_ssd;
end
else if (mode == `play1 | mode == `play2)
begin
    out0_ssd <= out0_ssd_next;
    out1_ssd <= out1_ssd_next;
    out2_ssd <= out2_ssd_next;
    out3_ssd <= out3_ssd_next;    
end
endmodule