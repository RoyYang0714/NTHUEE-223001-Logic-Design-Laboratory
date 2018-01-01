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
 
module FSM(
    input rst,
    input clk,
    input right,
    input left,
    input out_esc,
    input out_enter,
    input ending_sign,
    output reg [3:0] mode
    );

reg [3:0] mode_next;
reg [2:0] JA_next;

always@*
begin
case (mode)
`sel_song1:
    if (right)                                          //move to menu : select song2
    begin
        mode_next = `sel_song2;                  
    end
    else if (out_enter)                                 //move to play : song1
    begin
        mode_next = `play1;       
    end
    else                                                //menu : select song1
    begin
        mode_next = `sel_song1;                        
    end
`sel_song2:
    if (left)                                           //move to menu : select song1
    begin
        mode_next = `sel_song1;                   
    end
    else if (out_enter)                                 //move to play : song2
    begin
        mode_next = `play2;             
    end
    else                                                //menu : select song2
    begin
        mode_next = `sel_song2;                        
    end
`play1:
    if (out_esc)                                        //puase : resume @ play : song1
    begin
        mode_next = `play1_ps;                 
    end
    else if (ending_sign)                               //move to ending : song1 
    begin
        mode_next = `ending;     
    end
    else                                                //play : song1 
    begin
        mode_next = `play1;                            
    end
`play2:
    if (out_esc)                                        //pause : resume @play : song2 
    begin
        mode_next = `play2_ps;                 
    end
    else if (ending_sign)                               //move to ending : song2 
    begin
        mode_next = `ending;     
    end
    else                                                //play : song2 
    begin
        mode_next = `play2;                            
    end
`ending:
    if (out_enter)                                      //move to menu : select song1 
    begin
        mode_next = `sel_song1;              
    end
    else                                                //ending
    begin
        mode_next = `ending;                           
    end
`play1_ps:  
    if (right)                                          //move to pause : menu @ play : song1    
    begin
        mode_next = `play1_pm;                      
    end
    else if (out_enter)                                 //move to play : song1 
    begin
        mode_next = `play1;             
    end
    else                                                //move to pause : resume @ play : song1
    begin
        mode_next = `play1_ps;                         
    end
`play1_pm:
    if (left)                                           //move to pause : resume @ play : song1 
    begin
        mode_next = `play1_ps;                    
    end
    else if (out_enter)                                 //move to play : song1 
    begin
        mode_next = `sel_song1;                        
    end
    else                                                //move to pause : menu @ play : song1 
    begin
        mode_next = `play1_pm;                          
    end
`play2_ps:
    if (right)                                          //move to pause : menu @ play : song2 
    begin
        mode_next = `play2_pm;                     
    end
    else if (out_enter)                                 //move to play : song2 
    begin
        mode_next = `play2;             
    end
    else                                                //move to pause : resume @ play : song2 
    begin
        mode_next = `play2_ps;                         
    end
`play2_pm:
    if (left)                                           //move to pause : resume @ play : song2 
    begin
        mode_next = `play2_ps;                    
    end
    else if (out_enter)                                 //move to play : song2 
    begin
        mode_next = `sel_song2;                    
    end
    else                                                //move to pause : menu @ play : song2  
    begin
        mode_next = `play2_pm;                         
    end
default : 
begin
    mode_next = `sel_song1;
end
endcase
end
    
always@ (posedge clk or posedge rst)
if (rst) 
begin
    mode <= `sel_song1;
end
else 
begin
    mode <= mode_next;    
end
endmodule
