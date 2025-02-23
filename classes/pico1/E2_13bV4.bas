rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:  	EPD_2IN13b_V4.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.13inch e-paper B V4
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2022-04-25
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

method EPD_2IN13B_V4_INIT
  goto C_EPD_2IN13B_V4_INIT
method EPD_2IN13B_V4_CLEAR
  goto C_EPD_2IN13B_V4_CLEAR
method EPD_2IN13B_V4_DISPLAY
  goto C_EPD_2IN13B_V4_DISPLAY
method EPD_2IN13B_V4_SLEEP
  goto C_EPD_2IN13B_V4_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+712,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+856,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+860,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+864,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+868,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+872,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+876,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+964,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1024,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1112,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1116,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1204,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1208,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2160,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN13B_V4_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f849,$b002,$bd00,$46c0
LABEL C_EPD_2IN13B_V4_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f883,$b002,$bd00,$46c0
LABEL C_EPD_2IN13B_V4_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8df,$b002,$bd00,$46c0
LABEL C_EPD_2IN13B_V4_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f95f,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f967,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f96f,$b002,$bd00,$46c0

REM 2492 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f9ba,$f000,$f9e4,$2012,$f000,$f9ff,$f000,$f9df,$2001,$f000,$f9fa,$20f9,$f000,
     $fa25,$2000,$f000,$fa22,$2000,$f000,$fa1f,$2011,$f000,$f9ee,$2003,$f000,$fa19,$23f9,$2279,$2100,
     $2000,$f000,$fa41,$2100,$2000,$f000,$fa8d,$203c,$f000,$f9de,$2005,$f000,$fa09,$2018,$f000,$f9d8,
     $2080,$f000,$fa03,$2021,$f000,$f9d2,$2080,$f000,$f9fd,$2080,$f000,$f9fa,$f000,$f9ac,$46c0,$46bd,
     $bd80,$b580,$b084,$af00,$1dbb,$2210,$801a,$1d3b,$b580,$b084,$af00,$1dbb,$2210,$801a,$1d3b,$22fa,
     $801a,$2024,$f000,$f9b4,$230e,$18fb,$2200,$801a,$e01a,$230c,$18fb,$2200,$801a,$e008,$20ff,$f000,
     $f9d5,$210c,$187b,$881a,$187b,$3201,$801a,$230c,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210e,$187b,
     $881a,$187b,$3201,$801a,$230e,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$2026,$f000,$f98a,$230a,$18fb,
     $2200,$801a,$e01a,$2308,$18fb,$2200,$801a,$e008,$20ff,$f000,$f9ab,$2108,$187b,$881a,$187b,$3201,
     $801a,$2308,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210a,$187b,$881a,$187b,$3201,$801a,$230a,$18fa,
     $1d3b,$8812,$881b,$429a,$d3dd,$f000,$fa3b,$46c0,$46bd,$b004,$bd80,$b590,$b087,$af00,$6078,$6039,
     $230e,$18fb,$b590,$b087,$af00,$6078,$6039,$230e,$18fb,$2210,$801a,$230c,$18fb,$22fa,$801a,$2024,
     $f000,$f946,$2316,$18fb,$2200,$801a,$e029,$2314,$18fb,$2200,$801a,$e016,$2414,$193b,$881a,$2316,
     $18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f958,$193b,$881a,
     $193b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2116,$187b,$881a,$187b,$3201,
     $801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$2026,$f000,$f90c,$2312,$18fb,$2200,$801a,
     $e029,$2310,$18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,$18fb,$881b,$210e,$1879,$8809,$434b,
     $18d3,$001a,$683b,$189b,$781b,$0018,$f000,$f91e,$193b,$881a,$193b,$3201,$801a,$2310,$18fa,$230e,
     $18fb,$8812,$881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,$801a,$2312,$18fa,$230c,$18fb,$8812,
     $881b,$429a,$d3cd,$f000,$f9ad,$46c0,$46bd,$b007,$bd90,$b580,$af00,$2010,$f7ff,$fdee,$2001,$f7ff,
     $b580,$af00,$2010,$f000,$f8c3,$2001,$f000,$f8ee,$2064,$f000,$f9a9,$46c0,$46bd,$bd80,$0000,$b580,
     $af00,$4b10,$681b,$b29b,$2101,$0018,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,
     $46c0,$46bd,$bd80,$0000,$43b8,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,
     $60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,
     $2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f97c,$4b10,$681b,$b29b,$2101,
     $0018,$f000,$f975,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f96e,$4b0a,$681b,$b29b,$2100,$0018,$f000,
     $f967,$4b08,$681b,$b29b,$2101,$0018,$f000,$f990,$46c0,$46bd,$b004,$bd80,$4380,$2000,$4378,$2000,
     $436c,$2000,$4374,$2000,$4370,$2000,$437c,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,
     $4b10,$681b,$b29b,$2101,$0018,$f000,$f971,$2014,$f000,$f92a,$4b0b,$681b,$b29b,$2100,$0018,$f000,
     $f967,$2002,$f000,$f920,$4b06,$681b,$b29b,$2101,$0018,$f000,$f95d,$2014,$f000,$f916,$46c0,$46bd,
     $bd80,$46c0,$4380,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$af00,$4b09,$681b,$b29b,$0018,
     $f000,$f966,$1e03,$d003,$2014,$f000,$f8fd,$e7f3,$46c0,$2014,$f000,$f8f8,$46c0,$46bd,$bd80,$46c0,
     $436c,$2000,$b580,$af00,$2020,$f7ff,$ff93,$f7ff,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,
     $b29b,$2100,$0018,$f000,$f923,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f91c,$1dfb,$781b,$0018,$f000,
     $f94f,$4b06,$681b,$b29b,$2101,$0018,$f000,$f910,$46c0,$46bd,$b002,$bd80,$4378,$2000,$4374,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,
     $0018,$f000,$f8f5,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8ee,$1dfb,$781b,$0018,$f000,$f921,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f8e2,$46c0,$46bd,$b002,$bd80,$4378,$2000,$4374,$2000,$b580,$af00,
     $4b09,$681b,$b29b,$0018,$b5b0,$b082,$af00,$0005,$000c,$0010,$0019,$1dbb,$1c2a,$801a,$1d3b,$1c22,
     $801a,$1cbb,$1c02,$801a,$003b,$1c0a,$801a,$2044,$f7ff,$ff8e,$1dbb,$881b,$08db,$b29b,$b2db,$0018,
     $f7ff,$ffb4,$1cbb,$881b,$08db,$b29b,$b2db,$0018,$f7ff,$ffac,$2045,$f7ff,$ff7b,$1d3b,$881b,$b2db,
     $0018,$f7ff,$ffa3,$1d3b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff9b,$003b,$881b,$b2db,$0018,$f7ff,
     $ff95,$003b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff8d,$46c0,$46bd,$b002,$bdb0,$b580,$b082,$af00,
     $0002,$1dbb,$801a,$1d3b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$204e,$f7ff,$ff48,
     $1dbb,$881b,$b2db,$0018,$f7ff,$ff70,$204f,$f7ff,$ff3f,$1d3b,$881b,$b2db,$0018,$f7ff,$ff67,$1d3b,
     $881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff5f,$46c0,$46bd,$b002,$bd80,$b580,$af00,$f7ff,$fef4,$f7ff,
     $ff68,$2012,$b580,$af00,$2020,$f7ff,$ff21,$f7ff,$ff01,$46c0,$46bd,$bd80,$b5b0,$b082,$af00,$0005,
     $000c,$0010,$0019,$1dbb,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f890,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,
     $801a,$1dbb,$881b,$0018,$f000,$f88c,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,
     $2100,$0018,$f000,$f89c,$e006,$1dbb,$881b,$2101,$0018,$f000,$f895,$46c0,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,
     $701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f898,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,
     $0018,$f000,$f8a5,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,
     $b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a2,
     $46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,$b580,$b082,$af00,$6078,
     $6878,$239a,$2200,$2100,$f000,$f88c,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,
     $1dfb,$781b,$b580,$b082,$af00,$6078,$687b,$2100,$0018,$f000,$f815,$687b,$2100,$0018,$f000,$f834,
     $687b,$2105,$0018,$f000,$f88b,$46c0,$46bd,$b002,$bd80,$0000,$b40f,$b580,$b082,$af00,$4b0b,$0018,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,
     $68fb,$0018,$f000,$f8aa,$e003,$68fb,$0018,$f000,$f8b9,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,
     $0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,
     $1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8ae,$e003,$68fb,$0018,$f000,$f8bd,$46c0,$46bd,$b004,
     $bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,
     $687a,$4091,$000a,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,
     $061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,
     $697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43b8,$2000,$b580,$b082,$af00,$6078,$6878,$239a,
     $b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f883,$687b,$009b,$4a13,$4694,$4463,
     $61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,
     $0152,$4694,$4463,$68fa,$601a,$46c0,$46c0,$4907,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,
     $46bd,$b008,$bd80,$46c0,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$687b,$2100,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,
     $af00,$6078,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a

REM 0 bytes
LABEL C_RODATA
