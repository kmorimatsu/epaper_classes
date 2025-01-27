rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:  	EPD_2in13_V4.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.13inch e-paper V4
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2023-08-12
rem * | Info        :
rem * -----------------------------------------------------------------------------
rem #
rem # Permission is hereby granted, free of charge, to any person obtaining a copy
rem # of this software and associated documnetation files (the "Software"), to deal
rem # in the Software without restriction, including without limitation the rights
rem # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
rem # copies of the Software, and to permit persons to  whom the Software is
rem # furished to do so, subject to the following conditions:
rem #
rem # The above copyright notice and this permission notice shall be included in
rem # all copies or substantial portions of the Software.
rem #
rem # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem # FITNESS OR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
rem # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem # LIABILITY WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
rem # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
rem # THE SOFTWARE.
rem #
rem ******************************************************************************/

USEVAR C_RAM

method EPD_2IN13_V4_INIT
  goto C_EPD_2IN13_V4_INIT
method EPD_2IN13_V4_INIT_FAST
  goto C_EPD_2IN13_V4_INIT_FAST
method EPD_2IN13_V4_CLEAR
  goto C_EPD_2IN13_V4_CLEAR
method EPD_2IN13_V4_CLEAR_BLACK
  goto C_EPD_2IN13_V4_CLEAR_BLACK
method EPD_2IN13_V4_DISPLAY
  goto C_EPD_2IN13_V4_DISPLAY
method EPD_2IN13_V4_DISPLAY_FAST
  goto C_EPD_2IN13_V4_DISPLAY_FAST
method EPD_2IN13_V4_DISPLAY_BASE
  goto C_EPD_2IN13_V4_DISPLAY_BASE
method EPD_2IN13_V4_DISPLAY_PARTIAL
  goto C_EPD_2IN13_V4_DISPLAY_PARTIAL
method EPD_2IN13_V4_SLEEP
  goto C_EPD_2IN13_V4_SLEEP

method INIT
  var a,b,c,d
  GOSUB INIT_C
  if args(0)<4 then
    rem dc, cs, rst, busy
    a=8:b=9:c=12:d=13
  else
    rem dc, cs, rst, busy
    a=args(1):b=args(2):c=args(3):d=args(4)
  endif
  spi 4000,8,0,b
  gosub C_DEV_GPIO_INIT,a,b,c,d
return

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+1096,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1184,C_RAM+16
  POKE32 DATAADDRESS(C_FUNCTIONS)+1328,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1332,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1336,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1340,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1344,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1348,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1432,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1492,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1576,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1580,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1664,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1668,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2632,C_RAM+16
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN13_V4_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f88f,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V4_INIT_FAST
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8c9,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V4_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f903,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V4_CLEAR_BLACK
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f923,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f943,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY_FAST
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f96f,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY_BASE
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f99b,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY_PARTIAL
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9eb,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V4_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa4b,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa51,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa5b,$b002,$bd00,$46c0

REM 2824 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$faa6,$f000,$face,$2012,$f000,$fae9,$f000,$fac9,$2001,$f000,$fae4,$20f9,$f000,
     $fb0d,$2000,$f000,$fb0a,$2000,$f000,$fb07,$2011,$f000,$fad8,$2003,$f000,$fb01,$23f9,$2279,$2100,
     $2000,$f000,$fb27,$2100,$2000,$f000,$fb69,$203c,$f000,$fac8,$2005,$f000,$faf1,$2021,$f000,$fac2,
     $2000,$f000,$faeb,$2080,$f000,$fae8,$2018,$f000,$fab9,$2080,$f000,$fae2,$f000,$fa96,$bf00,$bd80,
     $b580,$af00,$f7ff,$fea5,$2012,$f7ff,$fec6,$f7ff,$b580,$af00,$f000,$fa5e,$2012,$f000,$faa3,$f000,
     $fa83,$2018,$f000,$fa9e,$2080,$f000,$fac7,$2011,$f000,$fa98,$2003,$f000,$fac1,$23f9,$2279,$2100,
     $2000,$f000,$fae7,$2100,$2000,$f000,$fb29,$2022,$f000,$fa88,$20b1,$f000,$fab1,$2020,$f000,$fa82,
     $f000,$fa62,$201a,$f000,$fa7d,$2064,$f000,$faa6,$2000,$f000,$faa3,$2022,$f000,$fa74,$2091,$f000,
     $fa9d,$2020,$f000,$fa6e,$f000,$fa4e,$bf00,$bd80,$b580,$b082,$af00,$2310,$807b,$23fa,$803b,$2024,
     $b580,$b082,$af00,$2310,$807b,$23fa,$803b,$2024,$f000,$fa58,$2300,$80fb,$e00f,$2300,$80bb,$e005,
     $20ff,$f000,$fa7b,$88bb,$3301,$80bb,$88ba,$887b,$429a,$d3f5,$88fb,$3301,$80fb,$88fa,$883b,$429a,
     $d3eb,$f000,$fb07,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$2310,$807b,$23fa,$803b,$b580,$b082,
     $af00,$2310,$807b,$23fa,$803b,$2024,$f000,$fa2a,$2300,$80fb,$e00f,$2300,$80bb,$e005,$2000,$f000,
     $fa4d,$88bb,$3301,$80bb,$88ba,$887b,$429a,$d3f5,$88fb,$3301,$80fb,$88fa,$883b,$429a,$d3eb,$f000,
     $fad9,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$6078,$2310,$817b,$23fa,$b580,$b084,$af00,$6078,
     $2310,$817b,$23fa,$813b,$2024,$f000,$f9fb,$2300,$81fb,$e019,$2300,$81bb,$e00f,$89ba,$89fb,$8979,
     $fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$fa14,$89bb,$3301,$81bb,$89ba,$897b,$429a,
     $d3eb,$89fb,$3301,$81fb,$89fa,$893b,$429a,$d3e1,$f000,$faa0,$bf00,$3710,$46bd,$bd80,$b580,$b084,
     $af00,$6078,$2310,$817b,$23fa,$813b,$b580,$b084,$af00,$6078,$2310,$817b,$23fa,$813b,$2024,$f000,
     $f9c1,$2300,$81fb,$e019,$2300,$81bb,$e00f,$89ba,$89fb,$8979,$fb01,$f303,$4413,$461a,$687b,$4413,
     $781b,$4618,$f000,$f9da,$89bb,$3301,$81bb,$89ba,$897b,$429a,$d3eb,$89fb,$3301,$81fb,$89fa,$893b,
     $429a,$d3e1,$f000,$fa7c,$bf00,$3710,$46bd,$bd80,$b580,$b086,$af00,$6078,$2310,$81fb,$23fa,$81bb,
     $b580,$b086,$af00,$6078,$2310,$81fb,$23fa,$81bb,$2024,$f000,$f987,$2300,$82fb,$e019,$2300,$82bb,
     $e00f,$8aba,$8afb,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$f9a0,$8abb,$3301,
     $82bb,$8aba,$89fb,$429a,$d3eb,$8afb,$3301,$82fb,$8afa,$89bb,$429a,$d3e1,$2026,$f000,$f963,$2300,
     $827b,$e019,$2300,$823b,$e00f,$8a3a,$8a7b,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,
     $f000,$f97c,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3eb,$8a7b,$3301,$827b,$8a7a,$89bb,$429a,$d3e1,
     $f000,$fa08,$bf00,$3718,$46bd,$bd80,$0000,$b580,$b084,$af00,$6078,$2310,$817b,$23fa,$b580,$b084,
     $af00,$6078,$2310,$817b,$23fa,$813b,$4b2e,$681b,$b29b,$2100,$4618,$f000,$fa19,$2001,$f000,$fa34,
     $4b29,$681b,$b29b,$2101,$4618,$f000,$fa0f,$203c,$f000,$f918,$2080,$f000,$f941,$2001,$f000,$f912,
     $20f9,$f000,$f93b,$2000,$f000,$f938,$2000,$f000,$f935,$2011,$f000,$f906,$2003,$f000,$f92f,$23f9,
     $2279,$2100,$2000,$f000,$f955,$2100,$2000,$f000,$f997,$2024,$f000,$f8f6,$2300,$81fb,$e019,$2300,
     $81bb,$e00f,$89ba,$89fb,$8979,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$f90f,$89bb,
     $3301,$81bb,$89ba,$897b,$429a,$d3eb,$89fb,$3301,$81fb,$89fa,$893b,$429a,$d3e1,$f000,$f9f7,$bf00,
     $3710,$46bd,$bd80,$bf00,$43a8,$2000,$b580,$af00,$2010,$f7ff,$fd17,$2001,$b580,$af00,$2010,$f000,
     $f8c1,$2001,$f000,$f8ea,$2064,$f000,$f9cd,$bf00,$bd80,$0000,$b580,$af00,$4b13,$681b,$b29b,$2101,
     $b480,$af00,$b403,$4906,$600d,$604e,$608f,$ea5f,$0008,$60c8,$bc03,$bf00,$46bd,$f85d,$7b04,$4770,
     $4400,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4a1c,
     $687b,$6013,$4a1b,$68fb,$6013,$4a1b,$683b,$6013,$4a1a,$68bb,$6013,$4b1a,$2212,$601a,$4b19,$2213,
     $601a,$4b13,$681b,$b29b,$2101,$4618,$f000,$f9b4,$4b10,$681b,$b29b,$2101,$4618,$f000,$f9ad,$4b0f,
     $681b,$b29b,$2101,$4618,$f000,$f9a6,$4b0a,$681b,$b29b,$2100,$4618,$f000,$f99f,$4b08,$681b,$b29b,
     $2101,$4618,$f000,$f952,$bf00,$3710,$46bd,$bd80,$43a8,$2000,$43a0,$2000,$4394,$2000,$439c,$2000,
     $4398,$2000,$43a4,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b0f,$681b,$b29b,$2101,
     $4618,$f000,$f933,$2014,$f000,$f94e,$4b0a,$681b,$b29b,$2100,$4618,$f000,$f929,$2002,$f000,$f944,
     $4b05,$681b,$b29b,$2101,$4618,$f000,$f91f,$2014,$f000,$f93a,$bf00,$bd80,$43a8,$2000,$b580,$b082,
     $af00,$4603,$71fb,$4b0e,$b580,$af00,$4b09,$681b,$b29b,$4618,$f000,$f97a,$4603,$2b00,$d003,$200a,
     $f000,$f922,$e7f2,$bf00,$200a,$f000,$f91d,$bf00,$bd80,$bf00,$4394,$2000,$b590,$b083,$af00,$4604,
     $4608,$4611,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f8e8,$4b0b,$681b,
     $b29b,$2100,$4618,$f000,$f8e1,$79fb,$4618,$f000,$f963,$4b06,$681b,$b29b,$2101,$4618,$f000,$f8d6,
     $bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,
     $af00,$4603,$71fb,$4b0e,$681b,$b29b,$2101,$4618,$f000,$f8bc,$4b0b,$681b,$b29b,$2100,$4618,$f000,
     $f8b5,$79fb,$4618,$f000,$f937,$4b06,$681b,$b29b,$2101,$4618,$f000,$f8aa,$bf00,$3708,$46bd,$bd80,
     $43a0,$2000,$439c,$2000,$b580,$af00,$4b09,$681b,$b29b,$4618,$b590,$b083,$af00,$4604,$4608,$4611,
     $461a,$4623,$80fb,$4603,$80bb,$460b,$807b,$4613,$803b,$2044,$f7ff,$ff96,$88fb,$08db,$b29b,$b2db,
     $4618,$f7ff,$ffbb,$887b,$08db,$b29b,$b2db,$4618,$f7ff,$ffb4,$2045,$f7ff,$ff85,$88bb,$b2db,$4618,
     $f7ff,$ffac,$88bb,$0a1b,$b29b,$b2db,$4618,$f7ff,$ffa5,$883b,$b2db,$4618,$f7ff,$ffa0,$883b,$0a1b,
     $b29b,$b2db,$4618,$f7ff,$ff99,$bf00,$370c,$46bd,$bd90,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,
     $b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$204e,$f7ff,$ff57,$88fb,$b2db,$4618,$f7ff,$ff7e,
     $204f,$f7ff,$ff4f,$88bb,$b2db,$4618,$f7ff,$ff76,$88bb,$0a1b,$b29b,$b2db,$4618,$f7ff,$ff6f,$bf00,
     $3708,$46bd,$bd80,$b580,$af00,$2022,$f7ff,$ff35,$20f7,$f7ff,$b580,$af00,$2022,$f7ff,$ff33,$20f7,
     $f7ff,$ff5c,$2020,$f7ff,$ff2d,$f7ff,$ff0d,$bf00,$bd80,$b580,$af00,$2022,$f7ff,$ff26,$20c7,$f7ff,
     $b580,$af00,$2022,$f7ff,$ff1d,$20c7,$f7ff,$ff46,$2020,$f7ff,$ff17,$f7ff,$fef7,$bf00,$bd80,$b580,
     $af00,$2022,$f7ff,$ff17,$20ff,$f7ff,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,$88fa,$797b,
     $2b00,$bf14,$2301,$2300,$b2db,$4619,$4610,$f000,$f88d,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,
     $4603,$80fb,$88fb,$4618,$b580,$b082,$af00,$6078,$6878,$f000,$f897,$bf00,$3708,$46bd,$bd80,$0000,
     $b580,$b084,$af00,$60f8,$60b9,$607a,$b580,$af00,$2022,$f7ff,$fed7,$20ff,$f7ff,$ff00,$2020,$f7ff,
     $fed1,$f7ff,$feb1,$bf00,$bd80,$b580,$af00,$f7ff,$fee5,$f7ff,$ff53,$2012,$b580,$b082,$af00,$4603,
     $460a,$80fb,$4613,$80bb,$88fb,$4618,$f000,$f880,$88bb,$2b00,$d002,$88bb,$2b00,$d105,$88fb,$2100,
     $4618,$f000,$f891,$e005,$88fb,$2101,$4618,$f000,$f88b,$bf00,$bf00,$3708,$46bd,$bd80,$b580,$b082,
     $af00,$6078,$6878,$f7ff,$ff51,$bf00,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,$f891,$4603,
     $4618,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b084,$af00,$4603,
     $71fb,$79fb,$60fb,$f107,$010c,$2394,$2203,$2001,$f000,$f894,$bf00,$3710,$46bd,$bd80,$b480,$b083,
     $af00,$6078,$f04f,$4350,$685a,$2101,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,
     $68fb,$7afa,$ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,
     $70fb,$687b,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f862,$bf00,$3708,$46bd,$bd80,
     $b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,
     $2100,$6878,$f7ff,$ffc2,$2105,$6878,$f000,$f864,$bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,
     $4809,$f002,$f99e,$693b,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,
     $ec42,$3044,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,
     $b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,$2b00,$bf14,$2301,$2300,
     $b2db,$4618,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b590,$b087,
     $af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,$687a,$68b9,$68f8,$47a0,$4603,$4618,
     $371c,$46bd,$bd90,$bf00,$4400,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b08a,$af00,$6078,
     $460b,$70fb,$6878,$f000,$f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,
     $69bb,$405a,$697b,$4013,$69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,$6013,$bf00,$bf00,$490d,
     $78fa,$687b,$00db,$440b,$605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,$623b,$6a7b,$f503,$5340,
     $461a,$6a3b,$6013,$bf00,$bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,$b580,$b082,$af00,$6078,
     $2100,$6878,$b480,$b083,$af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,
     $460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
