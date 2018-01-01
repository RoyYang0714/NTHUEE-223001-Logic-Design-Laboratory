module top(
  input clk,
  input rst,
  output [7:0] segs,
  output [3:0] ssd_ctl,
  output [3:0] JA,
  output [3:0] vgaRed,
  output [3:0] vgaGreen,
  output [3:0] vgaBlue,
  output hsync,
  output vsync,
  input switch,
  output reg [15:0] led,
  inout PS2_DATA,
  inout PS2_CLK
);

wire [11:0] data;
wire clk_25MHz;
wire clk_22;
wire [16:0] pixel_addr;
wire [11:0] pixel;
wire valid;
wire [9:0] h_cnt;  //640
wire [9:0] v_cnt;  //480
wire left;
wire right; 
wire up;
wire down;
wire d; 
wire f;
wire j;
wire k;
wire out_d; 
wire out_f;
wire out_j;
wire out_k;
wire out_enter;
wire out_esc;
wire [3:0] mode;
wire key_valid;
wire clk_640hz;
wire clk_320hz;
wire ending_sign;
wire clk_1hz;
wire clk_2hz;
wire [1:0] scan;
wire [3:0]out3_ssd;
wire [3:0]out2_ssd;
wire [3:0]out1_ssd;
wire [3:0]out0_ssd;

assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;
assign JA = mode;

keyboard_ctl U0 (.clk(clk), .rst(rst), .PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), 
                .left(left), .right(right), .up(up), .down(down),
                .out_d(d), .out_f(f), .out_j(j), .out_k(k),
                .out_esc(out_esc), .out_enter(out_enter));
                
fdivider U1 (.clk(clk), .clk_640hz(clk_640hz), .clk_320hz(clk_320hz), .rst(rst) , .clk_1hz(clk_1hz), 
             .scan(scan), .clk_2hz(clk_2hz));

FSM U2 (.rst(rst), .clk(clk), .left(left), .right(right), .out_esc(out_esc), .out_enter(out_enter), 
        .mode(mode), .ending_sign(ending_sign));

onepulse j_output (.clk(clk_320hz), .rst_n(rst), .in_trig(j), .out_pulse(out_j));
onepulse d_output (.clk(clk_320hz), .rst_n(rst), .in_trig(d), .out_pulse(out_d));
onepulse f_output (.clk(clk_320hz), .rst_n(rst), .in_trig(f), .out_pulse(out_f));
onepulse k_output (.clk(clk_320hz), .rst_n(rst), .in_trig(k), .out_pulse(out_k));

timer clock (.clk(clk_1hz), .rst(rst), .mode(mode), .out3_ssd(out3_ssd),
             .out2_ssd(out2_ssd), .out1_ssd(out1_ssd), .out0_ssd(out0_ssd));

SSDdisplay ssd (.out4(out0_ssd), .out3(out1_ssd), .out2(out2_ssd), .out1(out3_ssd), 
                .segs(segs), .ssd_ctl(ssd_ctl), .scan(scan));

// Frequency Divider
clock_divisor clk_wiz_0_inst(
  .clk(clk),
  .clk1(clk_25MHz),
  .clk22(clk_22)
);

// Reduce frame address from 640x480 to 320x240

mem_addr_gen mem_addr_gen_inst(
  .clk_640hz(clk_640hz),
  .clk_320hz(clk_320hz),
  .rst(rst),
  .h_cnt(h_cnt),
  .v_cnt(v_cnt),
  .pixel_addr(pixel_addr),
  .out_d(out_d),
  .out_f(out_f),
  .out_j(out_j),
  .out_k(out_k),
  .out_esc(out_esc),
  .out_enter(out_enter),
  .mode(mode),
  .ending_sign(ending_sign)
);
     
// Use reduced 320x240 address to output the saved picture from RAM 
blk_mem_gen_0 blk_mem_gen_0_inst(
  .clka(clk_25MHz),
  .wea(0),
  .addra(pixel_addr),
  .dina(data[11:0]),
  .douta(pixel)
); 

// Render the picture by VGA controller
vga_controller   vga_inst(
  .pclk(clk_25MHz),
  .reset(rst),
  .hsync(hsync),
  .vsync(vsync),
  .valid(valid),
  .h_cnt(h_cnt),
  .v_cnt(v_cnt)
);

wire [15:0] led_next = {led[14:0], led[15]};

always@ (posedge clk_2hz or posedge rst)
if (rst) led <= 16'b0101010101010101;
else if (switch) led <= led_next;
      
endmodule