`timescale 1ns / 1ps
`define SS_0 8'b00000011
`define SS_1 8'b10011111 
`define SS_2 8'b00100101 
`define SS_3 8'b00001101 
`define SS_4 8'b10011001 
`define SS_5 8'b01001001 
`define SS_6 8'b01000001 
`define SS_7 8'b00011111 
`define SS_8 8'b00000001 
`define SS_9 8'b00001001
module SSDdisplay(out1, out2, out3, out4, segs, ssd_ctl, scan);
input [3:0] out1;
input [3:0] out2;
input [3:0] out3;
input [3:0] out4;
input [1:0] scan;
reg [3:0] out;
output reg [7:0] segs;
output reg [3:0] ssd_ctl;

always@*
begin
    case (scan)
    2'b00 : 
    begin
        out = out1;
        ssd_ctl = 4'b1110;
    end
    2'b01 : 
    begin
        out = out2;
        ssd_ctl = 4'b1101;
    end
    2'b10 : 
    begin
        out = out3;
        ssd_ctl = 4'b1011;
    end
    2'b11 : 
    begin
        out = out4;
        ssd_ctl = 4'b0111;
    end
    default : 
    begin
        out = 4'b0;
        ssd_ctl = 4'b1111;
    end
    endcase
end

//display ssd
always @*  case (out)    
  4'd0: segs = `SS_0;    
  4'd1: segs = `SS_1;    
  4'd2: segs = `SS_2;    
  4'd3: segs = `SS_3;    
  4'd4: segs = `SS_4;    
  4'd5: segs = `SS_5;    
  4'd6: segs = `SS_6;    
  4'd7: segs = `SS_7;    
  4'd8: segs = `SS_8;    
  4'd9: segs = `SS_9;
  4'd10 : segs = 8'b11111101;  
default: segs = 8'b00000011;  
endcase

endmodule
