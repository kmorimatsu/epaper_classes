rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:	EPD_7in5.c
rem * | Author      :   Waveshare team
rem * | Function    :   Electronic paper driver
rem * | Info        :
rem *----------------
rem * |	This version:   V2.0
rem * | Date        :   2018-11-09
rem * | Info        :
rem *****************************************************************************
rem #
rem # Permission is hereby granted, free of charge, to any person obtaining a copy
rem # of this software and associated documnetation files(the "Software"), to deal
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

method EPD_7IN5_V2_CLEAR
  goto C_EPD_7IN5_V2_CLEAR
method EPD_7IN5_V2_CLEARBLACK
  goto C_EPD_7IN5_V2_CLEARBLACK
method EPD_7IN5_V2_DISPLAY
  goto C_EPD_7IN5_V2_DISPLAY
method EPD_7IN5_V2_SLEEP
  goto C_EPD_7IN5_V2_SLEEP

method INIT
  var a,b,c,d
  GOSUB INIT_C
  spi 4000
  if args(0)<4 then
    a=8:b=9:c=12:d=13
  else
    a=args(1):b=args(2):c=args(3):d=args(4)
  endif
  gosub C_DEV_GPIO_INIT,a,b,c,d
return

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+740,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+884,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+888,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+892,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+896,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+900,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+904,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+992,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1080,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1084,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1172,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1176,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1276,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1896,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_7IN5_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f857,$b002,$bd00,$46c0
LABEL C_EPD_7IN5_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8a9,$b002,$bd00,$46c0
LABEL C_EPD_7IN5_V2_CLEARBLACK
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8e3,$b002,$bd00,$46c0
LABEL C_EPD_7IN5_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f91d,$b002,$bd00,$46c0
LABEL C_EPD_7IN5_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f96b,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f975,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f97d,$b002,$bd00,$46c0

REM 2276 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f9c8,$2001,$f000,$f9f1,$2007,$f000,$fa1c,$2007,$f000,$fa19,$203f,$f000,$fa16,
     $203f,$f000,$fa13,$2004,$f000,$f9e2,$2064,$f000,$fa3b,$f000,$fa4d,$2000,$f000,$f9da,$201f,$f000,
     $fa05,$2061,$f000,$f9d4,$2003,$f000,$f9ff,$2020,$f000,$f9fc,$2001,$f000,$f9f9,$20e0,$f000,$f9f6,
     $2015,$f000,$f9c5,$2000,$f000,$f9f0,$2050,$f000,$f9bf,$2010,$f000,$f9ea,$2000,$f000,$f9e7,$2060,
     $f000,$f9b6,$2022,$f000,$f9e1,$2065,$f000,$f9b0,$2000,$f000,$f9db,$2000,$f000,$f9d8,$2000,$f000,
     $f9d5,$2000,$f000,$f9d2,$2300,$0018,$46bd,$bd80,$b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,
     $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$0052,$801a,$2010,$f000,$f98b,$1dbb,$2200,$801a,
     $e007,$20ff,$f000,$f9b2,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1cbb,$881b,$1d39,$8809,$434b,
     $429a,$dbee,$2013,$f000,$f973,$1dbb,$2200,$801a,$e007,$2000,$f000,$f99a,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1cbb,$881b,$1d39,$8809,$434b,$429a,$dbee,$f000,$f9ea,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,
     $0052,$801a,$2010,$f000,$f943,$1dbb,$2200,$801a,$e007,$2000,$f000,$f96a,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1cbb,$881b,$1d39,$8809,$434b,$429a,$dbee,$2013,$f000,$f92b,$1dbb,$2200,$801a,
     $e007,$20ff,$f000,$f952,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1cbb,$881b,$1d39,$8809,$434b,
     $429a,$dbee,$f000,$f9a2,$46c0,$46bd,$b002,$bd80,$b580,$b088,$af00,$6078,$2364,$60fb,$23f0,$005b,
     $b580,$b088,$af00,$6078,$2364,$60fb,$23f0,$005b,$60bb,$2010,$f000,$f8fc,$2300,$61fb,$e017,$2300,
     $61bb,$e00d,$69fb,$68fa,$435a,$69bb,$18d3,$687a,$18d3,$781b,$0018,$f000,$f919,$69bb,$3301,$61bb,
     $69ba,$68fb,$429a,$d3ed,$69fb,$3301,$61fb,$69fa,$68bb,$429a,$d3e3,$2013,$f000,$f8da,$2300,$617b,
     $e019,$2300,$613b,$e00f,$697b,$68fa,$435a,$693b,$18d3,$687a,$18d3,$781b,$43db,$b2db,$0018,$f000,
     $f8f5,$693b,$3301,$613b,$693a,$68fb,$429a,$d3eb,$697b,$3301,$617b,$697a,$68bb,$429a,$d3e1,$f000,
     $f945,$46c0,$46bd,$b008,$bd80,$b580,$af00,$2002,$f7ff,$fe59,$f7ff,$fea7,$b580,$af00,$2002,$f000,
     $f8a7,$f000,$f915,$2007,$f000,$f8a2,$20a5,$f000,$f8cd,$46c0,$46bd,$bd80,$b580,$af00,$4b10,$681b,
     $b29b,$2101,$0018,$f7f6,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,
     $bd80,$0000,$43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,
     $603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,
     $4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f900,$4b10,$681b,$b29b,$2101,$0018,$f000,
     $f8f9,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f8f2,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f8eb,$4b08,
     $681b,$b29b,$2101,$0018,$f000,$f914,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,
     $435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,
     $b29b,$2101,$0018,$f000,$f8f5,$20c8,$f000,$f87c,$4b0b,$681b,$b29b,$2100,$0018,$f000,$f8eb,$2002,
     $f000,$f872,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8e1,$20c8,$f000,$f868,$46c0,$46bd,$bd80,$46c0,
     $4368,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,
     $b29b,$2100,$0018,$f000,$f8c5,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8be,$1dfb,$781b,$0018,$f000,
     $f8d9,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8b2,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,
     $0018,$f000,$f897,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f890,$1dfb,$781b,$0018,$f000,$f8ab,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f884,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,
     $2071,$f7ff,$ffab,$2014,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8aa,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$af00,$2071,$f7ff,$ff8b,$2014,$f7ff,$ffe4,
     $4b06,$681b,$b29b,$0018,$f000,$f8a6,$1e03,$d0f1,$2014,$f7ff,$ffd9,$46c0,$46bd,$bd80,$4354,$2000,
     $b580,$af00,$2012,$f7ff,$ff93,$2064,$b580,$af00,$2012,$f7ff,$ff6d,$2064,$f7ff,$ffc6,$f7ff,$ffd8,
     $46c0,$46bd,$bd80,$b580,$af00,$f7ff,$ff61,$2001,$f7ff,$ff84,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f88c,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,
     $1dbb,$881b,$2100,$0018,$f000,$f8a0,$e006,$1dbb,$881b,$2101,$0018,$f000,$f899,$46c0,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89c,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b084,$af00,$0002,$1dfb,$701a,
     $1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a4,$46c0,$46bd,$b004,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f88e,
     $46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1dbb,$881b,$0018,$f000,$f895,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1d3b,$1c0a,$b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,
     $061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,$f88b,$46c0,$46bd,$b002,$bd80,$0000,
     $b580,$af00,$4b04,$681b,$2202,$4013,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,
     $0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8a8,$e003,$68fb,$0018,$f000,$f8b7,$46c0,
     $46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,
     $701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8ac,$e003,$68fb,
     $0018,$f000,$f8bb,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b590,$b087,
     $af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,
     $46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,
     $b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,
     $f881,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,
     $4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,
     $00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,
     $23d0,$061b,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,
     $701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,
     $1cfb,$701a

REM 0 bytes
LABEL C_RODATA
