rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:  	EPD_2in13_V3.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.13inch e-paper V3
rem * | Info        :
rem *----------------
rem * |	This version:   V1.1
rem * | Date        :   2021-10-30
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

method EPD_2IN13_V3_INIT
  goto C_EPD_2IN13_V3_INIT
method EPD_2IN13_V3_CLEAR
  goto C_EPD_2IN13_V3_CLEAR
method EPD_2IN13_V3_DISPLAY
  goto C_EPD_2IN13_V3_DISPLAY
method EPD_2IN13_V3_DISPLAY_BASE
  goto C_EPD_2IN13_V3_DISPLAY_BASE
method EPD_2IN13_V3_DISPLAY_PARTIAL
  goto C_EPD_2IN13_V3_DISPLAY_PARTIAL
method EPD_2IN13_V3_SLEEP
  goto C_EPD_2IN13_V3_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+812,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+904,C_RAM+16
  POKE32 DATAADDRESS(C_FUNCTIONS)+1048,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1052,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1056,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1060,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1064,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1068,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1312,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1408,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1492,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1496,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1580,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1584,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2772,C_RAM+16
  REM rodata vectors
  REM ram function vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+140,DATAADDRESS(C_FUNCTIONS)+1084
  POKE32 DATAADDRESS(C_FUNCTIONS)+816,DATAADDRESS(C_FUNCTIONS)+2000
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN13_V3_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f865,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8a5,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8c5,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_DISPLAY_BASE
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8f1,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_DISPLAY_PARTIAL
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f941,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9bf,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9c5,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9cf,$b002,$bd00,$46c0

REM 3024 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fa6a,$2064,$f000,$fa91,$f000,$faa1,$2012,$f000,$fabc,$f000,$fa9c,$2001,$f000,
     $fab7,$20f9,$f000,$fae0,$2000,$f000,$fadd,$2000,$f000,$fada,$2011,$f000,$faab,$2003,$f000,$fad4,
     $23f9,$2279,$2100,$2000,$f000,$fafa,$2100,$2000,$f000,$fb3c,$203c,$f000,$fa9b,$2005,$f000,$fac4,
     $2021,$f000,$fa95,$2000,$f000,$fabe,$2080,$f000,$fabb,$2018,$f000,$fa8c,$2080,$f000,$fab5,$f000,
     $fa69,$4802,$f000,$fb4c,$bf00,$bd80,$0420,$2000,$b580,$b082,$af00,$2310,$807b,$23fa,$b580,$b082,
     $af00,$2310,$807b,$23fa,$803b,$2024,$f000,$fa70,$2300,$80fb,$e00f,$2300,$80bb,$e005,$20ff,$f000,
     $fa93,$88bb,$3301,$80bb,$88ba,$887b,$429a,$d3f5,$88fb,$3301,$80fb,$88fa,$883b,$429a,$d3eb,$f000,
     $fb61,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$6078,$2310,$817b,$23fa,$b580,$b084,$af00,$6078,
     $2310,$817b,$23fa,$813b,$2024,$f000,$fa41,$2300,$81fb,$e019,$2300,$81bb,$e00f,$89ba,$89fb,$8979,
     $fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$fa5a,$89bb,$3301,$81bb,$89ba,$897b,$429a,
     $d3eb,$89fb,$3301,$81fb,$89fa,$893b,$429a,$d3e1,$f000,$fb28,$bf00,$3710,$46bd,$bd80,$b580,$b086,
     $af00,$6078,$2310,$81fb,$23fa,$81bb,$b580,$b086,$af00,$6078,$2310,$81fb,$23fa,$81bb,$2024,$f000,
     $fa07,$2300,$82fb,$e019,$2300,$82bb,$e00f,$8aba,$8afb,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,
     $781b,$4618,$f000,$fa20,$8abb,$3301,$82bb,$8aba,$89fb,$429a,$d3eb,$8afb,$3301,$82fb,$8afa,$89bb,
     $429a,$d3e1,$2026,$f000,$f9e3,$2300,$827b,$e019,$2300,$823b,$e00f,$8a3a,$8a7b,$89f9,$fb01,$f303,
     $4413,$461a,$687b,$4413,$781b,$4618,$f000,$f9fc,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3eb,$8a7b,
     $3301,$827b,$8a7a,$89bb,$429a,$d3e1,$f000,$faca,$bf00,$3718,$46bd,$bd80,$0000,$b580,$b084,$af00,
     $6078,$2310,$817b,$23fa,$b580,$b084,$af00,$6078,$2310,$817b,$23fa,$813b,$4b3c,$681b,$b29b,$2100,
     $4618,$f000,$fb15,$2001,$f000,$f972,$4b37,$681b,$b29b,$2101,$4618,$f000,$fb0b,$4835,$f000,$fa60,
     $2037,$f000,$f995,$2000,$f000,$f9be,$2000,$f000,$f9bb,$2000,$f000,$f9b8,$2000,$f000,$f9b5,$2000,
     $f000,$f9b2,$2040,$f000,$f9af,$2000,$f000,$f9ac,$2000,$f000,$f9a9,$2000,$f000,$f9a6,$2000,$f000,
     $f9a3,$203c,$f000,$f974,$2080,$f000,$f99d,$2022,$f000,$f96e,$20c0,$f000,$f997,$2020,$f000,$f968,
     $f000,$f948,$23f9,$2279,$2100,$2000,$f000,$f9b8,$2100,$2000,$f000,$f9fa,$2024,$f000,$f959,$2300,
     $81fb,$e019,$2300,$81bb,$e00f,$89ba,$89fb,$8979,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,
     $f000,$f972,$89bb,$3301,$81bb,$89ba,$897b,$429a,$d3eb,$89fb,$3301,$81fb,$89fa,$893b,$429a,$d3e1,
     $f000,$fac4,$bf00,$3710,$46bd,$bd80,$43a8,$2000,$0380,$2000,$b580,$af00,$2010,$f7ff,$fd41,$2001,
     $b580,$af00,$2010,$f000,$f923,$2001,$f000,$f94c,$2064,$f000,$f8ed,$bf00,$bd80,$0000,$b580,$af00,
     $4b0f,$681b,$b29b,$2101,$b480,$af00,$b403,$4906,$600d,$604e,$608f,$ea5f,$0008,$60c8,$bc03,$bf00,
     $46bd,$f85d,$7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,
     $60b9,$607a,$603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,$683b,$6013,$4a1a,$68bb,$6013,$4b1a,
     $2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,$f000,$fa80,$4b10,$681b,$b29b,$2101,
     $4618,$f000,$fa79,$4b0f,$681b,$b29b,$2101,$4618,$f000,$fa72,$4b0a,$681b,$b29b,$2100,$4618,$f000,
     $fa6b,$4b08,$681b,$b29b,$2101,$4618,$f000,$fa30,$bf00,$3710,$46bd,$bd80,$43a8,$2000,$43a0,$2000,
     $4394,$2000,$439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$4a80,$0040,
     $0000,$0000,$0000,$0000,$4a40,$0080,$0000,$0000,$0000,$0000,$4a80,$0040,$0000,$0000,$0000,$0000,
     $4a40,$0080,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$000f,$0000,$0000,$0f00,
     $0000,$000f,$0200,$000f,$0000,$0000,$0100,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$2222,$2222,$2222,$0000,$2200,$4117,$3200,$0036,$b580,$af00,
     $4b0f,$681b,$b29b,$2101,$4618,$f000,$f9c1,$2014,$f000,$f81e,$4b0a,$681b,$b29b,$2100,$4618,$f000,
     $f9b7,$2002,$f000,$f814,$4b05,$681b,$b29b,$2101,$4618,$f000,$f9ad,$2014,$f000,$f80a,$bf00,$bd80,
     $43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$6078,$6878,$f000,$f9f7,$bf00,
     $3708,$46bd,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$b580,$af00,$4b09,$681b,$b29b,$4618,
     $f000,$f9fa,$4603,$2b00,$d003,$200a,$f7ff,$ffe0,$e7f2,$bf00,$200a,$f7ff,$ffdb,$bf00,$bd80,$bf00,
     $4394,$2000,$b580,$af00,$2022,$f7ff,$ff97,$20c7,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,
     $2100,$4618,$f000,$f964,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f95d,$79fb,$4618,$f000,$f9e3,$4b06,
     $681b,$b29b,$2101,$4618,$f000,$f952,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,
     $af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2101,$4618,$f000,$f938,
     $4b0b,$681b,$b29b,$2100,$4618,$f000,$f931,$79fb,$4618,$f000,$f9b7,$4b06,$681b,$b29b,$2101,$4618,
     $f000,$f926,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$af00,$4b09,$681b,$b29b,$4618,
     $b590,$b083,$af00,$4604,$4608,$4611,$461a,$4623,$80fb,$4603,$80bb,$460b,$807b,$4613,$803b,$2044,
     $f7ff,$ff96,$88fb,$08db,$b29b,$b2db,$4618,$f7ff,$ffbb,$887b,$08db,$b29b,$b2db,$4618,$f7ff,$ffb4,
     $2045,$f7ff,$ff85,$88bb,$b2db,$4618,$f7ff,$ffac,$88bb,$0a1b,$b29b,$b2db,$4618,$f7ff,$ffa5,$883b,
     $b2db,$4618,$f7ff,$ffa0,$883b,$0a1b,$b29b,$b2db,$4618,$f7ff,$ff99,$bf00,$370c,$46bd,$bd90,$b580,
     $b082,$af00,$4603,$460a,$80fb,$4613,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$204e,$f7ff,
     $ff57,$88fb,$b2db,$4618,$f7ff,$ff7e,$204f,$f7ff,$ff4f,$88bb,$b2db,$4618,$f7ff,$ff76,$88bb,$0a1b,
     $b29b,$b2db,$4618,$f7ff,$ff6f,$bf00,$3708,$46bd,$bd80,$b580,$af00,$f7ff,$fe9c,$2064,$f7ff,$fb8d,
     $b580,$b082,$af00,$6078,$6878,$f000,$f945,$203f,$f7ff,$ff2e,$687b,$3399,$781b,$4618,$f7ff,$ff54,
     $2003,$f7ff,$ff25,$687b,$339a,$781b,$4618,$f7ff,$ff4b,$2004,$f7ff,$ff1c,$687b,$339b,$781b,$4618,
     $f7ff,$ff42,$687b,$339c,$781b,$4618,$f7ff,$ff3c,$687b,$339d,$781b,$4618,$f7ff,$ff36,$202c,$f7ff,
     $ff07,$687b,$339e,$781b,$4618,$f7ff,$ff2d,$bf00,$3708,$46bd,$bd80,$b590,$b083,$af00,$4604,$4608,
     $4611,$461a,$b580,$af00,$2022,$f7ff,$fef1,$20c7,$f7ff,$ff1a,$2020,$f7ff,$feeb,$f7ff,$fecb,$bf00,
     $bd80,$b580,$af00,$2022,$f7ff,$ff88,$200f,$f7ff,$4000,$0000,$0000,$0000,$0000,$0000,$8080,$0000,
     $0000,$0000,$0000,$0000,$4040,$0000,$0000,$0000,$0000,$0000,$8000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0014,$0000,$0000,$0100,$0000,$0000,$0000,$0001,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $2222,$2222,$2222,$0000,$2200,$4117,$3200,$0036,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,
     $88fa,$797b,$2b00,$bf14,$2301,$2300,$b2db,$4619,$4610,$f000,$f8b5,$bf00,$3708,$46bd,$bd80,$b580,
     $b082,$af00,$4603,$80fb,$88fb,$4618,$b580,$af00,$2022,$f7ff,$fe6d,$200f,$f7ff,$fe96,$2020,$f7ff,
     $fe67,$f7ff,$fe47,$bf00,$bd80,$b580,$b084,$af00,$6078,$2032,$f7ff,$ff77,$b580,$b082,$af00,$4603,
     $460a,$80fb,$4613,$80bb,$88fb,$4618,$f000,$f8a4,$88bb,$2b00,$d002,$88bb,$2b00,$d105,$88fb,$2100,
     $4618,$f000,$f8b5,$e005,$88fb,$2101,$4618,$f000,$f8af,$bf00,$bf00,$3708,$46bd,$bd80,$b580,$b082,
     $af00,$6078,$6878,$f7ff,$ff51,$bf00,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f8b4,
     $bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$b580,$b082,$af00,$4603,
     $80fb,$88fb,$4618,$f000,$f8bd,$4603,$4618,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$460a,$80fb,
     $4613,$80bb,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$010c,$2394,$2203,$2001,$f000,$f884,
     $bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$b580,$b084,$af00,$6078,
     $2032,$f7ff,$fde5,$2300,$73fb,$e009,$7bfb,$687a,$4413,$781b,$4618,$f7ff,$fe07,$7bfb,$3301,$73fb,
     $7bfb,$2b98,$d9f2,$f7ff,$fdb5,$bf00,$3710,$46bd,$bd80,$b580,$b082,$af00,$6078,$6878,$f7ff,$ffdc,
     $b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,
     $3714,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b082,$af00,$6078,
     $2100,$6878,$f000,$f814,$2100,$6878,$f7ff,$ffd8,$2105,$6878,$f000,$f864,$bf00,$3708,$46bd,$bd80,
     $b40f,$b580,$b082,$af00,$4809,$f002,$f99e,$693b,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,
     $78fb,$72fb,$68fb,$7afa,$ec42,$3044,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,
     $4603,$460a,$80fb,$4613,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,
     $687a,$68b9,$68f8,$47a0,$4603,$4618,$371c,$46bd,$bd90,$bf00,$4400,$2000,$b580,$b082,$af00,$6078,
     $6878,$239a,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,$2b00,$bf14,
     $2301,$2300,$b2db,$4618,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,
     $b580,$b08a,$af00,$6078,$460b,$70fb,$6878,$f000,$f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,
     $23c0,$617b,$69fb,$681a,$69bb,$405a,$697b,$4013,$69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,
     $6013,$bf00,$bf00,$490d,$78fa,$687b,$00db,$440b,$605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,
     $623b,$6a7b,$f503,$5340,$461a,$6a3b,$6013,$bf00,$bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,
     $b580,$b082,$af00,$6078,$2100,$6878,$b480,$b083,$af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,
     $b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
