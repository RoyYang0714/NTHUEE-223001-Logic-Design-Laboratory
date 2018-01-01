`define sel_song1 4'b0000
`define sel_song2 4'b0001
`define play1 4'b0010
`define play2 4'b0011
`define ending 4'b0100
`define play1_ps 4'b0101
`define play1_pm 4'b0110
`define play2_ps 4'b0111
`define play2_pm 4'b1000
`define S 3'b000
`define A 3'b001
`define B 3'b010
`define C 3'b011
`define D 3'b100
 module mem_addr_gen(
  input clk_640hz,
  input clk_320hz,
  input rst,
  input [9:0] h_cnt,
  input [9:0] v_cnt,
  input out_d,
  input out_f,
  input out_j,
  input out_k,
  input out_enter,
  input out_esc,
  input [3:0] mode,
  output reg ending_sign,
  output reg [16:0] pixel_addr
);

reg [9:0] position1;
reg [9:0] position2;
reg [9:0] position3;
reg [9:0] position4;
reg [9:0] position5;
reg [9:0] position6;
reg [9:0] position7;
reg [9:0] position8;
reg [9:0] position9;
reg sign;
reg [20:0] score;
reg [9:0] combo;
reg [9:0] good;
reg [9:0] bad;
reg [2:0] grade;
reg [6:0] rate;
reg [9:0] note_num;
reg [9:0] combo_bt;

//spectrum
reg start_sign;
reg [9:0] num;
reg [2:0] note;
reg [2:0] out1;
reg [2:0] out2;
reg [2:0] out3;
reg [2:0] out4;
reg [2:0] out5;
reg [2:0] out6;
reg [2:0] out7;
reg [2:0] out8;
reg [2:0] out9;
reg [1:0] beat_jd;

always@ (posedge clk_320hz or posedge rst)
if (rst)
begin
    note <= 0;
    num <= 10;
end
else if (start_sign)
begin
    if (mode == `play1)
    case (num)
    //3
    10 : begin note <= 4; num <= 12; end
    11 : begin note <= 4; num <= num + 1; end 
    12 : begin note <= 4; num <= num + 1; end 
    13 : begin note <= 4; num <= num + 1; end 
    14 : begin note <= 4; num <= num + 1; end 
    15 : begin note <= 4; num <= num + 1; end 
    16 : begin note <= 4; num <= 745; end    
    
    745 : begin note <= 4; num <= num + 1; end
    746 : begin note <= 4; num <= 17; end
    
    //4
    17 : begin note <= 4; num <= num + 1; end 
    18 : begin note <= 4; num <= num + 1; end 
    19 : begin note <= 4; num <= num + 1; end 
    20 : begin note <= 4; num <= num + 1; end
    21 : begin note <= 4; num <= num + 1; end 
    22 : begin note <= 4; num <= num + 1; end 
    23 : begin note <= 4; num <= num + 1; end 
    24 : begin note <= 4; num <= num + 1; end

    //5
    25 : begin note <= 4; num <= num + 1; end 
    26 : begin note <= 4; num <= num + 1; end 
    27 : begin note <= 4; num <= num + 1; end 
    28 : begin note <= 4; num <= num + 1; end
    29 : begin note <= 4; num <= num + 1; end 
    30 : begin note <= 4; num <= num + 1; end 
    31 : begin note <= 4; num <= num + 1; end 
    32 : begin note <= 4; num <= num + 1; end    
    
    //6
    33 : begin note <= 4; num <= num + 1; end 
    34 : begin note <= 4; num <= num + 1; end 
    35 : begin note <= 4; num <= num + 1; end 
    36 : begin note <= 4; num <= num + 1; end 
    37 : begin note <= 4; num <= num + 1; end 
    38 : begin note <= 4; num <= num + 1; end
    39 : begin note <= 4; num <= num + 1; end 
    40 : begin note <= 4; num <= num + 1; end 

    //7
    41 : begin note <= 4; num <= num + 1; end 
    42 : begin note <= 4; num <= num + 1; end 
    43 : begin note <= 4; num <= num + 1; end 
    44 : begin note <= 4; num <= num + 1; end 
    45 : begin note <= 4; num <= num + 1; end 
    46 : begin note <= 4; num <= num + 1; end
    47 : begin note <= 4; num <= num + 1; end 
    48 : begin note <= 4; num <= num + 1; end  

    //8
    49 : begin note <= 4; num <= num + 1; end 
    50 : begin note <= 4; num <= num + 1; end 
    51 : begin note <= 4; num <= num + 1; end 
    52 : begin note <= 4; num <= num + 1; end 
    53 : begin note <= 4; num <= num + 1; end 
    54 : begin note <= 4; num <= num + 1; end
    55 : begin note <= 4; num <= num + 1; end 
    56 : begin note <= 4; num <= num + 1; end     
    
    //9
    57 : begin note <= 3; num <= num + 1; end 
    58 : begin note <= 4; num <= num + 1; end 
    59 : begin note <= 3; num <= num + 1; end 
    60 : begin note <= 4; num <= num + 1; end 
    61 : begin note <= 3; num <= num + 1; end 
    62 : begin note <= 4; num <= num + 1; end
    63 : begin note <= 2; num <= num + 1; end 
    64 : begin note <= 4; num <= num + 1; end

    //10
    65 : begin note <= 3; num <= num + 1; end 
    66 : begin note <= 4; num <= num + 1; end 
    67 : begin note <= 3; num <= num + 1; end 
    68 : begin note <= 4; num <= num + 1; end 
    69 : begin note <= 3; num <= num + 1; end 
    70 : begin note <= 4; num <= num + 1; end
    71 : begin note <= 2; num <= num + 1; end 
    72 : begin note <= 4; num <= num + 1; end
    
    //11
    73 : begin note <= 3; num <= num + 1; end 
    74 : begin note <= 4; num <= num + 1; end 
    75 : begin note <= 3; num <= num + 1; end 
    76 : begin note <= 4; num <= num + 1; end 
    77 : begin note <= 3; num <= num + 1; end 
    78 : begin note <= 4; num <= num + 1; end
    79 : begin note <= 2; num <= num + 1; end 
    80 : begin note <= 4; num <= num + 1; end

    //12
    81 : begin note <= 3; num <= num + 1; end 
    82 : begin note <= 4; num <= num + 1; end 
    83 : begin note <= 3; num <= num + 1; end 
    84 : begin note <= 4; num <= num + 1; end 
    85 : begin note <= 3; num <= num + 1; end 
    86 : begin note <= 1; num <= num + 1; end
    87 : begin note <= 3; num <= num + 1; end 
    88 : begin note <= 1; num <= num + 1; end

    //13
    89 : begin note <= 3; num <= num + 1; end 
    90 : begin note <= 4; num <= num + 1; end 
    91 : begin note <= 3; num <= num + 1; end 
    92 : begin note <= 4; num <= num + 1; end 
    93 : begin note <= 3; num <= num + 1; end 
    94 : begin note <= 4; num <= num + 1; end
    95 : begin note <= 2; num <= num + 1; end 
    96 : begin note <= 4; num <= num + 1; end
  
    //14
    97 : begin note <= 3; num <= num + 1; end 
    98 : begin note <= 4; num <= num + 1; end 
    99 : begin note <= 3; num <= num + 1; end 
    100 : begin note <= 4; num <= num + 1; end 
    101 : begin note <= 3; num <= num + 1; end 
    102 : begin note <= 4; num <= num + 1; end
    103 : begin note <= 2; num <= num + 1; end 
    104 : begin note <= 1; num <= num + 1; end
    
    //15
    105 : begin note <= 3; num <= num + 1; end 
    106 : begin note <= 4; num <= num + 1; end 
    107 : begin note <= 3; num <= num + 1; end 
    108 : begin note <= 4; num <= num + 1; end 
    109 : begin note <= 3; num <= num + 1; end 
    110 : begin note <= 4; num <= num + 1; end
    111 : begin note <= 2; num <= num + 1; end 
    112 : begin note <= 4; num <= num + 1; end
    
    //16
    113 : begin note <= 3; num <= num + 1; end 
    114 : begin note <= 4; num <= num + 1; end 
    115 : begin note <= 3; num <= num + 1; end 
    116 : begin note <= 4; num <= num + 1; end 
    117 : begin note <= 3; num <= num + 1; end 
    118 : begin note <= 1; num <= num + 1; end
    119 : begin note <= 3; num <= num + 1; end 
    120 : begin note <= 1; num <= num + 1; end         

    //17
    121 : begin note <= 3; num <= num + 1; end 
    122 : begin note <= 1; num <= num + 1; end 
    123 : begin note <= 3; num <= num + 1; end 
    124 : begin note <= 1; num <= num + 1; end 
    125 : begin note <= 3; num <= num + 1; end 
    126 : begin note <= 1; num <= num + 1; end
    127 : begin note <= 3; num <= num + 1; end 
    128 : begin note <= 1; num <= num + 1; end

    //18
    129 : begin note <= 3; num <= num + 1; end 
    130 : begin note <= 1; num <= num + 1; end 
    131 : begin note <= 3; num <= num + 1; end 
    132 : begin note <= 1; num <= num + 1; end 
    133 : begin note <= 3; num <= num + 1; end 
    134 : begin note <= 1; num <= num + 1; end
    135 : begin note <= 2; num <= num + 1; end 
    136 : begin note <= 2; num <= num + 1; end    

    //19
    137 : begin note <= 3; num <= num + 1; end 
    138 : begin note <= 4; num <= num + 1; end 
    139 : begin note <= 3; num <= num + 1; end 
    140 : begin note <= 1; num <= num + 1; end 
    141 : begin note <= 3; num <= num + 1; end 
    142 : begin note <= 4; num <= num + 1; end
    143 : begin note <= 3; num <= num + 1; end 
    144 : begin note <= 1; num <= num + 1; end
    
    //20
    145 : begin note <= 3; num <= num + 1; end 
    146 : begin note <= 4; num <= num + 1; end 
    147 : begin note <= 3; num <= num + 1; end 
    148 : begin note <= 1; num <= num + 1; end 
    149 : begin note <= 2; num <= num + 1; end 
    150 : begin note <= 4; num <= num + 1; end
    151 : begin note <= 4; num <= num + 1; end 
    152 : begin note <= 4; num <= num + 1; end
    
    //21
    153 : begin note <= 0; num <= num + 1; end 
    154 : begin note <= 4; num <= num + 1; end 
    155 : begin note <= 3; num <= num + 1; end 
    156 : begin note <= 1; num <= num + 1; end 
    157 : begin note <= 3; num <= num + 1; end 
    158 : begin note <= 1; num <= num + 1; end
    159 : begin note <= 3; num <= num + 1; end 
    160 : begin note <= 1; num <= num + 1; end
    
    //22
    161 : begin note <= 3; num <= num + 1; end 
    162 : begin note <= 4; num <= num + 1; end 
    163 : begin note <= 3; num <= num + 1; end 
    164 : begin note <= 1; num <= num + 1; end 
    165 : begin note <= 3; num <= num + 1; end 
    166 : begin note <= 1; num <= num + 1; end
    167 : begin note <= 3; num <= num + 1; end 
    168 : begin note <= 1; num <= num + 1; end    
    
    //23
    169 : begin note <= 0; num <= num + 1; end 
    170 : begin note <= 4; num <= num + 1; end 
    171 : begin note <= 3; num <= num + 1; end 
    172 : begin note <= 1; num <= num + 1; end 
    173 : begin note <= 3; num <= num + 1; end 
    174 : begin note <= 1; num <= num + 1; end
    175 : begin note <= 3; num <= num + 1; end 
    176 : begin note <= 1; num <= num + 1; end
        
    //24                                      
    177 : begin note <= 3; num <= num + 1; end
    178 : begin note <= 4; num <= num + 1; end
    179 : begin note <= 3; num <= num + 1; end
    180 : begin note <= 1; num <= num + 1; end
    181 : begin note <= 3; num <= num + 1; end
    182 : begin note <= 1; num <= num + 1; end
    183 : begin note <= 3; num <= num + 1; end
    184 : begin note <= 1; num <= num + 1; end    

    //25                                     
    185 : begin note <= 0; num <= num + 1; end
    186 : begin note <= 4; num <= num + 1; end
    187 : begin note <= 3; num <= num + 1; end
    188 : begin note <= 1; num <= num + 1; end
    189 : begin note <= 3; num <= num + 1; end
    190 : begin note <= 1; num <= num + 1; end
    191 : begin note <= 3; num <= num + 1; end
    192 : begin note <= 1; num <= num + 1; end

    //26                                     
    193 : begin note <= 3; num <= num + 1; end
    194 : begin note <= 4; num <= num + 1; end
    195 : begin note <= 3; num <= num + 1; end
    196 : begin note <= 1; num <= num + 1; end
    197 : begin note <= 3; num <= num + 1; end
    198 : begin note <= 1; num <= num + 1; end
    199 : begin note <= 3; num <= num + 1; end
    200 : begin note <= 1; num <= num + 1; end

    //27                                     
    201 : begin note <= 0; num <= num + 1; end
    202 : begin note <= 4; num <= num + 1; end
    203 : begin note <= 3; num <= num + 1; end
    204 : begin note <= 1; num <= num + 1; end
    205 : begin note <= 3; num <= num + 1; end
    206 : begin note <= 1; num <= num + 1; end
    207 : begin note <= 3; num <= num + 1; end
    208 : begin note <= 1; num <= num + 1; end

    //28                                    
    209 : begin note <= 3; num <= num + 1; end
    210 : begin note <= 1; num <= num + 1; end
    211 : begin note <= 0; num <= num + 1; end
    212 : begin note <= 2; num <= num + 1; end
    213 : begin note <= 3; num <= num + 1; end
    214 : begin note <= 1; num <= num + 1; end
    215 : begin note <= 0; num <= num + 1; end
    216 : begin note <= 2; num <= num + 1; end

    //29                                    
    217 : begin note <= 2; num <= num + 1; end
    218 : begin note <= 4; num <= num + 1; end
    219 : begin note <= 3; num <= num + 1; end
    220 : begin note <= 4; num <= num + 1; end
    221 : begin note <= 1; num <= num + 1; end
    222 : begin note <= 4; num <= num + 1; end
    223 : begin note <= 3; num <= num + 1; end
    224 : begin note <= 4; num <= num + 1; end

    //30
    225 : begin note <= 1; num <= num + 1; end
    226 : begin note <= 4; num <= num + 1; end
    227 : begin note <= 3; num <= num + 1; end
    228 : begin note <= 4; num <= num + 1; end
    229 : begin note <= 1; num <= num + 1; end
    230 : begin note <= 4; num <= num + 1; end
    231 : begin note <= 3; num <= num + 1; end
    232 : begin note <= 4; num <= num + 1; end

    //31
    233 : begin note <= 1; num <= num + 1; end
    234 : begin note <= 4; num <= num + 1; end
    235 : begin note <= 3; num <= num + 1; end
    236 : begin note <= 4; num <= num + 1; end
    237 : begin note <= 1; num <= num + 1; end
    238 : begin note <= 4; num <= num + 1; end
    239 : begin note <= 3; num <= num + 1; end
    240 : begin note <= 4; num <= num + 1; end
    
    //32
    241 : begin note <= 1; num <= num + 1; end
    242 : begin note <= 4; num <= num + 1; end
    243 : begin note <= 3; num <= num + 1; end
    244 : begin note <= 4; num <= num + 1; end
    245 : begin note <= 1; num <= num + 1; end
    246 : begin note <= 4; num <= num + 1; end
    247 : begin note <= 3; num <= num + 1; end
    248 : begin note <= 4; num <= num + 1; end
    
    //33
    249 : begin note <= 0; num <= num + 1; end
    250 : begin note <= 4; num <= num + 1; end
    251 : begin note <= 3; num <= num + 1; end
    252 : begin note <= 4; num <= num + 1; end
    253 : begin note <= 1; num <= num + 1; end
    254 : begin note <= 4; num <= num + 1; end
    255 : begin note <= 3; num <= num + 1; end
    256 : begin note <= 4; num <= num + 1; end    
    
    //34
    257 : begin note <= 1; num <= num + 1; end
    258 : begin note <= 4; num <= num + 1; end
    259 : begin note <= 3; num <= num + 1; end
    260 : begin note <= 4; num <= num + 1; end
    261 : begin note <= 1; num <= num + 1; end
    262 : begin note <= 4; num <= num + 1; end
    263 : begin note <= 3; num <= num + 1; end
    264 : begin note <= 4; num <= num + 1; end     
    
    //35
    265 : begin note <= 1; num <= num + 1; end
    266 : begin note <= 4; num <= num + 1; end
    267 : begin note <= 3; num <= num + 1; end
    268 : begin note <= 4; num <= num + 1; end
    269 : begin note <= 3; num <= num + 1; end
    270 : begin note <= 1; num <= num + 1; end
    271 : begin note <= 3; num <= num + 1; end
    272 : begin note <= 1; num <= num + 1; end
    
    //36
    273 : begin note <= 0; num <= num + 1; end
    274 : begin note <= 4; num <= num + 1; end
    275 : begin note <= 4; num <= num + 1; end
    276 : begin note <= 4; num <= num + 1; end
    277 : begin note <= 4; num <= num + 1; end
    278 : begin note <= 4; num <= num + 1; end
    279 : begin note <= 4; num <= 281; end
    280 : begin note <= 4; num <= num + 1; end       
    
    //37
    281 : begin note <= 3; num <= num + 1; end
    282 : begin note <= 4; num <= num + 1; end
    283 : begin note <= 3; num <= num + 1; end
    284 : begin note <= 4; num <= num + 1; end
    285 : begin note <= 3; num <= num + 1; end
    286 : begin note <= 4; num <= num + 1; end
    287 : begin note <= 3; num <= num + 1; end
    288 : begin note <= 4; num <= num + 1; end

    //38
    289 : begin note <= 3; num <= num + 1; end
    290 : begin note <= 4; num <= num + 1; end
    291 : begin note <= 3; num <= num + 1; end
    292 : begin note <= 4; num <= num + 1; end
    293 : begin note <= 3; num <= num + 1; end
    294 : begin note <= 4; num <= num + 1; end
    295 : begin note <= 3; num <= num + 1; end
    296 : begin note <= 4; num <= num + 1; end

    //39
    297 : begin note <= 3; num <= num + 1; end
    298 : begin note <= 4; num <= num + 1; end
    299 : begin note <= 3; num <= num + 1; end
    300 : begin note <= 4; num <= num + 1; end
    301 : begin note <= 3; num <= num + 1; end
    302 : begin note <= 4; num <= num + 1; end
    303 : begin note <= 3; num <= num + 1; end
    304 : begin note <= 4; num <= num + 1; end

    //40
    305 : begin note <= 3; num <= num + 1; end
    306 : begin note <= 4; num <= num + 1; end
    307 : begin note <= 3; num <= num + 1; end
    308 : begin note <= 4; num <= num + 1; end
    309 : begin note <= 3; num <= num + 1; end
    310 : begin note <= 4; num <= num + 1; end
    311 : begin note <= 3; num <= num + 1; end
    312 : begin note <= 4; num <= num + 1; end
    
    //41
    313 : begin note <= 3; num <= num + 1; end
    314 : begin note <= 1; num <= num + 1; end
    315 : begin note <= 3; num <= num + 1; end
    316 : begin note <= 1; num <= num + 1; end
    317 : begin note <= 3; num <= num + 1; end
    318 : begin note <= 1; num <= num + 1; end
    319 : begin note <= 3; num <= num + 1; end
    320 : begin note <= 1; num <= num + 1; end

    //42
    321 : begin note <= 3; num <= num + 1; end
    322 : begin note <= 1; num <= num + 1; end
    323 : begin note <= 3; num <= num + 1; end
    324 : begin note <= 1; num <= num + 1; end
    325 : begin note <= 3; num <= num + 1; end
    326 : begin note <= 1; num <= num + 1; end
    327 : begin note <= 3; num <= num + 1; end
    328 : begin note <= 1; num <= num + 1; end

    //43
    329 : begin note <= 3; num <= num + 1; end
    330 : begin note <= 1; num <= num + 1; end
    331 : begin note <= 3; num <= num + 1; end
    332 : begin note <= 1; num <= num + 1; end
    333 : begin note <= 3; num <= num + 1; end
    334 : begin note <= 1; num <= num + 1; end
    335 : begin note <= 3; num <= num + 1; end
    336 : begin note <= 1; num <= num + 1; end
    
    //44
    337 : begin note <= 3; num <= num + 1; end
    338 : begin note <= 1; num <= num + 1; end
    339 : begin note <= 3; num <= num + 1; end
    340 : begin note <= 1; num <= num + 1; end
    341 : begin note <= 3; num <= num + 1; end
    342 : begin note <= 1; num <= num + 1; end
    343 : begin note <= 3; num <= num + 1; end
    344 : begin note <= 1; num <= num + 1; end

    //45
    345 : begin note <= 3; num <= num + 1; end
    346 : begin note <= 1; num <= num + 1; end
    347 : begin note <= 3; num <= num + 1; end
    348 : begin note <= 1; num <= num + 1; end
    349 : begin note <= 3; num <= num + 1; end
    350 : begin note <= 1; num <= num + 1; end
    351 : begin note <= 3; num <= num + 1; end
    352 : begin note <= 1; num <= num + 1; end
    
    //46
    353 : begin note <= 3; num <= num + 1; end
    354 : begin note <= 1; num <= num + 1; end
    355 : begin note <= 3; num <= num + 1; end
    356 : begin note <= 1; num <= num + 1; end
    357 : begin note <= 3; num <= num + 1; end
    358 : begin note <= 0; num <= num + 1; end
    359 : begin note <= 2; num <= num + 1; end
    360 : begin note <= 4; num <= num + 1; end
    
    //47
    361 : begin note <= 3; num <= num + 1; end
    362 : begin note <= 0; num <= num + 1; end
    363 : begin note <= 3; num <= num + 1; end
    364 : begin note <= 0; num <= num + 1; end
    365 : begin note <= 3; num <= num + 1; end
    366 : begin note <= 0; num <= num + 1; end
    367 : begin note <= 3; num <= num + 1; end
    368 : begin note <= 0; num <= num + 1; end    
    
    //48
    369 : begin note <= 3; num <= num + 1; end
    370 : begin note <= 0; num <= num + 1; end
    371 : begin note <= 3; num <= num + 1; end
    372 : begin note <= 0; num <= num + 1; end
    373 : begin note <= 3; num <= num + 1; end
    374 : begin note <= 0; num <= num + 1; end
    375 : begin note <= 3; num <= num + 1; end
    376 : begin note <= 0; num <= num + 1; end

    //49
    377 : begin note <= 3; num <= num + 1; end
    378 : begin note <= 0; num <= num + 1; end
    379 : begin note <= 3; num <= num + 1; end
    380 : begin note <= 0; num <= num + 1; end
    381 : begin note <= 3; num <= num + 1; end
    382 : begin note <= 0; num <= num + 1; end
    383 : begin note <= 3; num <= num + 1; end
    384 : begin note <= 0; num <= num + 1; end

    //50
    385 : begin note <= 3; num <= num + 1; end
    386 : begin note <= 0; num <= num + 1; end
    387 : begin note <= 3; num <= num + 1; end
    388 : begin note <= 0; num <= num + 1; end
    389 : begin note <= 2; num <= num + 1; end
    390 : begin note <= 2; num <= num + 1; end
    391 : begin note <= 4; num <= num + 1; end
    392 : begin note <= 4; num <= num + 1; end    

    //51
    393 : begin note <= 0; num <= num + 1; end
    394 : begin note <= 4; num <= num + 1; end
    395 : begin note <= 3; num <= num + 1; end
    396 : begin note <= 1; num <= num + 1; end
    397 : begin note <= 3; num <= num + 1; end
    398 : begin note <= 1; num <= num + 1; end
    399 : begin note <= 3; num <= num + 1; end
    400 : begin note <= 1; num <= num + 1; end

    //52
    401 : begin note <= 2; num <= num + 1; end
    402 : begin note <= 4; num <= num + 1; end
    403 : begin note <= 3; num <= num + 1; end
    404 : begin note <= 1; num <= num + 1; end
    405 : begin note <= 3; num <= num + 1; end
    406 : begin note <= 1; num <= num + 1; end
    407 : begin note <= 3; num <= num + 1; end
    408 : begin note <= 1; num <= num + 1; end

    //53
    409 : begin note <= 0; num <= num + 1; end
    410 : begin note <= 4; num <= num + 1; end
    411 : begin note <= 3; num <= num + 1; end
    412 : begin note <= 1; num <= num + 1; end
    413 : begin note <= 3; num <= num + 1; end
    414 : begin note <= 1; num <= num + 1; end
    415 : begin note <= 3; num <= num + 1; end
    416 : begin note <= 1; num <= num + 1; end

    //54
    417 : begin note <= 2; num <= num + 1; end
    418 : begin note <= 4; num <= num + 1; end
    419 : begin note <= 3; num <= num + 1; end
    420 : begin note <= 1; num <= num + 1; end
    421 : begin note <= 3; num <= num + 1; end
    422 : begin note <= 1; num <= num + 1; end
    423 : begin note <= 3; num <= num + 1; end
    424 : begin note <= 1; num <= num + 1; end        

    //55
    425 : begin note <= 0; num <= num + 1; end
    426 : begin note <= 4; num <= num + 1; end
    427 : begin note <= 3; num <= num + 1; end
    428 : begin note <= 1; num <= num + 1; end
    429 : begin note <= 3; num <= num + 1; end
    430 : begin note <= 1; num <= num + 1; end
    431 : begin note <= 3; num <= num + 1; end
    432 : begin note <= 1; num <= num + 1; end

    //56
    433 : begin note <= 3; num <= num + 1; end
    434 : begin note <= 1; num <= num + 1; end
    435 : begin note <= 3; num <= num + 1; end
    436 : begin note <= 1; num <= num + 1; end
    437 : begin note <= 3; num <= num + 1; end
    438 : begin note <= 1; num <= num + 1; end
    439 : begin note <= 0; num <= num + 1; end
    440 : begin note <= 4; num <= num + 1; end
    
    //57
    441 : begin note <= 0; num <= num + 1; end
    442 : begin note <= 4; num <= num + 1; end
    443 : begin note <= 3; num <= num + 1; end
    444 : begin note <= 1; num <= num + 1; end
    445 : begin note <= 3; num <= num + 1; end
    446 : begin note <= 1; num <= num + 1; end
    447 : begin note <= 1; num <= num + 1; end
    448 : begin note <= 3; num <= num + 1; end
    
    //58
    449 : begin note <= 3; num <= num + 1; end
    450 : begin note <= 2; num <= num + 1; end
    451 : begin note <= 2; num <= num + 1; end
    452 : begin note <= 1; num <= num + 1; end
    453 : begin note <= 3; num <= num + 1; end
    454 : begin note <= 2; num <= num + 1; end
    455 : begin note <= 2; num <= num + 1; end
    456 : begin note <= 1; num <= num + 1; end    

    //59
    457 : begin note <= 0; num <= num + 1; end
    458 : begin note <= 4; num <= num + 1; end
    459 : begin note <= 3; num <= num + 1; end
    460 : begin note <= 1; num <= num + 1; end
    461 : begin note <= 3; num <= num + 1; end
    462 : begin note <= 1; num <= num + 1; end
    463 : begin note <= 3; num <= num + 1; end
    464 : begin note <= 1; num <= num + 1; end        

    //60
    465 : begin note <= 3; num <= num + 1; end
    466 : begin note <= 1; num <= num + 1; end
    467 : begin note <= 3; num <= num + 1; end
    468 : begin note <= 1; num <= num + 1; end
    469 : begin note <= 3; num <= num + 1; end
    470 : begin note <= 1; num <= num + 1; end
    471 : begin note <= 3; num <= num + 1; end
    472 : begin note <= 1; num <= num + 1; end
    
    //61
    473 : begin note <= 3; num <= num + 1; end
    474 : begin note <= 1; num <= num + 1; end
    475 : begin note <= 3; num <= num + 1; end
    476 : begin note <= 1; num <= num + 1; end
    477 : begin note <= 3; num <= num + 1; end
    478 : begin note <= 1; num <= num + 1; end
    479 : begin note <= 3; num <= num + 1; end
    480 : begin note <= 1; num <= num + 1; end    

    //62
    481 : begin note <= 3; num <= num + 1; end
    482 : begin note <= 1; num <= num + 1; end
    483 : begin note <= 3; num <= num + 1; end
    484 : begin note <= 1; num <= num + 1; end
    485 : begin note <= 3; num <= num + 1; end
    486 : begin note <= 1; num <= num + 1; end
    487 : begin note <= 3; num <= num + 1; end
    488 : begin note <= 1; num <= num + 1; end

    //63
    489 : begin note <= 0; num <= num + 1; end
    490 : begin note <= 4; num <= num + 1; end
    491 : begin note <= 3; num <= num + 1; end
    492 : begin note <= 1; num <= num + 1; end
    493 : begin note <= 3; num <= num + 1; end
    494 : begin note <= 1; num <= num + 1; end
    495 : begin note <= 3; num <= num + 1; end
    496 : begin note <= 1; num <= num + 1; end    

    //64
    497 : begin note <= 3; num <= num + 1; end
    498 : begin note <= 4; num <= num + 1; end
    499 : begin note <= 3; num <= num + 1; end
    500 : begin note <= 4; num <= num + 1; end
    501 : begin note <= 3; num <= num + 1; end
    502 : begin note <= 1; num <= num + 1; end
    503 : begin note <= 3; num <= num + 1; end
    504 : begin note <= 1; num <= num + 1; end
    
    //65
    505 : begin note <= 3; num <= num + 1; end
    506 : begin note <= 4; num <= num + 1; end
    507 : begin note <= 3; num <= num + 1; end
    508 : begin note <= 4; num <= num + 1; end
    509 : begin note <= 3; num <= num + 1; end
    510 : begin note <= 1; num <= num + 1; end
    511 : begin note <= 3; num <= num + 1; end
    512 : begin note <= 1; num <= num + 1; end

    //66
    513 : begin note <= 2; num <= num + 1; end
    514 : begin note <= 4; num <= num + 1; end
    515 : begin note <= 4; num <= num + 1; end
    516 : begin note <= 4; num <= num + 1; end
    517 : begin note <= 4; num <= num + 1; end
    518 : begin note <= 4; num <= num + 1; end
    519 : begin note <= 4; num <= num + 1; end
    520 : begin note <= 4; num <= num + 1; end

    //67
    521 : begin note <= 0; num <= num + 1; end
    522 : begin note <= 1; num <= num + 1; end
    523 : begin note <= 1; num <= num + 1; end
    524 : begin note <= 3; num <= num + 1; end
    525 : begin note <= 1; num <= num + 1; end
    526 : begin note <= 1; num <= num + 1; end
    527 : begin note <= 3; num <= num + 1; end
    528 : begin note <= 1; num <= num + 1; end

    //68
    529 : begin note <= 0; num <= num + 1; end
    530 : begin note <= 1; num <= num + 1; end
    531 : begin note <= 1; num <= num + 1; end
    532 : begin note <= 3; num <= num + 1; end
    533 : begin note <= 1; num <= num + 1; end
    534 : begin note <= 3; num <= num + 1; end
    535 : begin note <= 1; num <= num + 1; end
    536 : begin note <= 3; num <= num + 1; end

    //69
    537 : begin note <= 0; num <= num + 1; end
    538 : begin note <= 1; num <= num + 1; end
    539 : begin note <= 1; num <= num + 1; end
    540 : begin note <= 3; num <= num + 1; end
    541 : begin note <= 1; num <= num + 1; end
    542 : begin note <= 3; num <= num + 1; end
    543 : begin note <= 3; num <= num + 1; end
    544 : begin note <= 3; num <= num + 1; end

    //70
    545 : begin note <= 0; num <= num + 1; end
    546 : begin note <= 1; num <= num + 1; end
    547 : begin note <= 1; num <= num + 1; end
    548 : begin note <= 3; num <= num + 1; end
    549 : begin note <= 1; num <= num + 1; end
    550 : begin note <= 3; num <= num + 1; end
    551 : begin note <= 1; num <= num + 1; end
    552 : begin note <= 1; num <= num + 1; end

    //71
    553 : begin note <= 0; num <= num + 1; end
    554 : begin note <= 1; num <= num + 1; end
    555 : begin note <= 1; num <= num + 1; end
    556 : begin note <= 3; num <= num + 1; end
    557 : begin note <= 1; num <= num + 1; end
    558 : begin note <= 3; num <= num + 1; end
    559 : begin note <= 3; num <= num + 1; end
    560 : begin note <= 3; num <= num + 1; end

    //72
    561 : begin note <= 0; num <= num + 1; end
    562 : begin note <= 1; num <= num + 1; end
    563 : begin note <= 1; num <= num + 1; end
    564 : begin note <= 3; num <= num + 1; end
    565 : begin note <= 1; num <= num + 1; end
    566 : begin note <= 4; num <= num + 1; end
    567 : begin note <= 3; num <= num + 1; end
    568 : begin note <= 3; num <= num + 1; end
    
    //73
    569 : begin note <= 2; num <= num + 1; end
    570 : begin note <= 4; num <= num + 1; end
    571 : begin note <= 1; num <= num + 1; end
    572 : begin note <= 3; num <= num + 1; end
    573 : begin note <= 1; num <= num + 1; end
    574 : begin note <= 1; num <= num + 1; end
    575 : begin note <= 3; num <= num + 1; end
    576 : begin note <= 1; num <= num + 1; end    

    //74
    577 : begin note <= 3; num <= num + 1; end
    578 : begin note <= 4; num <= num + 1; end
    579 : begin note <= 4; num <= num + 1; end
    580 : begin note <= 0; num <= num + 1; end
    581 : begin note <= 4; num <= num + 1; end
    582 : begin note <= 0; num <= num + 1; end
    583 : begin note <= 3; num <= num + 1; end
    584 : begin note <= 1; num <= num + 1; end
   
    //75
    585 : begin note <= 0; num <= num + 1; end
    586 : begin note <= 4; num <= num + 1; end
    587 : begin note <= 4; num <= num + 1; end
    588 : begin note <= 1; num <= num + 1; end
    589 : begin note <= 4; num <= num + 1; end
    590 : begin note <= 1; num <= num + 1; end
    591 : begin note <= 1; num <= num + 1; end
    592 : begin note <= 4; num <= num + 1; end

    //76
    593 : begin note <= 0; num <= num + 1; end
    594 : begin note <= 4; num <= num + 1; end
    595 : begin note <= 4; num <= num + 1; end
    596 : begin note <= 1; num <= num + 1; end
    597 : begin note <= 4; num <= num + 1; end
    598 : begin note <= 1; num <= num + 1; end
    599 : begin note <= 1; num <= num + 1; end
    600: begin note <= 1; num <= num + 1; end 

    //77
    601 : begin note <= 2; num <= num + 1; end
    602 : begin note <= 4; num <= num + 1; end
    603 : begin note <= 4; num <= num + 1; end
    604 : begin note <= 3; num <= num + 1; end
    605 : begin note <= 4; num <= num + 1; end
    606 : begin note <= 3; num <= num + 1; end
    607 : begin note <= 3; num <= num + 1; end
    608 : begin note <= 4; num <= num + 1; end           
    
    //78
    609 : begin note <= 2; num <= num + 1; end
    610 : begin note <= 2; num <= num + 1; end
    611 : begin note <= 2; num <= num + 1; end
    612 : begin note <= 0; num <= num + 1; end
    613 : begin note <= 4; num <= num + 1; end
    614 : begin note <= 4; num <= num + 1; end
    615 : begin note <= 4; num <= num + 1; end
    616 : begin note <= 4; num <= num + 1; end 

    //79
    617 : begin note <= 0; num <= num + 1; end
    618 : begin note <= 4; num <= num + 1; end
    619 : begin note <= 3; num <= num + 1; end
    620 : begin note <= 1; num <= num + 1; end
    621 : begin note <= 3; num <= num + 1; end
    622 : begin note <= 1; num <= num + 1; end
    623 : begin note <= 3; num <= num + 1; end
    624 : begin note <= 1; num <= num + 1; end

    //80
    625 : begin note <= 3; num <= num + 1; end
    626 : begin note <= 1; num <= num + 1; end
    627 : begin note <= 3; num <= num + 1; end
    628 : begin note <= 1; num <= num + 1; end
    629 : begin note <= 3; num <= num + 1; end
    630 : begin note <= 1; num <= num + 1; end
    631 : begin note <= 3; num <= num + 1; end
    632 : begin note <= 1; num <= num + 1; end

    //81
    633 : begin note <= 3; num <= num + 1; end
    634 : begin note <= 1; num <= num + 1; end
    635 : begin note <= 3; num <= num + 1; end
    636 : begin note <= 1; num <= num + 1; end
    637 : begin note <= 3; num <= num + 1; end
    638 : begin note <= 1; num <= num + 1; end
    639 : begin note <= 3; num <= num + 1; end
    640 : begin note <= 1; num <= num + 1; end
    
    //82
    641 : begin note <= 3; num <= num + 1; end
    642 : begin note <= 1; num <= num + 1; end
    643 : begin note <= 3; num <= num + 1; end
    644 : begin note <= 1; num <= num + 1; end
    645 : begin note <= 0; num <= num + 1; end
    646 : begin note <= 4; num <= num + 1; end
    647 : begin note <= 3; num <= num + 1; end
    648 : begin note <= 1; num <= num + 1; end
    
    //83
    649 : begin note <= 0; num <= num + 1; end
    650 : begin note <= 4; num <= num + 1; end
    651 : begin note <= 3; num <= num + 1; end
    652 : begin note <= 1; num <= num + 1; end
    653 : begin note <= 3; num <= num + 1; end
    654 : begin note <= 1; num <= num + 1; end
    655 : begin note <= 3; num <= num + 1; end
    656 : begin note <= 1; num <= num + 1; end        

    //84
    657 : begin note <= 3; num <= num + 1; end
    658 : begin note <= 1; num <= num + 1; end
    659 : begin note <= 3; num <= num + 1; end
    660 : begin note <= 1; num <= num + 1; end
    661 : begin note <= 3; num <= num + 1; end
    662 : begin note <= 1; num <= num + 1; end
    663 : begin note <= 3; num <= num + 1; end
    664 : begin note <= 1; num <= num + 1; end     

    //85
    665 : begin note <= 0; num <= num + 1; end
    666 : begin note <= 4; num <= num + 1; end
    667 : begin note <= 3; num <= num + 1; end
    668 : begin note <= 1; num <= num + 1; end
    669 : begin note <= 3; num <= num + 1; end
    670 : begin note <= 1; num <= num + 1; end
    671 : begin note <= 3; num <= num + 1; end
    672 : begin note <= 1; num <= num + 1; end

    //86
    673 : begin note <= 3; num <= num + 1; end
    674 : begin note <= 3; num <= num + 1; end
    675 : begin note <= 2; num <= num + 1; end
    676 : begin note <= 3; num <= num + 1; end
    677 : begin note <= 3; num <= num + 1; end
    678 : begin note <= 0; num <= num + 1; end
    679 : begin note <= 3; num <= num + 1; end
    680 : begin note <= 1; num <= num + 1; end

    //87
    681 : begin note <= 0; num <= num + 1; end
    682 : begin note <= 4; num <= num + 1; end
    683 : begin note <= 3; num <= num + 1; end
    684 : begin note <= 1; num <= num + 1; end
    685 : begin note <= 3; num <= num + 1; end
    686 : begin note <= 1; num <= num + 1; end
    687 : begin note <= 3; num <= num + 1; end
    688 : begin note <= 1; num <= num + 1; end

    //88
    689 : begin note <= 3; num <= num + 1; end
    690 : begin note <= 1; num <= num + 1; end
    691 : begin note <= 3; num <= num + 1; end
    692 : begin note <= 1; num <= num + 1; end
    693 : begin note <= 3; num <= num + 1; end
    694 : begin note <= 1; num <= num + 1; end
    695 : begin note <= 3; num <= num + 1; end
    696 : begin note <= 1; num <= num + 1; end
    
    //89
    697 : begin note <= 3; num <= num + 1; end
    698 : begin note <= 1; num <= num + 1; end
    699 : begin note <= 3; num <= num + 1; end
    700 : begin note <= 1; num <= num + 1; end
    701 : begin note <= 3; num <= num + 1; end
    702 : begin note <= 1; num <= num + 1; end
    703 : begin note <= 3; num <= num + 1; end
    704 : begin note <= 1; num <= num + 1; end   

    //90
    705 : begin note <= 3; num <= num + 1; end
    706 : begin note <= 1; num <= num + 1; end
    707 : begin note <= 3; num <= num + 1; end
    708 : begin note <= 1; num <= num + 1; end
    709 : begin note <= 3; num <= num + 1; end
    710 : begin note <= 1; num <= num + 1; end
    711 : begin note <= 3; num <= num + 1; end
    712 : begin note <= 1; num <= num + 1; end
    
    //91
    713 : begin note <= 0; num <= num + 1; end
    714 : begin note <= 4; num <= num + 1; end
    715 : begin note <= 3; num <= num + 1; end
    716 : begin note <= 1; num <= num + 1; end
    717 : begin note <= 3; num <= num + 1; end
    718 : begin note <= 1; num <= num + 1; end
    719 : begin note <= 3; num <= num + 1; end
    720 : begin note <= 1; num <= num + 1; end
    
    //92
    721 : begin note <= 3; num <= num + 1; end
    722 : begin note <= 1; num <= num + 1; end
    723 : begin note <= 3; num <= num + 1; end
    724 : begin note <= 1; num <= num + 1; end
    725 : begin note <= 3; num <= num + 1; end
    726 : begin note <= 1; num <= num + 1; end
    727 : begin note <= 3; num <= num + 1; end
    728 : begin note <= 1; num <= num + 1; end      

    //93
    729 : begin note <= 3; num <= num + 1; end
    730 : begin note <= 1; num <= num + 1; end
    731 : begin note <= 3; num <= num + 1; end
    732 : begin note <= 1; num <= num + 1; end
    733 : begin note <= 3; num <= num + 1; end
    734 : begin note <= 1; num <= num + 1; end
    735 : begin note <= 3; num <= num + 1; end
    736 : begin note <= 1; num <= num + 1; end

    //94
    737 : begin note <= 2; num <= num + 1; end
    738 : begin note <= 4; num <= num + 1; end
    739 : begin note <= 4; num <= num + 1; end
    740 : begin note <= 4; num <= num + 1; end
    741 : begin note <= 4; num <= num + 1; end
    742 : begin note <= 4; num <= num + 1; end
    743 : begin note <= 4; num <= num + 1; end
    744 : begin note <= 4; num <= 750; end
    default : begin note <= 4; num <= num + 1; end
    endcase
    
    else if (mode == `play2)
    case (num)
    //3
    10 : begin note <= 4; num <= num + 1; end
    11 : begin note <= 4; num <= num + 1; end 
    12 : begin note <= 4; num <= num + 1; end 
    13 : begin note <= 4; num <= num + 1; end 
    14 : begin note <= 4; num <= num + 1; end 
    15 : begin note <= 4; num <= num + 1; end 
    16 : begin note <= 4; num <= num + 1; end 
    
    //4
    17 : begin note <= 4; num <= num + 1; end 
    18 : begin note <= 4; num <= 25; end 
    19 : begin note <= 4; num <= num + 1; end 
    20 : begin note <= 4; num <= num + 1; end
    21 : begin note <= 4; num <= num + 1; end 
    22 : begin note <= 4; num <= num + 1; end 
    23 : begin note <= 4; num <= num + 1; end 
    24 : begin note <= 4; num <= num + 1; end

    //5
    25 : begin note <= 4; num <= num + 1; end 
    26 : begin note <= 4; num <= num + 1; end 
    27 : begin note <= 4; num <= num + 1; end 
    28 : begin note <= 4; num <= num + 1; end
    29 : begin note <= 4; num <= num + 1; end 
    30 : begin note <= 4; num <= num + 1; end 
    31 : begin note <= 4; num <= num + 1; end 
    32 : begin note <= 4; num <= num + 1; end    
    
    //6
    33 : begin note <= 1; num <= num + 1; end 
    34 : begin note <= 4; num <= num + 1; end 
    35 : begin note <= 3; num <= num + 1; end 
    36 : begin note <= 1; num <= num + 1; end 
    37 : begin note <= 4; num <= num + 1; end 
    38 : begin note <= 4; num <= num + 1; end
    39 : begin note <= 3; num <= num + 1; end 
    40 : begin note <= 4; num <= num + 1; end 

    //7
    41 : begin note <= 1; num <= num + 1; end 
    42 : begin note <= 4; num <= num + 1; end 
    43 : begin note <= 3; num <= num + 1; end 
    44 : begin note <= 1; num <= num + 1; end 
    45 : begin note <= 4; num <= num + 1; end 
    46 : begin note <= 4; num <= num + 1; end
    47 : begin note <= 3; num <= num + 1; end 
    48 : begin note <= 4; num <= num + 1; end  

    //8
    49 : begin note <= 1; num <= num + 1; end 
    50 : begin note <= 4; num <= num + 1; end 
    51 : begin note <= 3; num <= num + 1; end 
    52 : begin note <= 1; num <= num + 1; end 
    53 : begin note <= 4; num <= num + 1; end 
    54 : begin note <= 4; num <= num + 1; end
    55 : begin note <= 3; num <= num + 1; end 
    56 : begin note <= 4; num <= num + 1; end     
    
    //9
    57 : begin note <= 1; num <= num + 1; end 
    58 : begin note <= 1; num <= num + 1; end 
    59 : begin note <= 3; num <= num + 1; end 
    60 : begin note <= 1; num <= num + 1; end 
    61 : begin note <= 4; num <= num + 1; end 
    62 : begin note <= 4; num <= num + 1; end
    63 : begin note <= 3; num <= num + 1; end 
    64 : begin note <= 4; num <= num + 1; end

    //10
    65 : begin note <= 1; num <= num + 1; end 
    66 : begin note <= 4; num <= num + 1; end 
    67 : begin note <= 3; num <= num + 1; end 
    68 : begin note <= 1; num <= num + 1; end 
    69 : begin note <= 4; num <= num + 1; end 
    70 : begin note <= 4; num <= num + 1; end
    71 : begin note <= 3; num <= num + 1; end 
    72 : begin note <= 4; num <= num + 1; end
    
    //11
    73 : begin note <= 1; num <= num + 1; end 
    74 : begin note <= 4; num <= num + 1; end 
    75 : begin note <= 3; num <= num + 1; end 
    76 : begin note <= 1; num <= num + 1; end 
    77 : begin note <= 4; num <= num + 1; end 
    78 : begin note <= 4; num <= num + 1; end
    79 : begin note <= 3; num <= num + 1; end 
    80 : begin note <= 4; num <= num + 1; end

    //12
    81 : begin note <= 1; num <= num + 1; end 
    82 : begin note <= 4; num <= num + 1; end 
    83 : begin note <= 3; num <= num + 1; end 
    84 : begin note <= 1; num <= num + 1; end 
    85 : begin note <= 4; num <= num + 1; end 
    86 : begin note <= 4; num <= num + 1; end
    87 : begin note <= 3; num <= num + 1; end 
    88 : begin note <= 4; num <= num + 1; end

    //13
    89 : begin note <= 1; num <= num + 1; end 
    90 : begin note <= 1; num <= num + 1; end 
    91 : begin note <= 3; num <= num + 1; end 
    92 : begin note <= 1; num <= num + 1; end 
    93 : begin note <= 4; num <= num + 1; end 
    94 : begin note <= 4; num <= num + 1; end
    95 : begin note <= 3; num <= num + 1; end 
    96 : begin note <= 4; num <= num + 1; end
  
    //14
    97 : begin note <= 0; num <= num + 1; end 
    98 : begin note <= 4; num <= num + 1; end 
    99 : begin note <= 3; num <= num + 1; end 
    100 : begin note <= 1; num <= num + 1; end 
    101 : begin note <= 4; num <= num + 1; end 
    102 : begin note <= 4; num <= num + 1; end
    103 : begin note <= 2; num <= num + 1; end 
    104 : begin note <= 1; num <= num + 1; end
    
    //15
    105 : begin note <= 0; num <= num + 1; end 
    106 : begin note <= 4; num <= num + 1; end 
    107 : begin note <= 3; num <= num + 1; end 
    108 : begin note <= 1; num <= num + 1; end 
    109 : begin note <= 4; num <= num + 1; end 
    110 : begin note <= 4; num <= num + 1; end
    111 : begin note <= 2; num <= num + 1; end 
    112 : begin note <= 4; num <= num + 1; end
    
    //16
    113 : begin note <= 0; num <= num + 1; end 
    114 : begin note <= 4; num <= num + 1; end 
    115 : begin note <= 3; num <= num + 1; end 
    116 : begin note <= 1; num <= num + 1; end 
    117 : begin note <= 4; num <= num + 1; end 
    118 : begin note <= 4; num <= num + 1; end
    119 : begin note <= 2; num <= num + 1; end 
    120 : begin note <= 4; num <= num + 1; end         

    //17
    121 : begin note <= 0; num <= num + 1; end 
    122 : begin note <= 0; num <= num + 1; end 
    123 : begin note <= 3; num <= num + 1; end 
    124 : begin note <= 1; num <= num + 1; end 
    125 : begin note <= 4; num <= num + 1; end 
    126 : begin note <= 4; num <= num + 1; end
    127 : begin note <= 2; num <= num + 1; end 
    128 : begin note <= 4; num <= num + 1; end

    //18
    129 : begin note <= 0; num <= num + 1; end 
    130 : begin note <= 4; num <= num + 1; end 
    131 : begin note <= 3; num <= num + 1; end 
    132 : begin note <= 1; num <= num + 1; end 
    133 : begin note <= 4; num <= num + 1; end 
    134 : begin note <= 4; num <= num + 1; end
    135 : begin note <= 2; num <= num + 1; end 
    136 : begin note <= 4; num <= num + 1; end    

    //19
    137 : begin note <= 0; num <= num + 1; end 
    138 : begin note <= 4; num <= num + 1; end 
    139 : begin note <= 3; num <= num + 1; end 
    140 : begin note <= 1; num <= num + 1; end 
    141 : begin note <= 4; num <= num + 1; end 
    142 : begin note <= 4; num <= num + 1; end
    143 : begin note <= 2; num <= num + 1; end 
    144 : begin note <= 4; num <= num + 1; end
    
    //20
    145 : begin note <= 0; num <= num + 1; end 
    146 : begin note <= 4; num <= num + 1; end 
    147 : begin note <= 3; num <= num + 1; end 
    148 : begin note <= 1; num <= num + 1; end 
    149 : begin note <= 4; num <= num + 1; end 
    150 : begin note <= 4; num <= num + 1; end
    151 : begin note <= 2; num <= num + 1; end 
    152 : begin note <= 4; num <= num + 1; end
    
    //21
    153 : begin note <= 0; num <= num + 1; end 
    154 : begin note <= 0; num <= num + 1; end 
    155 : begin note <= 3; num <= num + 1; end 
    156 : begin note <= 1; num <= num + 1; end 
    157 : begin note <= 4; num <= num + 1; end 
    158 : begin note <= 4; num <= num + 1; end
    159 : begin note <= 2; num <= num + 1; end 
    160 : begin note <= 4; num <= num + 1; end
    
    //22
    161 : begin note <= 0; num <= num + 1; end 
    162 : begin note <= 1; num <= num + 1; end 
    163 : begin note <= 3; num <= num + 1; end 
    164 : begin note <= 1; num <= num + 1; end 
    165 : begin note <= 3; num <= num + 1; end 
    166 : begin note <= 4; num <= num + 1; end
    167 : begin note <= 3; num <= num + 1; end 
    168 : begin note <= 4; num <= num + 1; end    
    
    //23
    169 : begin note <= 0; num <= num + 1; end 
    170 : begin note <= 1; num <= num + 1; end 
    171 : begin note <= 3; num <= num + 1; end 
    172 : begin note <= 1; num <= num + 1; end 
    173 : begin note <= 3; num <= num + 1; end 
    174 : begin note <= 4; num <= num + 1; end
    175 : begin note <= 3; num <= num + 1; end 
    176 : begin note <= 4; num <= num + 1; end
        
    //24                                      
    177 : begin note <= 0; num <= num + 1; end
    178 : begin note <= 1; num <= num + 1; end
    179 : begin note <= 3; num <= num + 1; end
    180 : begin note <= 1; num <= num + 1; end
    181 : begin note <= 3; num <= num + 1; end
    182 : begin note <= 4; num <= num + 1; end
    183 : begin note <= 3; num <= num + 1; end
    184 : begin note <= 4; num <= num + 1; end    

    //25                                     
    185 : begin note <= 0; num <= num + 1; end
    186 : begin note <= 0; num <= num + 1; end
    187 : begin note <= 3; num <= num + 1; end
    188 : begin note <= 1; num <= num + 1; end
    189 : begin note <= 4; num <= num + 1; end
    190 : begin note <= 4; num <= num + 1; end
    191 : begin note <= 2; num <= num + 1; end
    192 : begin note <= 4; num <= num + 1; end

    //26                                     
    193 : begin note <= 0; num <= num + 1; end
    194 : begin note <= 1; num <= num + 1; end
    195 : begin note <= 3; num <= num + 1; end
    196 : begin note <= 1; num <= num + 1; end
    197 : begin note <= 3; num <= num + 1; end
    198 : begin note <= 4; num <= num + 1; end
    199 : begin note <= 3; num <= num + 1; end
    200 : begin note <= 4; num <= num + 1; end

    //27                                     
    201 : begin note <= 0; num <= num + 1; end
    202 : begin note <= 1; num <= num + 1; end
    203 : begin note <= 3; num <= num + 1; end
    204 : begin note <= 1; num <= num + 1; end
    205 : begin note <= 3; num <= num + 1; end
    206 : begin note <= 4; num <= num + 1; end
    207 : begin note <= 3; num <= num + 1; end
    208 : begin note <= 4; num <= num + 1; end

    //28                                    
    209 : begin note <= 0; num <= num + 1; end
    210 : begin note <= 1; num <= num + 1; end
    211 : begin note <= 3; num <= num + 1; end
    212 : begin note <= 1; num <= num + 1; end
    213 : begin note <= 3; num <= num + 1; end
    214 : begin note <= 4; num <= num + 1; end
    215 : begin note <= 3; num <= num + 1; end
    216 : begin note <= 4; num <= num + 1; end

    //29                                    
    217 : begin note <= 0; num <= num + 1; end
    218 : begin note <= 0; num <= num + 1; end
    219 : begin note <= 3; num <= num + 1; end
    220 : begin note <= 1; num <= num + 1; end
    221 : begin note <= 4; num <= num + 1; end
    222 : begin note <= 4; num <= num + 1; end
    223 : begin note <= 2; num <= num + 1; end
    224 : begin note <= 4; num <= num + 1; end

    //30
    225 : begin note <= 0; num <= num + 1; end
    226 : begin note <= 1; num <= num + 1; end
    227 : begin note <= 3; num <= num + 1; end
    228 : begin note <= 1; num <= num + 1; end
    229 : begin note <= 3; num <= num + 1; end
    230 : begin note <= 4; num <= num + 1; end
    231 : begin note <= 3; num <= num + 1; end
    232 : begin note <= 4; num <= num + 1; end

    //31
    233 : begin note <= 0; num <= num + 1; end
    234 : begin note <= 1; num <= num + 1; end
    235 : begin note <= 3; num <= num + 1; end
    236 : begin note <= 1; num <= num + 1; end
    237 : begin note <= 3; num <= num + 1; end
    238 : begin note <= 4; num <= num + 1; end
    239 : begin note <= 3; num <= num + 1; end
    240 : begin note <= 4; num <= num + 1; end
    
    //32
    241 : begin note <= 0; num <= num + 1; end
    242 : begin note <= 1; num <= num + 1; end
    243 : begin note <= 3; num <= num + 1; end
    244 : begin note <= 1; num <= num + 1; end
    245 : begin note <= 3; num <= num + 1; end
    246 : begin note <= 4; num <= num + 1; end
    247 : begin note <= 3; num <= num + 1; end
    248 : begin note <= 4; num <= num + 1; end
    
    //33
    249 : begin note <= 0; num <= num + 1; end
    250 : begin note <= 0; num <= num + 1; end
    251 : begin note <= 3; num <= num + 1; end
    252 : begin note <= 1; num <= num + 1; end
    253 : begin note <= 4; num <= num + 1; end
    254 : begin note <= 4; num <= num + 1; end
    255 : begin note <= 2; num <= num + 1; end
    256 : begin note <= 4; num <= num + 1; end    
    
    //34
    257 : begin note <= 0; num <= num + 1; end
    258 : begin note <= 1; num <= num + 1; end
    259 : begin note <= 3; num <= num + 1; end
    260 : begin note <= 1; num <= num + 1; end
    261 : begin note <= 3; num <= num + 1; end
    262 : begin note <= 4; num <= num + 1; end
    263 : begin note <= 3; num <= num + 1; end
    264 : begin note <= 4; num <= num + 1; end     
    
    //35
    265 : begin note <= 0; num <= num + 1; end
    266 : begin note <= 1; num <= num + 1; end
    267 : begin note <= 3; num <= num + 1; end
    268 : begin note <= 1; num <= num + 1; end
    269 : begin note <= 3; num <= num + 1; end
    270 : begin note <= 4; num <= num + 1; end
    271 : begin note <= 3; num <= num + 1; end
    272 : begin note <= 4; num <= num + 1; end
    
    //36
    273 : begin note <= 0; num <= num + 1; end
    274 : begin note <= 1; num <= num + 1; end
    275 : begin note <= 3; num <= num + 1; end
    276 : begin note <= 1; num <= num + 1; end
    277 : begin note <= 3; num <= num + 1; end
    278 : begin note <= 4; num <= num + 1; end
    279 : begin note <= 3; num <= num + 1; end
    280 : begin note <= 4; num <= num + 1; end       
    
    //37
    281 : begin note <= 0; num <= num + 1; end
    282 : begin note <= 0; num <= num + 1; end
    283 : begin note <= 3; num <= num + 1; end
    284 : begin note <= 1; num <= num + 1; end
    285 : begin note <= 4; num <= num + 1; end
    286 : begin note <= 4; num <= num + 1; end
    287 : begin note <= 2; num <= num + 1; end
    288 : begin note <= 4; num <= num + 1; end

    //38
    289 : begin note <= 1; num <= num + 1; end
    290 : begin note <= 4; num <= num + 1; end
    291 : begin note <= 3; num <= num + 1; end
    292 : begin note <= 1; num <= num + 1; end
    293 : begin note <= 4; num <= num + 1; end
    294 : begin note <= 4; num <= num + 1; end
    295 : begin note <= 3; num <= num + 1; end
    296 : begin note <= 4; num <= 298; end

    //39
    297 : begin note <= 1; num <= num + 1; end
    298 : begin note <= 4; num <= num + 1; end
    299 : begin note <= 3; num <= num + 1; end
    300 : begin note <= 1; num <= num + 1; end
    301 : begin note <= 4; num <= num + 1; end
    302 : begin note <= 4; num <= num + 1; end
    303 : begin note <= 3; num <= num + 1; end
    304 : begin note <= 4; num <= num + 1; end

    //40
    305 : begin note <= 1; num <= num + 1; end
    306 : begin note <= 4; num <= num + 1; end
    307 : begin note <= 3; num <= num + 1; end
    308 : begin note <= 1; num <= num + 1; end
    309 : begin note <= 4; num <= num + 1; end
    310 : begin note <= 4; num <= num + 1; end
    311 : begin note <= 3; num <= num + 1; end
    312 : begin note <= 4; num <= num + 1; end
    
    //41
    313 : begin note <= 1; num <= num + 1; end
    314 : begin note <= 1; num <= num + 1; end
    315 : begin note <= 3; num <= num + 1; end
    316 : begin note <= 1; num <= num + 1; end
    317 : begin note <= 4; num <= num + 1; end
    318 : begin note <= 4; num <= num + 1; end
    319 : begin note <= 3; num <= num + 1; end
    320 : begin note <= 4; num <= num + 1; end

    //42
    321 : begin note <= 1; num <= num + 1; end
    322 : begin note <= 4; num <= num + 1; end
    323 : begin note <= 3; num <= num + 1; end
    324 : begin note <= 1; num <= num + 1; end
    325 : begin note <= 4; num <= num + 1; end
    326 : begin note <= 4; num <= num + 1; end
    327 : begin note <= 3; num <= num + 1; end
    328 : begin note <= 4; num <= num + 1; end

    //43
    329 : begin note <= 1; num <= num + 1; end
    330 : begin note <= 4; num <= num + 1; end
    331 : begin note <= 3; num <= num + 1; end
    332 : begin note <= 1; num <= num + 1; end
    333 : begin note <= 4; num <= num + 1; end
    334 : begin note <= 4; num <= num + 1; end
    335 : begin note <= 3; num <= num + 1; end
    336 : begin note <= 4; num <= num + 1; end
    
    //44
    337 : begin note <= 1; num <= num + 1; end
    338 : begin note <= 4; num <= num + 1; end
    339 : begin note <= 3; num <= num + 1; end
    340 : begin note <= 1; num <= num + 1; end
    341 : begin note <= 4; num <= num + 1; end
    342 : begin note <= 4; num <= num + 1; end
    343 : begin note <= 3; num <= num + 1; end
    344 : begin note <= 4; num <= num + 1; end

    //45
    345 : begin note <= 1; num <= num + 1; end
    346 : begin note <= 1; num <= num + 1; end
    347 : begin note <= 3; num <= num + 1; end
    348 : begin note <= 1; num <= num + 1; end
    349 : begin note <= 4; num <= num + 1; end
    350 : begin note <= 4; num <= num + 1; end
    351 : begin note <= 3; num <= num + 1; end
    352 : begin note <= 4; num <= num + 1; end
    
    //46
    353 : begin note <= 0; num <= num + 1; end
    354 : begin note <= 4; num <= num + 1; end
    355 : begin note <= 3; num <= num + 1; end
    356 : begin note <= 1; num <= num + 1; end
    357 : begin note <= 4; num <= num + 1; end
    358 : begin note <= 4; num <= num + 1; end
    359 : begin note <= 2; num <= num + 1; end
    360 : begin note <= 4; num <= num + 1; end
    
    //47
    361 : begin note <= 0; num <= num + 1; end
    362 : begin note <= 4; num <= num + 1; end
    363 : begin note <= 3; num <= num + 1; end
    364 : begin note <= 1; num <= num + 1; end
    365 : begin note <= 4; num <= num + 1; end
    366 : begin note <= 4; num <= num + 1; end
    367 : begin note <= 2; num <= num + 1; end
    368 : begin note <= 4; num <= num + 1; end    
    
    //48
    369 : begin note <= 0; num <= num + 1; end
    370 : begin note <= 4; num <= num + 1; end
    371 : begin note <= 3; num <= num + 1; end
    372 : begin note <= 1; num <= num + 1; end
    373 : begin note <= 4; num <= num + 1; end
    374 : begin note <= 4; num <= num + 1; end
    375 : begin note <= 2; num <= num + 1; end
    376 : begin note <= 4; num <= num + 1; end

    //49
    377 : begin note <= 0; num <= num + 1; end
    378 : begin note <= 0; num <= num + 1; end
    379 : begin note <= 3; num <= num + 1; end
    380 : begin note <= 1; num <= num + 1; end
    381 : begin note <= 4; num <= num + 1; end
    382 : begin note <= 4; num <= num + 1; end
    383 : begin note <= 2; num <= num + 1; end
    384 : begin note <= 4; num <= num + 1; end

    //50
    385 : begin note <= 0; num <= num + 1; end
    386 : begin note <= 4; num <= num + 1; end
    387 : begin note <= 3; num <= num + 1; end
    388 : begin note <= 1; num <= num + 1; end
    389 : begin note <= 4; num <= num + 1; end
    390 : begin note <= 4; num <= num + 1; end
    391 : begin note <= 2; num <= num + 1; end
    392 : begin note <= 4; num <= num + 1; end    

    //51
    393 : begin note <= 0; num <= num + 1; end
    394 : begin note <= 4; num <= num + 1; end
    395 : begin note <= 3; num <= num + 1; end
    396 : begin note <= 1; num <= num + 1; end
    397 : begin note <= 4; num <= num + 1; end
    398 : begin note <= 4; num <= num + 1; end
    399 : begin note <= 2; num <= num + 1; end
    400 : begin note <= 4; num <= num + 1; end

    //52
    401 : begin note <= 0; num <= num + 1; end
    402 : begin note <= 4; num <= num + 1; end
    403 : begin note <= 3; num <= num + 1; end
    404 : begin note <= 1; num <= num + 1; end
    405 : begin note <= 4; num <= num + 1; end
    406 : begin note <= 4; num <= num + 1; end
    407 : begin note <= 2; num <= num + 1; end
    408 : begin note <= 4; num <= num + 1; end

    //53
    409 : begin note <= 0; num <= num + 1; end
    410 : begin note <= 0; num <= num + 1; end
    411 : begin note <= 3; num <= num + 1; end
    412 : begin note <= 1; num <= num + 1; end
    413 : begin note <= 4; num <= num + 1; end
    414 : begin note <= 4; num <= num + 1; end
    415 : begin note <= 0; num <= num + 1; end
    416 : begin note <= 4; num <= num + 1; end

    //54
    417 : begin note <= 0; num <= num + 1; end
    418 : begin note <= 1; num <= num + 1; end
    419 : begin note <= 3; num <= num + 1; end
    420 : begin note <= 1; num <= num + 1; end
    421 : begin note <= 3; num <= num + 1; end
    422 : begin note <= 4; num <= num + 1; end
    423 : begin note <= 3; num <= num + 1; end
    424 : begin note <= 4; num <= num + 1; end        

    //55
    425 : begin note <= 0; num <= num + 1; end
    426 : begin note <= 1; num <= num + 1; end
    427 : begin note <= 3; num <= num + 1; end
    428 : begin note <= 1; num <= num + 1; end
    429 : begin note <= 3; num <= num + 1; end
    430 : begin note <= 4; num <= num + 1; end
    431 : begin note <= 3; num <= num + 1; end
    432 : begin note <= 3; num <= num + 1; end

    //56
    433 : begin note <= 0; num <= num + 1; end
    434 : begin note <= 1; num <= num + 1; end
    435 : begin note <= 3; num <= num + 1; end
    436 : begin note <= 1; num <= num + 1; end
    437 : begin note <= 3; num <= num + 1; end
    438 : begin note <= 4; num <= num + 1; end
    439 : begin note <= 3; num <= num + 1; end
    440 : begin note <= 4; num <= num + 1; end
    
    //57
    441 : begin note <= 0; num <= num + 1; end
    442 : begin note <= 0; num <= num + 1; end
    443 : begin note <= 3; num <= num + 1; end
    444 : begin note <= 1; num <= num + 1; end
    445 : begin note <= 4; num <= num + 1; end
    446 : begin note <= 4; num <= num + 1; end
    447 : begin note <= 2; num <= num + 1; end
    448 : begin note <= 4; num <= num + 1; end
    
    //58
    449 : begin note <= 0; num <= num + 1; end
    450 : begin note <= 1; num <= num + 1; end
    451 : begin note <= 3; num <= num + 1; end
    452 : begin note <= 1; num <= num + 1; end
    453 : begin note <= 3; num <= num + 1; end
    454 : begin note <= 4; num <= num + 1; end
    455 : begin note <= 3; num <= num + 1; end
    456 : begin note <= 4; num <= num + 1; end    

    //59
    457 : begin note <= 0; num <= num + 1; end
    458 : begin note <= 1; num <= num + 1; end
    459 : begin note <= 3; num <= num + 1; end
    460 : begin note <= 1; num <= num + 1; end
    461 : begin note <= 3; num <= num + 1; end
    462 : begin note <= 4; num <= num + 1; end
    463 : begin note <= 3; num <= num + 1; end
    464 : begin note <= 3; num <= num + 1; end        

    //60
    465 : begin note <= 0; num <= num + 1; end
    466 : begin note <= 1; num <= num + 1; end
    467 : begin note <= 3; num <= num + 1; end
    468 : begin note <= 1; num <= num + 1; end
    469 : begin note <= 3; num <= num + 1; end
    470 : begin note <= 4; num <= num + 1; end
    471 : begin note <= 3; num <= num + 1; end
    472 : begin note <= 4; num <= num + 1; end
    
    //61
    473 : begin note <= 0; num <= num + 1; end
    474 : begin note <= 0; num <= num + 1; end
    475 : begin note <= 3; num <= num + 1; end
    476 : begin note <= 1; num <= num + 1; end
    477 : begin note <= 4; num <= num + 1; end
    478 : begin note <= 4; num <= num + 1; end
    479 : begin note <= 2; num <= num + 1; end
    480 : begin note <= 4; num <= num + 1; end    

    //62
    481 : begin note <= 0; num <= num + 1; end
    482 : begin note <= 1; num <= num + 1; end
    483 : begin note <= 3; num <= num + 1; end
    484 : begin note <= 1; num <= num + 1; end
    485 : begin note <= 3; num <= num + 1; end
    486 : begin note <= 4; num <= num + 1; end
    487 : begin note <= 3; num <= num + 1; end
    488 : begin note <= 4; num <= num + 1; end

    //63
    489 : begin note <= 0; num <= num + 1; end
    490 : begin note <= 1; num <= num + 1; end
    491 : begin note <= 3; num <= num + 1; end
    492 : begin note <= 1; num <= num + 1; end
    493 : begin note <= 3; num <= num + 1; end
    494 : begin note <= 4; num <= num + 1; end
    495 : begin note <= 3; num <= num + 1; end
    496 : begin note <= 3; num <= num + 1; end    

    //64
    497 : begin note <= 0; num <= num + 1; end
    498 : begin note <= 1; num <= num + 1; end
    499 : begin note <= 3; num <= num + 1; end
    500 : begin note <= 1; num <= num + 1; end
    501 : begin note <= 3; num <= num + 1; end
    502 : begin note <= 4; num <= num + 1; end
    503 : begin note <= 3; num <= num + 1; end
    504 : begin note <= 4; num <= num + 1; end
    
    //65
    505 : begin note <= 0; num <= num + 1; end
    506 : begin note <= 0; num <= num + 1; end
    507 : begin note <= 3; num <= num + 1; end
    508 : begin note <= 1; num <= num + 1; end
    509 : begin note <= 4; num <= num + 1; end
    510 : begin note <= 4; num <= num + 1; end
    511 : begin note <= 2; num <= num + 1; end
    512 : begin note <= 4; num <= num + 1; end

    //66
    513 : begin note <= 0; num <= num + 1; end
    514 : begin note <= 1; num <= num + 1; end
    515 : begin note <= 3; num <= num + 1; end
    516 : begin note <= 1; num <= num + 1; end
    517 : begin note <= 3; num <= num + 1; end
    518 : begin note <= 4; num <= num + 1; end
    519 : begin note <= 3; num <= num + 1; end
    520 : begin note <= 4; num <= num + 1; end

    //67
    521 : begin note <= 0; num <= num + 1; end
    522 : begin note <= 1; num <= num + 1; end
    523 : begin note <= 3; num <= num + 1; end
    524 : begin note <= 1; num <= num + 1; end
    525 : begin note <= 3; num <= num + 1; end
    526 : begin note <= 4; num <= num + 1; end
    527 : begin note <= 3; num <= num + 1; end
    528 : begin note <= 3; num <= num + 1; end

    //68
    529 : begin note <= 0; num <= num + 1; end
    530 : begin note <= 1; num <= num + 1; end
    531 : begin note <= 3; num <= num + 1; end
    532 : begin note <= 1; num <= num + 1; end
    533 : begin note <= 3; num <= num + 1; end
    534 : begin note <= 4; num <= num + 1; end
    535 : begin note <= 3; num <= num + 1; end
    536 : begin note <= 4; num <= num + 1; end

    //69
    537 : begin note <= 1; num <= num + 1; end
    538 : begin note <= 1; num <= num + 1; end
    539 : begin note <= 3; num <= num + 1; end
    540 : begin note <= 1; num <= num + 1; end
    541 : begin note <= 1; num <= num + 1; end
    542 : begin note <= 1; num <= num + 1; end
    543 : begin note <= 2; num <= num + 1; end
    544 : begin note <= 0; num <= num + 1; end

    //70
    545 : begin note <= 4; num <= 547; end
    546 : begin note <= 4; num <= num + 1; end
    547 : begin note <= 4; num <= num + 1; end
    548 : begin note <= 4; num <= num + 1; end
    549 : begin note <= 4; num <= num + 1; end
    550 : begin note <= 4; num <= num + 1; end
    551 : begin note <= 4; num <= num + 1; end
    552 : begin note <= 4; num <= num + 1; end

    //71
    553 : begin note <= 4; num <= num + 1; end
    554 : begin note <= 4; num <= num + 1; end
    555 : begin note <= 4; num <= num + 1; end
    556 : begin note <= 4; num <= num + 1; end
    557 : begin note <= 4; num <= num + 1; end
    558 : begin note <= 4; num <= num + 1; end
    559 : begin note <= 4; num <= num + 1; end
    560 : begin note <= 4; num <= num + 1; end

    //72
    561 : begin note <= 4; num <= num + 1; end
    562 : begin note <= 4; num <= num + 1; end
    563 : begin note <= 4; num <= num + 1; end
    564 : begin note <= 4; num <= num + 1; end
    565 : begin note <= 4; num <= num + 1; end
    566 : begin note <= 4; num <= num + 1; end
    567 : begin note <= 4; num <= num + 1; end
    568 : begin note <= 4; num <= num + 1; end
    
    //73
    569 : begin note <= 4; num <= num + 1; end
    570 : begin note <= 4; num <= num + 1; end
    571 : begin note <= 4; num <= num + 1; end
    572 : begin note <= 4; num <= num + 1; end
    573 : begin note <= 4; num <= num + 1; end
    574 : begin note <= 4; num <= num + 1; end
    575 : begin note <= 4; num <= num + 1; end
    576 : begin note <= 4; num <= num + 1; end    

    //74
    577 : begin note <= 4; num <= num + 1; end
    578 : begin note <= 4; num <= num + 1; end
    579 : begin note <= 4; num <= num + 1; end
    580 : begin note <= 4; num <= num + 1; end
    581 : begin note <= 4; num <= num + 1; end
    582 : begin note <= 4; num <= num + 1; end
    583 : begin note <= 4; num <= num + 1; end
    584 : begin note <= 4; num <= num + 1; end
   
    //75
    585 : begin note <= 4; num <= num + 1; end
    586 : begin note <= 4; num <= num + 1; end
    587 : begin note <= 4; num <= num + 1; end
    588 : begin note <= 4; num <= num + 1; end
    589 : begin note <= 4; num <= num + 1; end
    590 : begin note <= 4; num <= num + 1; end
    591 : begin note <= 4; num <= num + 1; end
    592 : begin note <= 4; num <= num + 1; end

    //76
    593 : begin note <= 4; num <= num + 1; end
    594 : begin note <= 4; num <= num + 1; end
    595 : begin note <= 4; num <= num + 1; end
    596 : begin note <= 4; num <= num + 1; end
    597 : begin note <= 4; num <= num + 1; end
    598 : begin note <= 4; num <= num + 1; end
    599 : begin note <= 4; num <= num + 1; end
    600 : begin note <= 4; num <= num + 1; end 

    //77
    601 : begin note <= 4; num <= 603; end
    602 : begin note <= 4; num <= num + 1; end
    603 : begin note <= 4; num <= num + 1; end
    604 : begin note <= 4; num <= num + 1; end
    605 : begin note <= 4; num <= num + 1; end
    606 : begin note <= 4; num <= num + 1; end
    607 : begin note <= 4; num <= num + 1; end
    608 : begin note <= 3; num <= num + 1; end           
    
    //78
    609 : begin note <= 0; num <= num + 1; end
    610 : begin note <= 1; num <= num + 1; end
    611 : begin note <= 3; num <= num + 1; end
    612 : begin note <= 1; num <= num + 1; end
    613 : begin note <= 3; num <= num + 1; end
    614 : begin note <= 4; num <= num + 1; end
    615 : begin note <= 3; num <= num + 1; end
    616 : begin note <= 4; num <= num + 1; end 

    //79
    617 : begin note <= 0; num <= num + 1; end
    618 : begin note <= 1; num <= num + 1; end
    619 : begin note <= 3; num <= num + 1; end
    620 : begin note <= 1; num <= num + 1; end
    621 : begin note <= 3; num <= num + 1; end
    622 : begin note <= 4; num <= num + 1; end
    623 : begin note <= 3; num <= num + 1; end
    624 : begin note <= 3; num <= num + 1; end

    //80
    625 : begin note <= 0; num <= num + 1; end
    626 : begin note <= 1; num <= num + 1; end
    627 : begin note <= 3; num <= num + 1; end
    628 : begin note <= 1; num <= num + 1; end
    629 : begin note <= 3; num <= num + 1; end
    630 : begin note <= 4; num <= num + 1; end
    631 : begin note <= 3; num <= num + 1; end
    632 : begin note <= 4; num <= num + 1; end

    //81
    633 : begin note <= 0; num <= num + 1; end
    634 : begin note <= 0; num <= num + 1; end
    635 : begin note <= 3; num <= num + 1; end
    636 : begin note <= 1; num <= num + 1; end
    637 : begin note <= 4; num <= num + 1; end
    638 : begin note <= 4; num <= num + 1; end
    639 : begin note <= 2; num <= num + 1; end
    640 : begin note <= 4; num <= num + 1; end
    
    //82
    641 : begin note <= 0; num <= num + 1; end
    642 : begin note <= 1; num <= num + 1; end
    643 : begin note <= 3; num <= num + 1; end
    644 : begin note <= 1; num <= num + 1; end
    645 : begin note <= 3; num <= num + 1; end
    646 : begin note <= 4; num <= num + 1; end
    647 : begin note <= 3; num <= num + 1; end
    648 : begin note <= 4; num <= num + 1; end
    
    //83
    649 : begin note <= 0; num <= num + 1; end
    650 : begin note <= 1; num <= num + 1; end
    651 : begin note <= 3; num <= num + 1; end
    652 : begin note <= 1; num <= num + 1; end
    653 : begin note <= 3; num <= num + 1; end
    654 : begin note <= 4; num <= num + 1; end
    655 : begin note <= 3; num <= num + 1; end
    656 : begin note <= 3; num <= num + 1; end        

    //84
    657 : begin note <= 0; num <= num + 1; end
    658 : begin note <= 1; num <= num + 1; end
    659 : begin note <= 3; num <= num + 1; end
    660 : begin note <= 1; num <= num + 1; end
    661 : begin note <= 3; num <= num + 1; end
    662 : begin note <= 4; num <= num + 1; end
    663 : begin note <= 3; num <= num + 1; end
    664 : begin note <= 4; num <= num + 1; end     

    //85
    665 : begin note <= 0; num <= num + 1; end
    666 : begin note <= 0; num <= num + 1; end
    667 : begin note <= 3; num <= num + 1; end
    668 : begin note <= 1; num <= num + 1; end
    669 : begin note <= 4; num <= num + 1; end
    670 : begin note <= 4; num <= num + 1; end
    671 : begin note <= 2; num <= num + 1; end
    672 : begin note <= 4; num <= num + 1; end

    //86
    673 : begin note <= 0; num <= num + 1; end
    674 : begin note <= 1; num <= num + 1; end
    675 : begin note <= 3; num <= num + 1; end
    676 : begin note <= 1; num <= num + 1; end
    677 : begin note <= 3; num <= num + 1; end
    678 : begin note <= 4; num <= num + 1; end
    679 : begin note <= 3; num <= num + 1; end
    680 : begin note <= 4; num <= num + 1; end

    //87
    681 : begin note <= 0; num <= num + 1; end
    682 : begin note <= 1; num <= num + 1; end
    683 : begin note <= 3; num <= num + 1; end
    684 : begin note <= 1; num <= num + 1; end
    685 : begin note <= 3; num <= num + 1; end
    686 : begin note <= 4; num <= num + 1; end
    687 : begin note <= 3; num <= num + 1; end
    688 : begin note <= 3; num <= num + 1; end

    //88
    689 : begin note <= 0; num <= num + 1; end
    690 : begin note <= 1; num <= num + 1; end
    691 : begin note <= 3; num <= num + 1; end
    692 : begin note <= 1; num <= num + 1; end
    693 : begin note <= 3; num <= num + 1; end
    694 : begin note <= 4; num <= num + 1; end
    695 : begin note <= 3; num <= num + 1; end
    696 : begin note <= 4; num <= num + 1; end
    
    //89
    697 : begin note <= 0; num <= num + 1; end
    698 : begin note <= 0; num <= num + 1; end
    699 : begin note <= 3; num <= num + 1; end
    700 : begin note <= 1; num <= num + 1; end
    701 : begin note <= 4; num <= num + 1; end
    702 : begin note <= 4; num <= num + 1; end
    703 : begin note <= 2; num <= num + 1; end
    704 : begin note <= 4; num <= num + 1; end   

    //90
    705 : begin note <= 0; num <= num + 1; end
    706 : begin note <= 1; num <= num + 1; end
    707 : begin note <= 3; num <= num + 1; end
    708 : begin note <= 1; num <= num + 1; end
    709 : begin note <= 3; num <= num + 1; end
    710 : begin note <= 4; num <= num + 1; end
    711 : begin note <= 3; num <= num + 1; end
    712 : begin note <= 4; num <= num + 1; end
    
    //91
    713 : begin note <= 0; num <= num + 1; end
    714 : begin note <= 1; num <= num + 1; end
    715 : begin note <= 3; num <= num + 1; end
    716 : begin note <= 1; num <= num + 1; end
    717 : begin note <= 3; num <= num + 1; end
    718 : begin note <= 4; num <= num + 1; end
    719 : begin note <= 3; num <= num + 1; end
    720 : begin note <= 3; num <= num + 1; end
    
    //92
    721 : begin note <= 0; num <= num + 1; end
    722 : begin note <= 1; num <= num + 1; end
    723 : begin note <= 3; num <= num + 1; end
    724 : begin note <= 1; num <= num + 1; end
    725 : begin note <= 3; num <= num + 1; end
    726 : begin note <= 4; num <= num + 1; end
    727 : begin note <= 3; num <= num + 1; end
    728 : begin note <= 4; num <= num + 1; end      

    //93
    729 : begin note <= 0; num <= num + 1; end
    730 : begin note <= 0; num <= num + 1; end
    731 : begin note <= 3; num <= num + 1; end
    732 : begin note <= 1; num <= num + 1; end
    733 : begin note <= 4; num <= num + 1; end
    734 : begin note <= 4; num <= num + 1; end
    735 : begin note <= 2; num <= num + 1; end
    736 : begin note <= 4; num <= num + 1; end

    //94
    737 : begin note <= 0; num <= num + 1; end
    738 : begin note <= 1; num <= num + 1; end
    739 : begin note <= 3; num <= num + 1; end
    740 : begin note <= 1; num <= num + 1; end
    741 : begin note <= 3; num <= num + 1; end
    742 : begin note <= 4; num <= num + 1; end
    743 : begin note <= 3; num <= num + 1; end
    744 : begin note <= 4; num <= num + 1; end
    
    //95                                      
    745 : begin note <= 0; num <= num + 1; end
    746 : begin note <= 1; num <= num + 1; end
    747 : begin note <= 3; num <= num + 1; end
    748 : begin note <= 1; num <= num + 1; end
    749 : begin note <= 3; num <= num + 1; end
    750 : begin note <= 4; num <= num + 1; end
    751 : begin note <= 3; num <= num + 1; end
    752 : begin note <= 3; num <= num + 1; end    
    
    //96                                    
    753 : begin note <= 0; num <= num + 1; end
    754 : begin note <= 1; num <= num + 1; end
    755 : begin note <= 3; num <= num + 1; end
    756 : begin note <= 1; num <= num + 1; end
    757 : begin note <= 3; num <= num + 1; end
    758 : begin note <= 4; num <= num + 1; end
    759 : begin note <= 3; num <= num + 1; end
    760 : begin note <= 4; num <= num + 1; end

    //97                                    
    761 : begin note <= 0; num <= num + 1; end
    762 : begin note <= 0; num <= num + 1; end
    763 : begin note <= 3; num <= num + 1; end
    764 : begin note <= 1; num <= num + 1; end
    765 : begin note <= 1; num <= num + 1; end
    766 : begin note <= 1; num <= num + 1; end
    767 : begin note <= 2; num <= num + 1; end
    768 : begin note <= 0; num <= num + 1; end

    //98                                     
    769 : begin note <= 0; num <= num + 1; end
    770 : begin note <= 1; num <= num + 1; end
    771 : begin note <= 3; num <= num + 1; end
    772 : begin note <= 1; num <= num + 1; end
    773 : begin note <= 3; num <= num + 1; end
    774 : begin note <= 4; num <= num + 1; end
    775 : begin note <= 3; num <= num + 1; end
    776 : begin note <= 4; num <= num + 1; end
                                              
    //99                                      
    777 : begin note <= 0; num <= num + 1; end
    778 : begin note <= 1; num <= num + 1; end
    779 : begin note <= 3; num <= num + 1; end
    780 : begin note <= 1; num <= num + 1; end
    781 : begin note <= 3; num <= num + 1; end
    782 : begin note <= 4; num <= num + 1; end
    783 : begin note <= 3; num <= num + 1; end
    784 : begin note <= 3; num <= num + 1; end
                                              
    //100                                      
    785 : begin note <= 0; num <= num + 1; end
    786 : begin note <= 1; num <= num + 1; end
    787 : begin note <= 3; num <= num + 1; end
    788 : begin note <= 1; num <= num + 1; end
    789 : begin note <= 3; num <= num + 1; end
    790 : begin note <= 4; num <= num + 1; end
    791 : begin note <= 3; num <= num + 1; end
    792 : begin note <= 4; num <= num + 1; end
                                              
    //101                                     
    793 : begin note <= 0; num <= num + 1; end
    794 : begin note <= 0; num <= num + 1; end
    795 : begin note <= 3; num <= num + 1; end
    796 : begin note <= 1; num <= num + 1; end
    797 : begin note <= 4; num <= num + 1; end
    798 : begin note <= 4; num <= num + 1; end
    799 : begin note <= 2; num <= num + 1; end
    800 : begin note <= 4; num <= num + 1; end   

    //102                                    
    801 : begin note <= 0; num <= num + 1; end
    802 : begin note <= 1; num <= num + 1; end
    803 : begin note <= 3; num <= num + 1; end
    804 : begin note <= 1; num <= num + 1; end
    805 : begin note <= 3; num <= num + 1; end
    806 : begin note <= 4; num <= num + 1; end
    807 : begin note <= 3; num <= num + 1; end
    808 : begin note <= 4; num <= num + 1; end
                                              
    //103                                     
    809 : begin note <= 0; num <= num + 1; end
    810 : begin note <= 1; num <= num + 1; end
    811 : begin note <= 3; num <= num + 1; end
    812 : begin note <= 1; num <= num + 1; end
    813 : begin note <= 3; num <= num + 1; end
    814 : begin note <= 4; num <= num + 1; end
    815 : begin note <= 3; num <= num + 1; end
    816 : begin note <= 3; num <= num + 1; end
                                              
    //104                                      
    817 : begin note <= 0; num <= num + 1; end
    818 : begin note <= 1; num <= num + 1; end
    819 : begin note <= 3; num <= num + 1; end
    820 : begin note <= 1; num <= num + 1; end
    821 : begin note <= 3; num <= num + 1; end
    822 : begin note <= 4; num <= num + 1; end
    823 : begin note <= 3; num <= num + 1; end
    824 : begin note <= 4; num <= num + 1; end
                                              
    //105                                     
    825 : begin note <= 0; num <= num + 1; end
    826 : begin note <= 0; num <= num + 1; end
    827 : begin note <= 3; num <= num + 1; end
    828 : begin note <= 1; num <= num + 1; end
    829 : begin note <= 4; num <= num + 1; end
    830 : begin note <= 4; num <= num + 1; end
    831 : begin note <= 2; num <= num + 1; end
    832 : begin note <= 4; num <= num + 1; end

    //106                                   
    833 : begin note <= 0; num <= num + 1; end
    834 : begin note <= 1; num <= num + 1; end
    835 : begin note <= 3; num <= num + 1; end
    836 : begin note <= 1; num <= num + 1; end
    837 : begin note <= 3; num <= num + 1; end
    838 : begin note <= 4; num <= num + 1; end
    839 : begin note <= 3; num <= num + 1; end
    840 : begin note <= 4; num <= num + 1; end
                                              
    //107                                     
    841 : begin note <= 0; num <= num + 1; end
    842 : begin note <= 1; num <= num + 1; end
    843 : begin note <= 3; num <= num + 1; end
    844 : begin note <= 1; num <= num + 1; end
    845 : begin note <= 3; num <= num + 1; end
    846 : begin note <= 4; num <= num + 1; end
    847 : begin note <= 3; num <= num + 1; end
    848 : begin note <= 3; num <= num + 1; end
                                              
    //108                                      
    849 : begin note <= 0; num <= num + 1; end
    850 : begin note <= 1; num <= num + 1; end
    851 : begin note <= 3; num <= num + 1; end
    852 : begin note <= 1; num <= num + 1; end
    853 : begin note <= 3; num <= num + 1; end
    854 : begin note <= 4; num <= num + 1; end
    855 : begin note <= 3; num <= num + 1; end
    856 : begin note <= 4; num <= num + 1; end
                                              
    //109                                    
    857 : begin note <= 0; num <= num + 1; end
    858 : begin note <= 0; num <= num + 1; end
    859 : begin note <= 3; num <= num + 1; end
    860 : begin note <= 1; num <= num + 1; end
    861 : begin note <= 4; num <= num + 1; end
    862 : begin note <= 4; num <= num + 1; end
    863 : begin note <= 2; num <= num + 1; end
    864 : begin note <= 4; num <= num + 1; end

    //110                                  
    865 : begin note <= 0; num <= num + 1; end
    866 : begin note <= 1; num <= num + 1; end
    867 : begin note <= 3; num <= num + 1; end
    868 : begin note <= 1; num <= num + 1; end
    869 : begin note <= 3; num <= num + 1; end
    870 : begin note <= 4; num <= num + 1; end
    871 : begin note <= 3; num <= num + 1; end
    872 : begin note <= 4; num <= num + 1; end
                                              
    //111                                     
    873 : begin note <= 0; num <= num + 1; end
    874 : begin note <= 1; num <= num + 1; end
    875 : begin note <= 3; num <= num + 1; end
    876 : begin note <= 1; num <= num + 1; end
    877 : begin note <= 3; num <= num + 1; end
    878 : begin note <= 4; num <= num + 1; end
    879 : begin note <= 3; num <= num + 1; end
    880 : begin note <= 3; num <= num + 1; end
                                              
    //112                                     
    881 : begin note <= 0; num <= num + 1; end
    882 : begin note <= 1; num <= num + 1; end
    883 : begin note <= 3; num <= num + 1; end
    884 : begin note <= 1; num <= num + 1; end
    885 : begin note <= 3; num <= num + 1; end
    886 : begin note <= 4; num <= num + 1; end
    887 : begin note <= 3; num <= num + 1; end
    888 : begin note <= 4; num <= num + 1; end
                                              
    //113                                    
    889 : begin note <= 0; num <= num + 1; end
    890 : begin note <= 0; num <= num + 1; end
    891 : begin note <= 3; num <= num + 1; end
    892 : begin note <= 1; num <= num + 1; end
    893 : begin note <= 3; num <= num + 1; end
    894 : begin note <= 1; num <= num + 1; end
    895 : begin note <= 2; num <= num + 1; end
    896 : begin note <= 0; num <= num + 1; end
    
    //114                                  
    897 : begin note <= 0; num <= num + 1; end
    898 : begin note <= 1; num <= num + 1; end
    899 : begin note <= 3; num <= num + 1; end
    900 : begin note <= 1; num <= num + 1; end
    901 : begin note <= 3; num <= num + 1; end
    902 : begin note <= 4; num <= num + 1; end
    903 : begin note <= 3; num <= num + 1; end
    904 : begin note <= 4; num <= num + 1; end
                                              
    //115                                    
    905 : begin note <= 0; num <= num + 1; end
    906 : begin note <= 1; num <= num + 1; end
    907 : begin note <= 3; num <= num + 1; end
    908 : begin note <= 1; num <= num + 1; end
    909 : begin note <= 3; num <= num + 1; end
    910 : begin note <= 4; num <= num + 1; end
    911 : begin note <= 3; num <= num + 1; end
    912 : begin note <= 3; num <= num + 1; end
                                              
    //116                                     
    913 : begin note <= 0; num <= num + 1; end
    914 : begin note <= 1; num <= num + 1; end
    915 : begin note <= 3; num <= num + 1; end
    916 : begin note <= 1; num <= num + 1; end
    917 : begin note <= 3; num <= num + 1; end
    918 : begin note <= 4; num <= num + 1; end
    919 : begin note <= 3; num <= num + 1; end
    920 : begin note <= 4; num <= num + 1; end
                                              
    //117                                    
    921 : begin note <= 0; num <= num + 1; end
    922 : begin note <= 0; num <= num + 1; end
    923 : begin note <= 3; num <= num + 1; end
    924 : begin note <= 1; num <= num + 1; end
    925 : begin note <= 3; num <= num + 1; end
    926 : begin note <= 1; num <= num + 1; end
    927 : begin note <= 2; num <= num + 1; end
    928 : begin note <= 0; num <= num + 1; end    
        
    default : begin note <= 4; num <= num + 1; end
    endcase    
end
else if (mode == `sel_song1 | mode == `sel_song2) begin note <= 4; num <= 10; end
else if (mode == `play1_ps | mode == `play2_ps) begin note <= note; num <= num; end
else begin note <= note; num <= num; end

always@*
if (mode == `play1 & num == 770) ending_sign = 1;
else if (mode == `play2 & num == 950) ending_sign = 1;
else ending_sign = 0;

always@* 
if (position1 == 1 | position2 == 1 | position3 == 1 | position4 == 1 | position5 == 1 | position6 == 1 | 
    position7 == 1 | position8 == 1 | position9 == 1)
    start_sign = 1;
else 
    start_sign = 0;

always@(posedge clk_320hz or posedge rst)
    if (rst) 
    begin
        out1 <= 0;
        out2 <= 0;
        out3 <= 0;
        out4 <= 0;
        out5 <= 0;
        out6 <= 0;
        out7 <= 0;
        out8 <= 0;
        out9 <= 0;
    end
    else if (mode == `sel_song1)
    begin
        out1 <= 4;
        out2 <= 4;
        out3 <= 4;
        out4 <= 4;
        out5 <= 4;
        out6 <= 4;
        out7 <= 4;
        out8 <= 4;
        out9 <= 4;
    end
    else if (mode == `sel_song2)
    begin
        out1 <= 4;
        out2 <= 4;
        out3 <= 4;
        out4 <= 4;
        out5 <= 4;
        out6 <= 4;
        out7 <= 4;
        out8 <= 4;
        out9 <= 4;
    end
    else
    begin
        if (position1 == 0) out1 <= note;
        else if (position2 == 0) out2 <= note;
        else if (position3 == 0) out3 <= note;
        else if (position4 == 0) out4 <= note;
        else if (position5 == 0) out5 <= note;
        else if (position6 == 0) out6 <= note;
        else if (position7 == 0) out7 <= note;
        else if (position8 == 0) out8 <= note;
        else if (position9 == 0) out9 <= note;        
    end

//FSM for beat_jd
reg [1:0] beat_jd_next;
reg check;
reg check_next;

always@*
begin
    if (mode == `play1 | mode == `play2)
    begin
        if (check == 0) 
        begin
            check_next = 1;
            if (position1 >= 2 & position1 <= 40 & (out_d == 1 | out_f ==1 | out_j == 1 | out_k == 1))
            begin
                if (out1 == 0)
                   if (out_d == 1 & out_k == 1) beat_jd_next = 1;
                   else beat_jd_next = 0;
                else if (out1 == 1)
                   if (out_d == 1 ^ out_k == 1) beat_jd_next = 1;
                   else beat_jd_next = 0;
                else if (out1 == 2)
                   if (out_f == 1 & out_j == 1) beat_jd_next = 1;
                   else beat_jd_next = 0;
                else if (out1 == 3)
                   if (out_f == 1 ^ out_j == 1) beat_jd_next = 1;
                   else beat_jd_next = 0;
                else check_next = 0; 
            end
            else if (position2 >= 2 & position2 <= 40 & (out_d == 1 | out_f ==1 | out_j == 1 | out_k == 1))
            begin
                if (out2 == 0)
                    if (out_d == 1 & out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out2 == 1)
                    if (out_d == 1 ^ out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out2 == 2)
                    if (out_f == 1 & out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out2 == 3)
                    if (out_f == 1 ^ out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else check_next = 0; 
            end
            else if (position3 >= 2 & position3 <= 40 & (out_d == 1 | out_f ==1 | out_j == 1 | out_k == 1))
            begin
                if (out3 == 0)
                    if (out_d == 1 & out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out3 == 1)
                    if (out_d == 1 ^ out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out3 == 2)
                    if (out_f == 1 & out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out3 == 3)
                    if (out_f == 1 ^ out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else check_next = 0; 
            end
            else if (position4 >= 2 & position4 <= 40 & (out_d == 1 | out_f ==1 | out_j == 1 | out_k == 1))
            begin
                if (out4 == 0)
                    if (out_d == 1 & out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out4 == 1)
                    if (out_d == 1 ^ out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out4 == 2)
                    if (out_f == 1 & out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out4 == 3)
                    if (out_f == 1 ^ out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else check_next = 0; 
            end
            else if (position5 >= 2 & position5 <= 40 & (out_d == 1 | out_f ==1 | out_j == 1 | out_k == 1))
            begin
                if (out5 == 0)
                    if (out_d == 1 & out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out5 == 1)
                    if (out_d == 1 ^ out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out5 == 2)
                    if (out_f == 1 & out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out5 == 3)
                    if (out_f == 1 ^ out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else check_next = 0; 
            end
            else if (position6 >= 2 & position6 <= 40 & (out_d == 1 | out_f ==1 | out_j == 1 | out_k == 1))
            begin
                if (out6 == 0)
                    if (out_d == 1 & out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out6 == 1)
                    if (out_d == 1 ^ out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out6 == 2)
                    if (out_f == 1 & out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out6 == 3)
                    if (out_f == 1 ^ out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else check_next = 0;
            end 
            else if (position7 >= 2 & position7 <= 40 & (out_d == 1 | out_f ==1 | out_j == 1 | out_k == 1))
            begin
                if (out7 == 0)
                    if (out_d == 1 & out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out7 == 1)
                    if (out_d == 1 ^ out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out7 == 2)
                    if (out_f == 1 & out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out7 == 3)
                    if (out_f == 1 ^ out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else check_next = 0;
            end
            else if (position8 >= 2 & position8 <= 40 & (out_d == 1 | out_f ==1 | out_j == 1 | out_k == 1))
            begin
                if (out8 == 0)
                    if (out_d == 1 & out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out8 == 1)
                    if (out_d == 1 ^ out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out8 == 2)
                    if (out_f == 1 & out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out8 == 3)
                    if (out_f == 1 ^ out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else check_next = 0;
            end
            else if (position9 >= 2 & position9 <= 40 & (out_d == 1 | out_f ==1 | out_j == 1 | out_k == 1))
            begin
                if (out9 == 0)
                    if (out_d == 1 & out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out9 == 1)
                    if (out_d == 1 ^ out_k == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out9 == 2)
                    if (out_f == 1 & out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else if (out9 == 3)
                    if (out_f == 1 ^ out_j == 1) beat_jd_next = 1;
                    else beat_jd_next = 0;
                else check_next = 0;
            end
            else check_next = 0;
        end
        else
        begin
            if (position1 == 1 | position2 == 1 | position3 == 1 | position4 == 1 | position5 == 1 | position6 == 1 |
                position7 == 1 | position8 == 1 | position9 == 1 )
                check_next = 0; 
            else check_next = 1;
        end
    end
end

always@(posedge clk_320hz or posedge rst)
if (rst)
begin
    check <= 0;
    beat_jd <= 0;
end
else
begin
    check <= check_next;
    beat_jd <= beat_jd_next;
end

//score counting
always@(posedge clk_320hz or posedge rst)
if (rst)
begin
    good <= 0;
    bad <= 0;
    rate <= 0;
    score <= 0;
    combo <= 0;
    combo_bt <= 0;
    note_num <= 0;
end
else if (mode == `sel_song1 | mode == `sel_song2)
begin
    good <= 0;
    bad <= 0;
    rate <= 0;
    score <= 0;
    combo <= 0;
    combo_bt <= 0;
    note_num <= 0;
end
else
begin    
    if (position1 == 2 | position2 == 2 | position3 == 2 | position4 == 2 | position5 == 2 | position6 == 2 | position7 == 2 | position8 == 2 | position9 == 2)
    begin
        if (position1 == 2)
        begin
            if (out1 != 4) 
            begin
                note_num <= note_num + 1;
                if (check == 1)
                begin
                    if (beat_jd == 1)
                    begin
                        good <= good + 1;
                        combo <= combo + 1;
                        score =  score + combo * 2 + (beat_jd == 1) * 10;
                    end
                    else
                    begin
                        bad <= bad + 1;
                        combo <= 0;
                        score = score + (beat_jd == 0) * 1 + (beat_jd == 1) * 10 + combo * 2;
                    end
                end
                else
                begin
                    combo <= 0;
                end
                if (note_num != 0) rate = good*100 / note_num;
                else rate = 0;
            end
        end
        else if (position2 == 2)
        begin
            if (out2 != 4) 
            begin
                note_num <= note_num + 1;
                if (check == 1)
                begin
                    if (beat_jd == 1)
                    begin
                        good <= good + 1;
                        combo <= combo + 1;
                        score =  score + combo * 2 + (beat_jd == 1) * 10;
                    end
                    else
                    begin
                        bad <= bad + 1;
                        combo <= 0;
                        score = score + (beat_jd == 0) * 1 + (beat_jd == 1) * 10 + combo * 2;
                    end
                end
                else
                begin
                    combo <= 0;
                end
                if (note_num != 0) rate = good*100 / note_num;
                else rate = 0;
            end
        end
        else if (position3 == 2)
        begin
            if (out3 != 4) 
            begin
                note_num <= note_num + 1;
                if (check == 1)
                begin
                    if (beat_jd == 1)
                    begin
                        good <= good + 1;
                        combo <= combo + 1;
                        score =  score + combo * 2 + (beat_jd == 1) * 10;
                    end
                    else
                    begin
                        bad <= bad + 1;
                        combo <= 0;
                        score = score + (beat_jd == 0) * 1 + (beat_jd == 1) * 10 + combo * 2;
                    end
                end
                else
                begin
                    combo <= 0;
                end
                if (note_num != 0) rate = good*100 / note_num;
                else rate = 0;
            end
        end
        else if (position4 == 2)
        begin
            if (out4 != 4) 
            begin
                note_num <= note_num + 1;
                if (check == 1)
                begin
                    if (beat_jd == 1)
                    begin
                        good <= good + 1;
                        combo <= combo + 1;
                        score =  score + combo * 2 + (beat_jd == 1) * 10;
                    end
                    else
                    begin
                        bad <= bad + 1;
                        combo <= 0;
                        score = score + (beat_jd == 0) * 1 + (beat_jd == 1) * 10 + combo * 2;
                    end
                end
                else
                begin
                    combo <= 0;
                end
                if (note_num != 0) rate = good*100 / note_num;
                else rate = 0;
            end
        end
        else if (position5 == 2)
        begin
            if (out5 != 4) 
            begin
                note_num <= note_num + 1;
                if (check == 1)
                begin
                    if (beat_jd == 1)
                    begin
                        good <= good + 1;
                        combo <= combo + 1;
                        score =  score + combo * 2 + (beat_jd == 1) * 10;
                    end
                    else
                    begin
                        bad <= bad + 1;
                        combo <= 0;
                        score = score + (beat_jd == 0) * 1 + (beat_jd == 1) * 10 + combo * 2;
                    end
                end
                else
                begin
                    combo <= 0;
                end
                if (note_num != 0) rate = good*100 / note_num;
                else rate = 0;
            end
        end
        else if (position6 == 2)
        begin
            if (out6 != 4) 
            begin
                note_num <= note_num + 1;
                if (check == 1)
                begin
                    if (beat_jd == 1)
                    begin
                        good <= good + 1;
                        combo <= combo + 1;
                        score =  score + combo * 2 + (beat_jd == 1) * 10;
                    end
                    else
                    begin
                        bad <= bad + 1;
                        combo <= 0;
                        score = score + (beat_jd == 0) * 1 + (beat_jd == 1) * 10 + combo * 2;
                    end
                end
                else
                begin
                    combo <= 0;
                end
                if (note_num != 0) rate = good*100 / note_num;
                else rate = 0;
            end
        end
        else if (position7 == 2)
        begin
            if (out7 != 4) 
            begin
                note_num <= note_num + 1;
                if (check == 1)
                begin
                    if (beat_jd == 1)
                    begin
                        good <= good + 1;
                        combo <= combo + 1;
                        score =  score + combo * 2 + (beat_jd == 1) * 10;
                    end
                    else
                    begin
                        bad <= bad + 1;
                        combo <= 0;
                        score = score + (beat_jd == 0) * 1 + (beat_jd == 1) * 10 + combo * 2;
                    end
                end
                else
                begin
                    combo <= 0;
                end
                if (note_num != 0) rate = good*100 / note_num;
                else rate = 0;
            end
        end
        else if (position8 == 2)
        begin
            if (out8 != 4) 
            begin
                note_num <= note_num + 1;
                if (check == 1)
                begin
                    if (beat_jd == 1)
                    begin
                        good <= good + 1;
                        combo <= combo + 1;
                        score =  score + combo * 2 + (beat_jd == 1) * 10;
                    end
                    else
                    begin
                        bad <= bad + 1;
                        combo <= 0;
                        score = score + (beat_jd == 0) * 1 + (beat_jd == 1) * 10 + combo * 2;
                    end
                end
                else
                begin
                    combo <= 0;
                end
                if (note_num != 0) rate = good*100 / note_num;
                else rate = 0;
            end
        end
        else if (position9 == 2)
        begin
            if (out9 != 4) 
            begin
                note_num <= note_num + 1;
                if (check == 1)
                begin
                    if (beat_jd == 1)
                    begin
                        good <= good + 1;
                        combo <= combo + 1;
                        score =  score + combo * 2 + (beat_jd == 1) * 10;
                    end
                    else
                    begin
                        bad <= bad + 1;
                        combo <= 0;
                        score = score + (beat_jd == 0) * 1 + (beat_jd == 1) * 10 + combo * 2;
                    end
                end
                else
                begin
                    combo <= 0;
                end
                if (note_num != 0) rate = good*100 / note_num;
                else rate = 0;
            end
        end
    end
    
    if (combo >= combo_bt) combo_bt <= combo;
    if (rate >= 80) grade <=  `S;
    else if (rate >= 70) grade <= `A;
    else if (rate >= 60) grade <= `B;
    else if (rate >= 50) grade <= `C;
    else grade <= `D;
end

//pixel address
always@*
begin
    if (rst) sign = 0; 
    if (mode == `sel_song1)
    begin
        sign = 0;
        if (((v_cnt>>1) < 50) | ((v_cnt>>1) >= 190 | (h_cnt>>1) < 60 | (h_cnt>>1) >= 260)) pixel_addr = 76800;
        else
        begin
            if ((h_cnt>>1) >= 80 & (h_cnt>>1) < 140 & (v_cnt>>1) >= 100 & (v_cnt>>1) < 120)
                pixel_addr = ((h_cnt>>1) - 80) + 320*((v_cnt>>1) + 20);
            else if ((h_cnt>>1) >= 180 & (h_cnt>>1) < 240 & (v_cnt>>1) >= 110 & (v_cnt>>1) < 130)
                pixel_addr = ((h_cnt>>1) - 180) + 320*((v_cnt>>1) + 30);
            else if ((h_cnt>>1) >= 90 & (h_cnt>>1) < 130 & (v_cnt>>1) >= 55 & (v_cnt>>1) <= 95)
                pixel_addr = ((h_cnt>>1) + 70) + 320*((v_cnt>>1) - 55);
            else pixel_addr = 0;
        end
    end
    
    else if (mode == `sel_song2)
    begin
        sign = 0;
        if (((v_cnt>>1) < 50) | ((v_cnt>>1) >= 190 | (h_cnt>>1) < 60 | (h_cnt>>1) >= 260)) pixel_addr = 76800;
        else
        begin
            if ((h_cnt>>1) >= 80 & (h_cnt>>1) < 140 & (v_cnt>>1) >= 110 & (v_cnt>>1) < 130)
                pixel_addr = ((h_cnt>>1) - 80) + 320*((v_cnt>>1) + 10);
            else if ((h_cnt>>1) >= 180 & (h_cnt>>1) < 240 & (v_cnt>>1) >= 100 & (v_cnt>>1) < 120)
                pixel_addr = ((h_cnt>>1) - 180) + 320*((v_cnt>>1) + 40); 
            else if ((h_cnt>>1) >= 190 & (h_cnt>>1) < 230 & (v_cnt>>1) >= 55 & (v_cnt>>1) <= 95)
                pixel_addr = ((h_cnt>>1) - 30) + 320*((v_cnt>>1) - 55);           
            else pixel_addr = 0;
        end
    end
    
    else if(mode == `ending)
    begin
        if (((v_cnt>>1) < 60) | ((v_cnt>>1) >= 180 | (h_cnt>>1) < 30 | (h_cnt>>1) >= 290)) pixel_addr = 76800;
        else
        begin
            if ((v_cnt>>1) >= 60 & (v_cnt>>1)< 80) 
            begin
                if ((h_cnt>>1) >= 174 & (h_cnt>>1) < 186 & (v_cnt>>1) >= 64 & (v_cnt>>1) < 76)
                begin
                    if (score < 100000) pixel_addr = (h_cnt>>1) + 10 + 320*((v_cnt>>1) + 160);
                    else 
                    begin
                        case (score/100000)
                        1 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 160);
                        2 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 160);
                        3 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 160);
                        4 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 160);
                        5 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 160);
                        6 : pixel_addr = (h_cnt>>1) -  70 + 320*((v_cnt>>1) + 160);
                        7 : pixel_addr = (h_cnt>>1) -  50 + 320*((v_cnt>>1) + 160);
                        8 : pixel_addr = (h_cnt>>1) -  30 + 320*((v_cnt>>1) + 160);
                        9 : pixel_addr = (h_cnt>>1) -  10 + 320*((v_cnt>>1) + 160);
                        endcase
                    end
                end
                else if ((h_cnt>>1) >= 194 & (h_cnt>>1) < 206 & (v_cnt>>1) >= 64 & (v_cnt>>1) < 76)
                begin
                    if (score%100000 < 10000) pixel_addr = (h_cnt>>1) - 10 + 320*((v_cnt>>1) + 160);
                    else 
                    begin
                        case (score%100000/10000)
                        1 : pixel_addr = (h_cnt>>1)  - 190  + 320*((v_cnt>>1) + 160);
                        2 : pixel_addr = (h_cnt>>1)  - 170  + 320*((v_cnt>>1) + 160);
                        3 : pixel_addr = (h_cnt>>1)  - 150  + 320*((v_cnt>>1) + 160);
                        4 : pixel_addr = (h_cnt>>1)  - 130  + 320*((v_cnt>>1) + 160);
                        5 : pixel_addr = (h_cnt>>1)  - 110  + 320*((v_cnt>>1) + 160);
                        6 : pixel_addr = (h_cnt>>1)  -  90  + 320*((v_cnt>>1) + 160);
                        7 : pixel_addr = (h_cnt>>1)  -  70  + 320*((v_cnt>>1) + 160);
                        8 : pixel_addr = (h_cnt>>1)  -  50  + 320*((v_cnt>>1) + 160);
                        9 : pixel_addr = (h_cnt>>1)  -  30  + 320*((v_cnt>>1) + 160);
                        endcase
                    end
                end            
                else if ((h_cnt>>1) >= 214 & (h_cnt>>1) < 226 & (v_cnt>>1) >= 64 & (v_cnt>>1) < 76)
                begin
                    if (score%10000 < 1000) pixel_addr = (h_cnt>>1) - 30 + 320*((v_cnt>>1) + 160);
                    else 
                    begin
                        case (score%10000/1000)
                        1 : pixel_addr = (h_cnt>>1)  - 210 + 320*((v_cnt>>1) + 160);
                        2 : pixel_addr = (h_cnt>>1)  - 190 + 320*((v_cnt>>1) + 160);
                        3 : pixel_addr = (h_cnt>>1)  - 170 + 320*((v_cnt>>1) + 160);
                        4 : pixel_addr = (h_cnt>>1)  - 150 + 320*((v_cnt>>1) + 160);
                        5 : pixel_addr = (h_cnt>>1)  - 130 + 320*((v_cnt>>1) + 160);
                        6 : pixel_addr = (h_cnt>>1)  - 110 + 320*((v_cnt>>1) + 160);
                        7 : pixel_addr = (h_cnt>>1)  -  90 + 320*((v_cnt>>1) + 160);
                        8 : pixel_addr = (h_cnt>>1)  -  70 + 320*((v_cnt>>1) + 160);
                        9 : pixel_addr = (h_cnt>>1)  -  50 + 320*((v_cnt>>1) + 160);
                        endcase
                    end
                end             
                else if ((h_cnt>>1) >= 234 & (h_cnt>>1) < 246 & (v_cnt>>1) >= 64 & (v_cnt>>1) < 76)
                begin
                    if (score%1000 < 100) pixel_addr = (h_cnt>>1) - 50 + 320*((v_cnt>>1) + 160);
                    else 
                    begin
                        case (score%1000/100)
                        1 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 160);
                        2 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 160);
                        3 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 160);
                        4 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 160);
                        5 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 160);
                        6 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 160);
                        7 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 160);
                        8 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 160);
                        9 : pixel_addr = (h_cnt>>1) -  70 + 320*((v_cnt>>1) + 160);
                        endcase
                    end
                end
                else if ((h_cnt>>1) >= 254 & (h_cnt>>1) < 266 & (v_cnt>>1) >= 64 & (v_cnt>>1) < 76)
                begin
                    if (score%100 < 10) pixel_addr = (h_cnt>>1) - 70 + 320*((v_cnt>>1) + 160);
                    else 
                    begin
                        case (score%100/10)
                        1 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 160);
                        2 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 160);
                        3 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 160);
                        4 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 160);
                        5 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 160);
                        6 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 160);
                        7 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 160);
                        8 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 160);
                        9 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 160);
                        endcase
                    end
                end
                else if ((h_cnt>>1) >= 274 & (h_cnt>>1) < 286 & (v_cnt>>1) >= 64 & (v_cnt>>1) < 76)
                begin
                    if (score%10 < 1) pixel_addr = (h_cnt>>1)  - 90 + 320*((v_cnt>>1) + 160);
                    else 
                    begin
                        case (score%10/1)
                        1 : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 160);
                        2 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 160);
                        3 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 160);
                        4 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 160);
                        5 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 160);
                        6 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 160);
                        7 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 160);
                        8 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 160);
                        9 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 160);
                        endcase
                    end
                end      
                else pixel_addr = (h_cnt>>1) + 30 + 320*((v_cnt>>1) + 20);
            end
            
            else if ((v_cnt>>1) >= 80 & (v_cnt>>1)< 100)
            begin
                if ((h_cnt>>1) >= 274 & (h_cnt>>1) < 286 & (v_cnt>>1) >= 84 & (v_cnt>>1) < 96)
                begin
                    case (grade)
                    `A : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 120);
                    `B : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 120);
                    `C : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 120);
                    `D : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 120);
                    `S : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 120);
                    endcase
                end
                else pixel_addr = (h_cnt>>1) + 30 + 320*((v_cnt>>1) + 20);                
           end      
           
           else if ((v_cnt>>1) >= 100 & (v_cnt>>1)< 120)
           begin     
                if ((h_cnt>>1) >= 234 & (h_cnt>>1) < 246 & (v_cnt>>1) >= 104 & (v_cnt>>1) < 116)
                begin
                    if (combo_bt < 100) pixel_addr = (h_cnt>>1) - 50 + 320*((v_cnt>>1) + 120);
                    else 
                    begin
                        case (combo_bt/100)
                        1 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 120);
                        2 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 120);
                        3 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 120);
                        4 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 120);
                        5 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 120);
                        6 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 120);
                        7 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 120);
                        8 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 120);
                        9 : pixel_addr = (h_cnt>>1) -  70 + 320*((v_cnt>>1) + 120);
                        endcase
                    end 
                end
                else if ((h_cnt>>1) >= 254 & (h_cnt>>1) < 266 & (v_cnt>>1) >= 104 & (v_cnt>>1) < 116)
                begin
                    if (combo_bt%100 < 10) pixel_addr = (h_cnt>>1) - 70 + 320*((v_cnt>>1) + 120);
                    else 
                    begin
                        case (combo_bt%100/10)
                        1 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 120);
                        2 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 120);
                        3 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 120);
                        4 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 120);
                        5 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 120);
                        6 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 120);
                        7 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 120);
                        8 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 120);
                        9 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 120);
                        endcase
                    end 
                end
                else if ((h_cnt>>1) >= 274 & (h_cnt>>1) < 286 & (v_cnt>>1) >= 104 & (v_cnt>>1) < 116)
                begin
                    if (combo_bt%10 < 1) pixel_addr = (h_cnt>>1) - 90 + 320*((v_cnt>>1) + 120);
                    else 
                    begin
                        case (combo_bt%10/1)
                        1 : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 120);
                        2 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 120);
                        3 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 120);
                        4 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 120);
                        5 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 120);
                        6 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 120);
                        7 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 120);
                        8 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 120);
                        9 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 120);
                        default : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 120);
                        endcase
                    end 
                end
                else pixel_addr = (h_cnt>>1) + 30 + 320*((v_cnt>>1) + 20); 
            end
            
            else if ((v_cnt>>1) >= 120 & (v_cnt>>1)< 140)
            begin
                if ((h_cnt>>1) >= 234 & (h_cnt>>1) < 246 & (v_cnt>>1) >= 124 & (v_cnt>>1) < 136)
                begin
                    if (good < 100) pixel_addr = (h_cnt>>1) - 50 + 320*((v_cnt>>1) + 100);
                    else 
                    begin
                        case (good/100)
                        1 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 100);
                        2 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 100);
                        3 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 100);
                        4 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 100);
                        5 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 100);
                        6 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 100);
                        7 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 100);
                        8 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 100);
                        9 : pixel_addr = (h_cnt>>1) -  70 + 320*((v_cnt>>1) + 100);
                        endcase
                    end 
                end
                else if ((h_cnt>>1) >= 254 & (h_cnt>>1) < 266 & (v_cnt>>1) >= 124 & (v_cnt>>1) < 136)
                begin
                    if (good%100 < 10) pixel_addr = (h_cnt>>1) - 70 + 320*((v_cnt>>1) + 100);
                    else 
                    begin
                        case (good%100/10)
                        1 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 100);
                        2 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 100);
                        3 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 100);
                        4 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 100);
                        5 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 100);
                        6 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 100);
                        7 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 100);
                        8 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 100);
                        9 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 100);
                        endcase
                    end 
                end
                else if ((h_cnt>>1) >= 274 & (h_cnt>>1) < 286 & (v_cnt>>1) >= 124 & (v_cnt>>1) < 136)
                begin
                    if (good%10 < 1) pixel_addr = (h_cnt>>1) - 90 + 320*((v_cnt>>1) + 100);
                    else 
                    begin
                        case (good%10/1)
                        1 : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 100);
                        2 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 100);
                        3 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 100);
                        4 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 100);
                        5 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 100);
                        6 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 100);
                        7 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 100);
                        8 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 100);
                        9 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 100);
                        endcase
                    end 
                end
                else pixel_addr = (h_cnt>>1) + 30 + 320*((v_cnt>>1) + 20);
            end
            
            else if ((v_cnt>>1) >= 140 & (v_cnt>>1)< 160)
            begin
                if ((h_cnt>>1) >= 234 & (h_cnt>>1) < 246 & (v_cnt>>1) >= 144 & (v_cnt>>1) < 156)
                begin
                    if (bad < 100) pixel_addr = (h_cnt>>1) - 50 + 320*((v_cnt>>1) + 80);
                    else 
                    begin
                        case (bad/100)
                        1 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 80);
                        2 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 80);
                        3 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 80);
                        4 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 80);
                        5 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 80);
                        6 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 80);
                        7 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 80);
                        8 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 80);
                        9 : pixel_addr = (h_cnt>>1) -  70 + 320*((v_cnt>>1) + 80);
                        endcase
                    end 
                end
                else if ((h_cnt>>1) >= 254 & (h_cnt>>1) < 266 & (v_cnt>>1) >= 144 & (v_cnt>>1) < 156)
                begin
                    if (bad%100 < 10) pixel_addr = (h_cnt>>1) - 70 + 320*((v_cnt>>1) + 80);
                    else 
                    begin
                        case (bad%100/10)
                        1 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 80);
                        2 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 80);
                        3 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 80);
                        4 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 80);
                        5 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 80);
                        6 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 80);
                        7 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 80);
                        8 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 80);
                        9 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 80);
                        endcase
                    end 
                end
                else if ((h_cnt>>1) >= 274 & (h_cnt>>1) < 286 & (v_cnt>>1) >= 144 & (v_cnt>>1) < 156)
                begin
                    if (bad%10 < 1) pixel_addr = (h_cnt>>1) - 90 + 320*((v_cnt>>1) + 80);
                    else 
                    begin
                        case (bad%10/1)
                        1 : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 80);
                        2 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 80);
                        3 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 80);
                        4 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 80);
                        5 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 80);
                        6 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 80);
                        7 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 80);
                        8 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 80);
                        9 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 80);
                        endcase
                    end 
                end
                else pixel_addr = (h_cnt>>1) + 30 + 320*((v_cnt>>1) + 20);                
            end
            
            else if ((v_cnt>>1) >= 160 & (v_cnt>>1)< 180)
            begin
                if ((h_cnt>>1) >= 214 & (h_cnt>>1) < 226 & (v_cnt>>1) >= 164 & (v_cnt>>1) < 176)
                begin
                    if (rate < 100) pixel_addr = (h_cnt>>1) - 30 + 320*((v_cnt>>1) + 60);
                    else 
                    begin
                        case (rate)
                        100 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 60);
                        endcase
                    end 
                end            
                else if ((h_cnt>>1) >= 234 & (h_cnt>>1) < 246 & (v_cnt>>1) >= 164 & (v_cnt>>1) < 176)
                begin
                    if (rate%100 < 10) pixel_addr = (h_cnt>>1) - 50 + 320*((v_cnt>>1) + 60);
                    else 
                    begin
                        case (rate%100/10)
                        1 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 60);
                        2 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 60);
                        3 : pixel_addr = (h_cnt>>1) - 180 + 320*((v_cnt>>1) + 60);
                        4 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 60);
                        5 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 60);
                        6 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 60);
                        7 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 60);
                        8 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 60);
                        9 : pixel_addr = (h_cnt>>1) -  70 + 320*((v_cnt>>1) + 60);
                        endcase
                    end 
                end            
                else if ((h_cnt>>1) >= 254 & (h_cnt>>1) < 266 & (v_cnt>>1) >= 164 & (v_cnt>>1) < 176)
                begin
                    if (rate%10 < 1) pixel_addr = (h_cnt>>1) - 70 + 320*((v_cnt>>1) + 60);
                    else 
                    begin
                        case (rate%10/1)
                        1 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 60);
                        2 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 60);
                        3 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 60);
                        4 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 60);
                        5 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 60);
                        6 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 60);
                        7 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 60);
                        8 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 60);
                        9 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 60);
                        endcase
                    end 
                end
                else pixel_addr = (h_cnt>>1) + 30 + 320*((v_cnt>>1) + 20);
            end
        end
    end
        
    else if (mode == `play1_ps | mode == `play2_ps)
    begin
        if (((v_cnt>>1) < 50) | ((v_cnt>>1) >= 190 | (h_cnt>>1) < 60 | (h_cnt>>1) >= 260)) pixel_addr = 76800;
        else
        begin
            if ((h_cnt>>1) >= 80 & (h_cnt>>1) < 140 & (v_cnt>>1) >= 100 & (v_cnt>>1) < 120)
                pixel_addr = ((h_cnt>>1) - 80) + 320*((v_cnt>>1) - 20);
            else if ((h_cnt>>1) >= 180 & (h_cnt>>1) < 240 & (v_cnt>>1) >= 110 & (v_cnt>>1) < 130)
                pixel_addr = ((h_cnt>>1) - 180) + 320*((v_cnt>>1) - 10); 
            else if ((h_cnt>>1) >= 90 & (h_cnt>>1) < 130 & (v_cnt>>1) >= 55 & (v_cnt>>1) <= 95)
                pixel_addr = ((h_cnt>>1) + 70) + 320*((v_cnt>>1) - 55);           
            else pixel_addr = 0;
        end
    end
    
    else if (mode == `play1_pm | mode == `play2_pm)
    begin
        if (((v_cnt>>1) < 50) | ((v_cnt>>1) >= 190 | (h_cnt>>1) < 60 | (h_cnt>>1) >= 260)) pixel_addr = 76800;
        else
        begin
            if ((h_cnt>>1) >= 80 & (h_cnt>>1) < 140 & (v_cnt>>1) >= 110 & (v_cnt>>1) < 130)
                pixel_addr = ((h_cnt>>1) - 80) + 320*((v_cnt>>1) - 30);
            else if ((h_cnt>>1) >= 180 & (h_cnt>>1) < 240 & (v_cnt>>1) >= 100 & (v_cnt>>1) < 120)
                pixel_addr = ((h_cnt>>1) - 180) + 320*((v_cnt>>1) - 0);            
            else if ((h_cnt>>1) >= 190 & (h_cnt>>1) < 230 & (v_cnt>>1) >= 55 & (v_cnt>>1) <= 95)
                    pixel_addr = ((h_cnt>>1) - 30) + 320*((v_cnt>>1) - 55); 
            else pixel_addr = 0;
        end
    end
    
    else if (mode == `play1 | mode == `play2)
    begin
    
    //judge place mark
    if ((v_cnt>>1) >= 12 & (v_cnt>>1) < 84 & (h_cnt>>1) >= 0 & (h_cnt>>1) < 40) pixel_addr = ((h_cnt>>1) + 279) + 320*((v_cnt>>1) -12);
    
    //score , combo , rate  board
    else if ((v_cnt>>1) >= 18 & (v_cnt>>1) < 78 & (h_cnt>>1) >= 50 & (h_cnt>>1) < 310)
    begin    
        if ((v_cnt>>1) >= 18 & (v_cnt>>1) < 38) 
        begin
            if ((h_cnt>>1) >= 194 & (h_cnt>>1) < 206 & (v_cnt>>1) >= 22 & (v_cnt>>1) < 34)
            begin
                if (score < 100000) pixel_addr = (h_cnt>>1) - 10 + 320*((v_cnt>>1) + 200);
                else 
                begin
                    case (score/100000)
                    1 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 200);
                    2 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 200);
                    3 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 200);
                    4 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 200);
                    5 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 200);
                    6 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 200);
                    7 : pixel_addr = (h_cnt>>1) -  70 + 320*((v_cnt>>1) + 200);
                    8 : pixel_addr = (h_cnt>>1) -  50 + 320*((v_cnt>>1) + 200);
                    9 : pixel_addr = (h_cnt>>1) -  30 + 320*((v_cnt>>1) + 200);
                    endcase
                end
            end
            else if ((h_cnt>>1) >= 214 & (h_cnt>>1) < 226 & (v_cnt>>1) >= 22 & (v_cnt>>1) < 34)
            begin
                if (score%100000 < 10000) pixel_addr = (h_cnt>>1) - 30 + 320*((v_cnt>>1) + 200);
                else 
                begin
                    case (score%100000/10000)
                    1 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 200);
                    2 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 200);
                    3 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 200);
                    4 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 200);
                    5 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 200);
                    6 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 200);
                    7 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 200);
                    8 : pixel_addr = (h_cnt>>1) -  70 + 320*((v_cnt>>1) + 200);
                    9 : pixel_addr = (h_cnt>>1) -  50 + 320*((v_cnt>>1) + 200);
                    endcase
                end
            end            
            else if ((h_cnt>>1) >= 234 & (h_cnt>>1) < 246 & (v_cnt>>1) >= 22 & (v_cnt>>1) < 34)
            begin
                if (score%10000 < 1000) pixel_addr = (h_cnt>>1) - 50 + 320*((v_cnt>>1) + 200);
                else 
                begin
                    case (score%10000/1000)
                    1 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 200);
                    2 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 200);
                    3 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 200);
                    4 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 200);
                    5 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 200);
                    6 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 200);
                    7 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 200);
                    8 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 200);
                    9 : pixel_addr = (h_cnt>>1) -  70 + 320*((v_cnt>>1) + 200);
                    endcase
                end
            end             
            else if ((h_cnt>>1) >= 254 & (h_cnt>>1) < 266 & (v_cnt>>1) >= 22 & (v_cnt>>1) < 34)
            begin
                if (score%1000 < 100) pixel_addr = (h_cnt>>1) - 70 + 320*((v_cnt>>1) + 200);
                else 
                begin
                    case (score%1000/100)
                    1 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 200);
                    2 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 200);
                    3 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 200);
                    4 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 200);
                    5 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 200);
                    6 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 200);
                    7 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 200);
                    8 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 200);
                    9 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 200);
                    endcase
                end
            end
            else if ((h_cnt>>1) >= 274 & (h_cnt>>1) < 286 & (v_cnt>>1) >= 22 & (v_cnt>>1) < 34)
            begin
                if (score%100 < 10) pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 200);
                else 
                begin
                    case (score%100/10)
                    1 : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 200);
                    2 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 200);
                    3 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 200);
                    4 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 200);
                    5 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 200);
                    6 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 200);
                    7 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 200);
                    8 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 200);
                    9 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 200);
                    endcase
                end
            end
            else if ((h_cnt>>1) >= 294 & (h_cnt>>1) < 306 & (v_cnt>>1) >= 22 & (v_cnt>>1) < 34)
            begin
                if (score%10 < 1) pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 200);
                else 
                begin
                    case (score%10/1)
                    1 : pixel_addr = (h_cnt>>1) - 290 + 320*((v_cnt>>1) + 200);
                    2 : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 200);
                    3 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 200);
                    4 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 200);
                    5 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 200);
                    6 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 200);
                    7 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 200);
                    8 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 200);
                    9 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 200);
                    endcase
                end
            end
            else pixel_addr = (h_cnt>>1) + 10 + 320*((v_cnt>>1) + 62);
        end
        else if ((v_cnt>>1) >= 38 & (v_cnt>>1) < 58) 
        begin
            if ((h_cnt>>1) >= 254 & (h_cnt>>1) < 266 & (v_cnt>>1) >= 42 & (v_cnt>>1) < 54)
            begin
                if (combo < 100) pixel_addr = (h_cnt>>1) - 70 + 320*((v_cnt>>1) + 180);
                else 
                begin
                    case (combo/100)
                    1 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 180);
                    2 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 180);
                    3 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 180);
                    4 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 180);
                    5 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 180);
                    6 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 180);
                    7 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 180);
                    8 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 180);
                    9 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 180);
                    endcase
                end 
            end
            else if ((h_cnt>>1) >= 274 & (h_cnt>>1) < 286 & (v_cnt>>1) >= 42 & (v_cnt>>1) < 54)
            begin
                if (combo%100 < 10) pixel_addr = (h_cnt>>1) - 90 + 320*((v_cnt>>1) + 180);
                else 
                begin
                    case (combo%100/10)
                    1 : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 180);
                    2 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 180);
                    3 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 180);
                    4 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 180);
                    5 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 180);
                    6 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 180);
                    7 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 180);
                    8 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 180);
                    9 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 180);
                    endcase
                end 
            end
            else if ((h_cnt>>1) >= 294 & (h_cnt>>1) < 306 & (v_cnt>>1) >= 42 & (v_cnt>>1) < 54)
            begin
                if (combo%10 < 1) pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 180);
                else 
                begin
                    case (combo%10/1)
                    1 : pixel_addr = (h_cnt>>1) - 290 + 320*((v_cnt>>1) + 180);
                    2 : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 180);
                    3 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 180);
                    4 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 180);
                    5 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 180);
                    6 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 180);
                    7 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 180);
                    8 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 180);
                    9 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 180);
                    endcase
                end 
            end
            else pixel_addr = (h_cnt>>1) + 10 + 320*((v_cnt>>1) + 82);
        end
        
        else if ((v_cnt>>1) >= 58 & (v_cnt>>1) < 78)
        begin 
            if ((h_cnt>>1) >= 234 & (h_cnt>>1) < 246 & (v_cnt>>1) >= 62 & (v_cnt>>1) < 74)
            begin
                if (rate < 100) pixel_addr = (h_cnt>>1) - 50 + 320*((v_cnt>>1) + 160);
                else 
                begin
                    case (rate)
                    100 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 160);
                    default : pixel_addr = (h_cnt>>1) - 50 + 320*((v_cnt>>1) + 160);
                    endcase
                end 
            end            
            else if ((h_cnt>>1) >= 254 & (h_cnt>>1) < 266 & (v_cnt>>1) >= 62 & (v_cnt>>1) < 74)
            begin
                if (rate%100 < 10) pixel_addr = (h_cnt>>1) - 70 + 320*((v_cnt>>1) + 160);
                else 
                begin
                    case (rate%100/10)
                    1 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 160);
                    2 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 160);
                    3 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 160);
                    4 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 160);
                    5 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 160);
                    6 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 160);
                    7 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 160);
                    8 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 160);
                    9 : pixel_addr = (h_cnt>>1) -  90 + 320*((v_cnt>>1) + 160);
                    default : pixel_addr = (h_cnt>>1) - 70 + 320*((v_cnt>>1) + 160);
                    endcase
                end 
            end            
            else if ((h_cnt>>1) >= 274 & (h_cnt>>1) < 286 & (v_cnt>>1) >= 62 & (v_cnt>>1) < 74)
            begin
                if (rate%10 < 1) pixel_addr = (h_cnt>>1) - 90 + 320*((v_cnt>>1) + 160);
                else 
                begin
                    case (rate%10/1)
                    1 : pixel_addr = (h_cnt>>1) - 270 + 320*((v_cnt>>1) + 160);
                    2 : pixel_addr = (h_cnt>>1) - 250 + 320*((v_cnt>>1) + 160);
                    3 : pixel_addr = (h_cnt>>1) - 230 + 320*((v_cnt>>1) + 160);
                    4 : pixel_addr = (h_cnt>>1) - 210 + 320*((v_cnt>>1) + 160);
                    5 : pixel_addr = (h_cnt>>1) - 190 + 320*((v_cnt>>1) + 160);
                    6 : pixel_addr = (h_cnt>>1) - 170 + 320*((v_cnt>>1) + 160);
                    7 : pixel_addr = (h_cnt>>1) - 150 + 320*((v_cnt>>1) + 160);
                    8 : pixel_addr = (h_cnt>>1) - 130 + 320*((v_cnt>>1) + 160);
                    9 : pixel_addr = (h_cnt>>1) - 110 + 320*((v_cnt>>1) + 160);
                    default : pixel_addr = (h_cnt>>1) - 90 + 320*((v_cnt>>1) + 160);
                    endcase
                end 
            end
            else pixel_addr = (h_cnt>>1) + 10 + 320*((v_cnt>>1) + 122);
        end
    end
    
    //play ground
    else if ( ((v_cnt>>1) < 84) | ((v_cnt>>1) >= 156)) pixel_addr = 76800;
    
    //show beat judge
    else if ((h_cnt>>1) >= 0 & (h_cnt>>1) < 40 & (check == 1)) 
    begin
        if (beat_jd == 1) 
        begin   
            if(position1 >= 0 & position1 < 41) pixel_addr = ((h_cnt>>1) + 199) + 320*((v_cnt>>1) - 84);
            else if(position2 >= 0 & position2 < 41) pixel_addr = ((h_cnt>>1) + 199) + 320*((v_cnt>>1) - 84);
            else if(position3 >= 0 & position3 < 41) pixel_addr = ((h_cnt>>1) + 199) + 320*((v_cnt>>1) - 84);
            else if(position4 >= 0 & position4 < 41) pixel_addr = ((h_cnt>>1) + 199) + 320*((v_cnt>>1) - 84);
            else if(position5 >= 0 & position5 < 41) pixel_addr = ((h_cnt>>1) + 199) + 320*((v_cnt>>1) - 84);
            else if(position6 >= 0 & position6 < 41) pixel_addr = ((h_cnt>>1) + 199) + 320*((v_cnt>>1) - 84);
            else if(position7 >= 0 & position7 < 41) pixel_addr = ((h_cnt>>1) + 199) + 320*((v_cnt>>1) - 84);
            else if(position8 >= 0 & position8 < 41) pixel_addr = ((h_cnt>>1) + 199) + 320*((v_cnt>>1) - 84);
            else if(position9 >= 0 & position9 < 41) pixel_addr = ((h_cnt>>1) + 199) + 320*((v_cnt>>1) - 84);
        end
        else
        begin
            if(position1 >= 0 & position1 < 40) pixel_addr = ((h_cnt>>1) + 239) + 320*((v_cnt>>1) - 84);
            else if(position2 >= 0 & position2 < 40) pixel_addr = ((h_cnt>>1) + 239) + 320*((v_cnt>>1) - 84);
            else if(position3 >= 0 & position3 < 40) pixel_addr = ((h_cnt>>1) + 239) + 320*((v_cnt>>1) - 84);
            else if(position4 >= 0 & position4 < 40) pixel_addr = ((h_cnt>>1) + 239) + 320*((v_cnt>>1) - 84);
            else if(position5 >= 0 & position5 < 40) pixel_addr = ((h_cnt>>1) + 239) + 320*((v_cnt>>1) - 84);
            else if(position6 >= 0 & position6 < 40) pixel_addr = ((h_cnt>>1) + 239) + 320*((v_cnt>>1) - 84);
            else if(position7 >= 0 & position7 < 40) pixel_addr = ((h_cnt>>1) + 239) + 320*((v_cnt>>1) - 84);
            else if(position8 >= 0 & position8 < 40) pixel_addr = ((h_cnt>>1) + 239) + 320*((v_cnt>>1) - 84);
            else if(position9 >= 0 & position9 < 40) pixel_addr = ((h_cnt>>1) + 239) + 320*((v_cnt>>1) - 84);
        end
    end
    
    //beat runnig
    else
    begin
        //fist time space
        if (sign == 0) 
        begin
            if ((h_cnt>>1) < position1 - 40) pixel_addr = 0;
            if (position1 == 40) sign = 1;           
        end
    
        //out1
        if (position1 >= 320)
        begin
            if ((h_cnt>>1) >= position1 - 40)
                if (out1 == 0) pixel_addr = (h_cnt>>1) - (position1 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out1 == 1) pixel_addr = (h_cnt>>1) - (position1 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out1 == 2) pixel_addr = (h_cnt>>1) - (position1 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out1 == 3) pixel_addr = (h_cnt>>1) - (position1 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;
        end
        else if (position1 >= 40 & position1 < 320)
        begin
            if ((h_cnt>>1) >= position1 - 40 & (h_cnt>>1) < position1)
                if (out1 == 0) pixel_addr = (h_cnt>>1) - (position1 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out1 == 1) pixel_addr = (h_cnt>>1) - (position1 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out1 == 2) pixel_addr = (h_cnt>>1) - (position1 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out1 == 3) pixel_addr = (h_cnt>>1) - (position1 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;          
        end
        else if (position1 >= 0 & position1 < 40)
        begin
            if ((h_cnt>>1) < position1)
                if (check == 0)
                begin
                    if (out1 == 0) pixel_addr = (h_cnt>>1) - (position1 - 40) + 320 * ((v_cnt>>1) - 84);
                    else if (out1 == 1) pixel_addr = (h_cnt>>1) - (position1 - 80) + 320 * ((v_cnt>>1) - 84);
                    else if (out1 == 2) pixel_addr = (h_cnt>>1) - (position1 - 120) + 320 * ((v_cnt>>1) - 84);
                    else if (out1 == 3) pixel_addr = (h_cnt>>1) - (position1 - 160) + 320 * ((v_cnt>>1) - 84);
                    else pixel_addr = 0;
                end
                else pixel_addr = 0;          
        end
        
        //out2
        if (position2 >= 320 & position2 < 360)
        begin
            if ((h_cnt>>1) >= position2 - 40)
                if (out2 == 0) pixel_addr = (h_cnt>>1) - (position2 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out2 == 1) pixel_addr = (h_cnt>>1) - (position2 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out2 == 2) pixel_addr = (h_cnt>>1) - (position2 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out2 == 3) pixel_addr = (h_cnt>>1) - (position2 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;
        end
        else if (position2 >= 40 & position2 < 320)
        begin
            if ((h_cnt>>1) >= position2 - 40 & (h_cnt>>1) < position2)
                if (out2 == 0) pixel_addr = (h_cnt>>1) - (position2 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out2 == 1) pixel_addr = (h_cnt>>1) - (position2 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out2 == 2) pixel_addr = (h_cnt>>1) - (position2 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out2 == 3) pixel_addr = (h_cnt>>1) - (position2 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;            
        end
        else if (position2 >= 0 & position2 < 40)
        begin
            if ((h_cnt>>1) < position2)
                if (check == 0)
                begin
                    if (out2 == 0) pixel_addr = (h_cnt>>1) - (position2 - 40) + 320 * ((v_cnt>>1) - 84);
                    else if (out2 == 1) pixel_addr = (h_cnt>>1) - (position2 - 80) + 320 * ((v_cnt>>1) - 84);
                    else if (out2 == 2) pixel_addr = (h_cnt>>1) - (position2 - 120) + 320 * ((v_cnt>>1) - 84);
                    else if (out2 == 3) pixel_addr = (h_cnt>>1) - (position2 - 160) + 320 * ((v_cnt>>1) - 84);
                    else pixel_addr = 0;
                end
                else pixel_addr =0;            
        end
        
        //out3
        if (position3 >= 320 & position3 < 360)
        begin
            if ((h_cnt>>1) >= position3 - 40)
                if (out3 == 0) pixel_addr = (h_cnt>>1) - (position3 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out3 == 1) pixel_addr = (h_cnt>>1) - (position3 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out3 == 2) pixel_addr = (h_cnt>>1) - (position3 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out3 == 3) pixel_addr = (h_cnt>>1) - (position3 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;
        end
        else if (position3 >= 40 & position3 < 320)
        begin
            if ((h_cnt>>1) >= position3 - 40 & (h_cnt>>1) < position3)
                if (out3 == 0) pixel_addr = (h_cnt>>1) - (position3 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out3 == 1) pixel_addr = (h_cnt>>1) - (position3 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out3 == 2) pixel_addr = (h_cnt>>1) - (position3 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out3 == 3) pixel_addr = (h_cnt>>1) - (position3 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;            
        end
        else if (position3 >= 0 & position3 < 40)
        begin
            if ((h_cnt>>1) < position3)
                if (check == 0)
                begin
                    if (out3 == 0) pixel_addr = (h_cnt>>1) - (position3 - 40) + 320 * ((v_cnt>>1) - 84);
                    else if (out3 == 1) pixel_addr = (h_cnt>>1) - (position3 - 80) + 320 * ((v_cnt>>1) - 84);
                    else if (out3 == 2) pixel_addr = (h_cnt>>1) - (position3 - 120) + 320 * ((v_cnt>>1) - 84);
                    else if (out3 == 3) pixel_addr = (h_cnt>>1) - (position3 - 160) + 320 * ((v_cnt>>1) - 84);
                    else pixel_addr = 0;            
                end
                else pixel_addr = 0;
        end
        
        //out4
        if (position4 >= 320 & position4 < 360)
        begin
            if ((h_cnt>>1) >= position4 - 40)
                if (out4 == 0) pixel_addr = (h_cnt>>1) - (position4 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out4 == 1) pixel_addr = (h_cnt>>1) - (position4 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out4 == 2) pixel_addr = (h_cnt>>1) - (position4 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out4 == 3) pixel_addr = (h_cnt>>1) - (position4 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;
        end
        else if (position4 >= 40 & position4 < 320)
        begin
            if ((h_cnt>>1) >= position4 - 40 & (h_cnt>>1) < position4)
                if (out4 == 0) pixel_addr = (h_cnt>>1) - (position4 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out4 == 1) pixel_addr = (h_cnt>>1) - (position4 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out4 == 2) pixel_addr = (h_cnt>>1) - (position4 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out4 == 3) pixel_addr = (h_cnt>>1) - (position4 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;            
        end
        else if (position4 >= 0 & position4 < 40)
        begin
            if ((h_cnt>>1) < position4)
                if (check == 0)
                begin
                    if (out4 == 0) pixel_addr = (h_cnt>>1) - (position4 - 40) + 320 * ((v_cnt>>1) - 84);
                    else if (out4 == 1) pixel_addr = (h_cnt>>1) - (position4 - 80) + 320 * ((v_cnt>>1) - 84);
                    else if (out4 == 2) pixel_addr = (h_cnt>>1) - (position4 - 120) + 320 * ((v_cnt>>1) - 84);
                    else if (out4 == 3) pixel_addr = (h_cnt>>1) - (position4 - 160) + 320 * ((v_cnt>>1) - 84);
                    else pixel_addr = 0;
                end
                else pixel_addr = 0;            
        end
        
        //out5
        if (position5 >= 320 & position5 < 360)
        begin
            if ((h_cnt>>1) >= position5 - 40)
                if (out5 == 0) pixel_addr = (h_cnt>>1) - (position5 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out5 == 1) pixel_addr = (h_cnt>>1) - (position5 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out5 == 2) pixel_addr = (h_cnt>>1) - (position5 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out5 == 3) pixel_addr = (h_cnt>>1) - (position5 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;
        end
        else if (position5 >= 40 & position5 < 320)
        begin
            if ((h_cnt>>1) >= position5 - 40 & (h_cnt>>1) < position5)
                if (out5 == 0) pixel_addr = (h_cnt>>1) - (position5 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out5 == 1) pixel_addr = (h_cnt>>1) - (position5 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out5 == 2) pixel_addr = (h_cnt>>1) - (position5 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out5 == 3) pixel_addr = (h_cnt>>1) - (position5 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;            
        end
        else if (position5 >= 0 & position5 < 40)
        begin
            if ((h_cnt>>1) < position5)
                if (check == 0)
                begin
                    if (out5 == 0) pixel_addr = (h_cnt>>1) - (position5 - 40) + 320 * ((v_cnt>>1) - 84);
                    else if (out5 == 1) pixel_addr = (h_cnt>>1) - (position5 - 80) + 320 * ((v_cnt>>1) - 84);
                    else if (out5 == 2) pixel_addr = (h_cnt>>1) - (position5 - 120) + 320 * ((v_cnt>>1) - 84);
                    else if (out5 == 3) pixel_addr = (h_cnt>>1) - (position5 - 160) + 320 * ((v_cnt>>1) - 84);
                    else pixel_addr = 0;
                end
                else pixel_addr = 0;          
        end
        
        //out6
        if (position6 >= 320 & position6 < 360)
        begin
            if ((h_cnt>>1) >= position6 - 40)
                if (out6 == 0) pixel_addr = (h_cnt>>1) - (position6 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out6 == 1) pixel_addr = (h_cnt>>1) - (position6 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out6 == 2) pixel_addr = (h_cnt>>1) - (position6 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out6 == 3) pixel_addr = (h_cnt>>1) - (position6 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;
        end
        else if (position6 >= 40 & position6 < 320)
        begin
            if ((h_cnt>>1) >= position6 - 40 & (h_cnt>>1) < position6)
                if (out6 == 0) pixel_addr = (h_cnt>>1) - (position6 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out6 == 1) pixel_addr = (h_cnt>>1) - (position6 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out6 == 2) pixel_addr = (h_cnt>>1) - (position6 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out6 == 3) pixel_addr = (h_cnt>>1) - (position6 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;            
        end
        else if (position6 >= 0 & position6 < 40)
        begin
            if ((h_cnt>>1) < position6)
                if (check == 0)
                begin
                    if (out6 == 0) pixel_addr = (h_cnt>>1) - (position6 - 40) + 320 * ((v_cnt>>1) - 84);
                    else if (out6 == 1) pixel_addr = (h_cnt>>1) - (position6 - 80) + 320 * ((v_cnt>>1) - 84);
                    else if (out6 == 2) pixel_addr = (h_cnt>>1) - (position6 - 120) + 320 * ((v_cnt>>1) - 84);
                    else if (out6 == 3) pixel_addr = (h_cnt>>1) - (position6 - 160) + 320 * ((v_cnt>>1) - 84);
                    else pixel_addr = 0;
                end
                else pixel_addr = 0;            
        end
        
        //out7
        if (position7 >= 320 & position7 < 360)
        begin
            if ((h_cnt>>1) >= position7 - 40)
                if (out7 == 0) pixel_addr = (h_cnt>>1) - (position7 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out7 == 1) pixel_addr = (h_cnt>>1) - (position7 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out7 == 2) pixel_addr = (h_cnt>>1) - (position7 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out7 == 3) pixel_addr = (h_cnt>>1) - (position7 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;
        end
        else if (position7 >= 40 & position7 < 320)
        begin
            if ((h_cnt>>1) >= position7 - 40 & (h_cnt>>1) < position7)
                if (out7 == 0) pixel_addr = (h_cnt>>1) - (position7 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out7 == 1) pixel_addr = (h_cnt>>1) - (position7 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out7 == 2) pixel_addr = (h_cnt>>1) - (position7 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out7 == 3) pixel_addr = (h_cnt>>1) - (position7 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;            
        end
        else if (position7 >= 0 & position7 < 40)
        begin
            if ((h_cnt>>1) < position7)
                if (check == 0)
                begin
                    if (out7 == 0) pixel_addr = (h_cnt>>1) - (position7 - 40) + 320 * ((v_cnt>>1) - 84);
                    else if (out7 == 1) pixel_addr = (h_cnt>>1) - (position7 - 80) + 320 * ((v_cnt>>1) - 84);
                    else if (out7 == 2) pixel_addr = (h_cnt>>1) - (position7 - 120) + 320 * ((v_cnt>>1) - 84);
                    else if (out7 == 3) pixel_addr = (h_cnt>>1) - (position7 - 160) + 320 * ((v_cnt>>1) - 84);
                    else pixel_addr = 0;
                end
                else pixel_addr = 0;          
        end

        //out8
        if (position8 >= 320 & position8 < 360)
        begin
            if ((h_cnt>>1) >= position8 - 40)
                if (out8 == 0) pixel_addr = (h_cnt>>1) - (position8 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out8 == 1) pixel_addr = (h_cnt>>1) - (position8 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out8 == 2) pixel_addr = (h_cnt>>1) - (position8 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out8 == 3) pixel_addr = (h_cnt>>1) - (position8 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;
        end
        else if (position8 >= 40 & position8 < 320)
        begin
            if ((h_cnt>>1) >= position8 - 40 & (h_cnt>>1) < position8)
                if (out8 == 0) pixel_addr = (h_cnt>>1) - (position8 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out8 == 1) pixel_addr = (h_cnt>>1) - (position8 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out8 == 2) pixel_addr = (h_cnt>>1) - (position8 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out8 == 3) pixel_addr = (h_cnt>>1) - (position8 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;            
        end
        else if (position8 >= 0 & position8 < 40)
        begin
            if ((h_cnt>>1) < position8)
                if (check == 0)
                begin
                    if (out8 == 0) pixel_addr = (h_cnt>>1) - (position8 - 40) + 320 * ((v_cnt>>1) - 84);
                    else if (out8 == 1) pixel_addr = (h_cnt>>1) - (position8 - 80) + 320 * ((v_cnt>>1) - 84);
                    else if (out8 == 2) pixel_addr = (h_cnt>>1) - (position8 - 120) + 320 * ((v_cnt>>1) - 84);
                    else if (out8 == 3) pixel_addr = (h_cnt>>1) - (position8 - 160) + 320 * ((v_cnt>>1) - 84);
                    else pixel_addr = 0;
                end 
                else pixel_addr = 0;           
        end
        
        //out9
        if (position9 >= 320 & position9 < 360)
        begin
            if ((h_cnt>>1) >= position9 - 40)
                if (out9 == 0) pixel_addr = (h_cnt>>1) - (position9 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out9 == 1) pixel_addr = (h_cnt>>1) - (position9 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out9 == 2) pixel_addr = (h_cnt>>1) - (position9 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out9 == 3) pixel_addr = (h_cnt>>1) - (position9 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;
        end
        else if (position9 >= 40 & position9 < 320)
        begin
            if ((h_cnt>>1) >= position9 - 40 & (h_cnt>>1) < position9)
                if (out9 == 0) pixel_addr = (h_cnt>>1) - (position9 - 40) + 320 * ((v_cnt>>1) - 84);
                else if (out9 == 1) pixel_addr = (h_cnt>>1) - (position9 - 80) + 320 * ((v_cnt>>1) - 84);
                else if (out9 == 2) pixel_addr = (h_cnt>>1) - (position9 - 120) + 320 * ((v_cnt>>1) - 84);
                else if (out9 == 3) pixel_addr = (h_cnt>>1) - (position9 - 160) + 320 * ((v_cnt>>1) - 84);
                else pixel_addr = 0;            
        end
        else if (position9 >= 0 & position9 < 40)
        begin
            if ((h_cnt>>1) < position9)
                if (check == 0)
                begin
                    if (out9 == 0) pixel_addr = (h_cnt>>1) - (position9 - 40) + 320 * ((v_cnt>>1) - 84);
                    else if (out9 == 1) pixel_addr = (h_cnt>>1) - (position9 - 80) + 320 * ((v_cnt>>1) - 84);
                    else if (out9 == 2) pixel_addr = (h_cnt>>1) - (position9 - 120) + 320 * ((v_cnt>>1) - 84);
                    else if (out9 == 3) pixel_addr = (h_cnt>>1) - (position9 - 160) + 320 * ((v_cnt>>1) - 84);
                    else pixel_addr = 0;
                end
                else pixel_addr = 0;            
        end
    end
    end
end

always @ (posedge clk_320hz or posedge rst) 
begin
    if(rst) position1 <= 359;
    else if (mode == `play1 | mode == `play2)
        if(position1 > 0) position1 <= position1 - 1;
        else position1 <= 359;
    else if (mode == `play1_ps | mode == `play2_ps | mode == `play1_pm | mode == `play2_pm)
        position1 <= position1;
    else position1 <= 359;
end

always @ (posedge clk_320hz or posedge rst) 
begin
    if(rst) position2 <= 399;
    else if (mode == `play1 | mode == `play2)
        if(position2 > 0) position2 <= position2 - 1;
        else position2 <= 359;
    else if (mode == `play1_ps | mode == `play2_ps | mode == `play1_pm | mode == `play2_pm)
        position2 <= position2;
    else position2 <= 399;
end

always @ (posedge clk_320hz or posedge rst) 
begin
    if(rst) position3 <= 439;
    else if (mode == `play1 | mode == `play2)
        if(position3 > 0) position3 <= position3 - 1;               
        else position3 <= 359;
    else if (mode == `play1_ps | mode == `play2_ps | mode == `play1_pm | mode == `play2_pm)
        position3 <= position3;
    else position3 <= 439;
end

always @ (posedge clk_320hz or posedge rst) 
begin
    if(rst) position4 <= 479;
    else if (mode == `play1 | mode == `play2)
        if(position4 > 0) position4 <= position4 - 1;               
        else position4 <= 359;
    else if (mode == `play1_ps | mode == `play2_ps | mode == `play1_pm | mode == `play2_pm)
        position4 <= position4;
    else position4 <= 479;
end

always @ (posedge clk_320hz or posedge rst) 
begin
    if(rst) position5 <= 519;
    else if (mode == `play1 | mode == `play2)
        if(position5 > 0) position5 <= position5 - 1;               
        else position5 <= 359;
    else if (mode == `play1_ps | mode == `play2_ps | mode == `play1_pm | mode == `play2_pm)
        position5 <= position5;
    else position5 <= 519;
end

always @ (posedge clk_320hz or posedge rst) 
begin
    if(rst) position6 <= 559;
    else if (mode == `play1 | mode == `play2)
        if(position6 > 0) position6 <= position6 - 1;               
        else position6 <= 359;
    else if (mode == `play1_ps | mode == `play2_ps | mode == `play1_pm | mode == `play2_pm)
        position6 <= position6;
    else position6 <= 559;
end

always @ (posedge clk_320hz or posedge rst) 
begin
    if(rst) position7 <= 599;
    else if (mode == `play1 | mode == `play2)
        if(position7 > 0) position7 <= position7 - 1;               
        else position7 <= 359;
    else if (mode == `play1_ps | mode == `play2_ps | mode == `play1_pm | mode == `play2_pm)
        position7 <= position7;
    else position7 <= 599;
end

always @ (posedge clk_320hz or posedge rst) 
begin
    if(rst) position8 <= 639;
    else if (mode == `play1 | mode == `play2)
        if(position8 > 0) position8 <= position8 - 1;               
        else position8 <= 359;
    else if (mode == `play1_ps | mode == `play2_ps | mode == `play1_pm | mode == `play2_pm)
        position8 <= position8;
    else position8 <= 639;
end

always @ (posedge clk_320hz or posedge rst) 
begin
    if(rst) position9 <= 679;
    else if (mode == `play1 | mode == `play2)
        if(position9 > 0) position9 <= position9 - 1;               
        else position9 <= 359;
    else if (mode == `play1_ps | mode == `play2_ps | mode == `play1_pm | mode == `play2_pm)
        position9 <= position9;
    else position9 <= 679;
end
   
endmodule