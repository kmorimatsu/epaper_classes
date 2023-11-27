rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_2in9b_V3.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.9inch e-paper b V3
rem * | Info        :
rem *----------------
rem * |	This version:   V1.1
rem * | Date        :   2020-12-03
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

method EPD_2IN9B_V3_INIT
  goto C_EPD_2IN9B_V3_INIT
method EPD_2IN9B_V3_CLEAR
  goto C_EPD_2IN9B_V3_CLEAR
method EPD_2IN9B_V3_DISPLAY
  goto C_EPD_2IN9B_V3_DISPLAY
method EPD_2IN9B_V3_SLEEP
  goto C_EPD_2IN9B_V3_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+692,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+836,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+840,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+844,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+848,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+852,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+856,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+944,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1032,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1036,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1124,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1212,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1216,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1836,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN9B_V3_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f849,$b002,$bd00,$46c0
LABEL C_EPD_2IN9B_V3_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f869,$b002,$bd00,$46c0
LABEL C_EPD_2IN9B_V3_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8c9,$b002,$bd00,$46c0
LABEL C_EPD_2IN9B_V3_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f953,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f95d,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f965,$b002,$bd00,$46c0

REM 2216 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f9b0,$2004,$f000,$f9d9,$f000,$fa05,$2000,$f000,$f9d4,$200f,$f000,$fa2b,$2089,
     $f000,$fa28,$2061,$f000,$f9cb,$2080,$f000,$fa22,$2001,$f000,$fa1f,$2028,$f000,$fa1c,$2050,$f000,
     $f9bf,$2077,$f000,$fa16,$46c0,$46bd,$bd80,$b580,$b084,$af00,$1dbb,$2210,$801a,$1d3b,$b580,$b084,
     $af00,$1dbb,$2210,$801a,$1d3b,$2294,$0052,$801a,$2010,$f000,$f9a5,$230e,$18fb,$2200,$801a,$e01a,
     $230c,$18fb,$2200,$801a,$e008,$20ff,$f000,$f9f2,$210c,$187b,$881a,$187b,$3201,$801a,$230c,$18fa,
     $1dbb,$8812,$881b,$429a,$d3ef,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$1d3b,$8812,$881b,
     $429a,$d3dd,$2013,$f000,$f97b,$230a,$18fb,$2200,$801a,$e01a,$2308,$18fb,$2200,$801a,$e008,$20ff,
     $f000,$f9c8,$2108,$187b,$881a,$187b,$3201,$801a,$2308,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210a,
     $187b,$881a,$187b,$3201,$801a,$230a,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$2012,$f000,$f951,$f000,
     $f97d,$46c0,$46bd,$b004,$bd80,$b590,$b087,$af00,$6078,$6039,$230e,$18fb,$b590,$b087,$af00,$6078,
     $6039,$230e,$18fb,$2210,$801a,$230c,$18fb,$2294,$0052,$801a,$2010,$f000,$f933,$2316,$18fb,$2200,
     $801a,$e029,$2314,$18fb,$2200,$801a,$e016,$2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,
     $434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f971,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,
     $230e,$18fb,$8812,$881b,$429a,$d3e0,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,
     $8812,$881b,$429a,$d3cd,$2092,$f000,$f8f9,$2013,$f000,$f8f6,$2312,$18fb,$2200,$801a,$e029,$2310,
     $18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,
     $683b,$189b,$781b,$0018,$f000,$f934,$193b,$881a,$193b,$3201,$801a,$2310,$18fa,$230e,$18fb,$8812,
     $881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,$801a,$2312,$18fa,$230c,$18fb,$8812,$881b,$429a,
     $d3cd,$2092,$f000,$f8bc,$2012,$f000,$f8b9,$f000,$f8e5,$46c0,$46bd,$b007,$bd90,$b580,$af00,$2002,
     $f7ff,$fe66,$f7ff,$feb4,$b580,$af00,$2002,$f000,$f8a7,$f000,$f8d3,$2007,$f000,$f8a2,$20a5,$f000,
     $f8f9,$46c0,$46bd,$bd80,$0000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$b580,$af00,$b403,$4905,
     $600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43ec,$2000,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,
     $683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,
     $f000,$f8e6,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8df,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f8d8,
     $4b0a,$681b,$b29b,$2100,$0018,$f000,$f8d1,$4b08,$681b,$b29b,$2101,$0018,$f000,$f8fa,$46c0,$46bd,
     $b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,
     $2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8db,$20c8,$f000,$f8f8,
     $4b0b,$681b,$b29b,$2100,$0018,$f000,$f8d1,$2002,$f000,$f8ee,$4b06,$681b,$b29b,$2101,$0018,$f000,
     $f8c7,$20c8,$f000,$f8e4,$46c0,$46bd,$bd80,$46c0,$4368,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f8ab,$4b0c,$681b,$b29b,
     $2100,$0018,$f000,$f8a4,$1dfb,$781b,$0018,$f000,$f8d3,$4b06,$681b,$b29b,$2101,$0018,$f000,$f898,
     $46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b590,$b083,
     $af00,$2071,$f7ff,$ffcc,$4b0e,$681b,$b29b,$1dfc,$0018,$f000,$f8cd,$0003,$7023,$1dfb,$781b,$2201,
     $4013,$425a,$4153,$b2da,$1dfb,$701a,$1dfb,$781b,$2b00,$d1e6,$20c8,$f000,$f88b,$46c0,$46bd,$b003,
     $bd90,$46c0,$4354,$2000,$b580,$af00,$f7ff,$ff60,$2004,$f7ff,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $4b0e,$681b,$b29b,$2101,$0018,$f000,$f851,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f84a,$1dfb,$781b,
     $0018,$f000,$f879,$4b06,$681b,$b29b,$2101,$0018,$f000,$f83e,$46c0,$46bd,$b002,$bd80,$4360,$2000,
     $435c,$2000,$b590,$b083,$af00,$2071,$f7ff,$ffaa,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,
     $801a,$1dbb,$881b,$0018,$f000,$f88a,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,
     $2100,$0018,$f000,$f89e,$e006,$1dbb,$881b,$2101,$0018,$f000,$f897,$46c0,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,
     $701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89a,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8aa,
     $46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b084,$af00,$0002,
     $1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a4,$46c0,$46bd,$b004,$bd80,
     $b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,
     $0018,$f000,$f8ab,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,
     $b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,
     $000a,$619a,$687b,$2105,$0018,$f000,$f8a1,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,
     $2202,$4013,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,
     $2b00,$d004,$68fb,$0018,$f000,$f8be,$e003,$68fb,$0018,$f000,$f8cd,$46c0,$46bd,$b004,$bd80,$b580,
     $b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,
     $0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8c2,$e003,$68fb,$0018,$f000,$f8d1,$46c0,
     $46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b082,$af00,$6078,$6878,$239a,
     $2200,$2100,$f000,$f80c,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,
     $b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,
     $0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,
     $af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,
     $bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,
     $0018,$f000,$f881,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,
     $4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,
     $781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,
     $af00,$6078,$23d0,$061b,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,
     $46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b088,$af00,
     $6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
