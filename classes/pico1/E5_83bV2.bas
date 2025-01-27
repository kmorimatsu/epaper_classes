rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:	EPD_5in83b_V2.c
rem * | Author      :   Waveshare team
rem * | Function    :   Electronic paper driver
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2020-07-04
rem * | Info        :
rem ******************************************************************************
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

method EPD_5IN83B_V2_INIT
  goto C_EPD_5IN83B_V2_INIT
method EPD_5IN83B_V2_CLEAR
  goto C_EPD_5IN83B_V2_CLEAR
method EPD_5IN83B_V2_DISPLAY
  goto C_EPD_5IN83B_V2_DISPLAY
method EPD_5IN83B_V2_SLEEP
  goto C_EPD_5IN83B_V2_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+568,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+712,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+716,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+720,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+724,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+728,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+732,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+820,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+908,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+912,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1000,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1004,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1132,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1744,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_5IN83B_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f849,$b002,$bd00,$46c0
LABEL C_EPD_5IN83B_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f88b,$b002,$bd00,$46c0
LABEL C_EPD_5IN83B_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8c5,$b002,$bd00,$46c0
LABEL C_EPD_5IN83B_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f915,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f91f,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f927,$b002,$bd00,$46c0

REM 2128 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f972,$2001,$f000,$f99b,$2007,$f000,$f9c6,$2007,$f000,$f9c3,$203f,$f000,$f9c0,
     $203f,$f000,$f9bd,$2004,$f000,$f98c,$2064,$f000,$f9e5,$f000,$f9f7,$2000,$f000,$f984,$200f,$f000,
     $f9af,$2061,$f000,$f97e,$2002,$f000,$f9a9,$2088,$f000,$f9a6,$2001,$f000,$f9a3,$20e0,$f000,$f9a0,
     $2015,$f000,$f96f,$2000,$f000,$f99a,$2050,$f000,$f969,$2011,$f000,$f994,$2007,$f000,$f991,$2060,
     $f000,$f960,$2022,$f000,$f98b,$2300,$0018,$46bd,$bd80,$b580,$b082,$af00,$1d3b,$2251,$801a,$1cbb,
     $b580,$b082,$af00,$1d3b,$2251,$801a,$1cbb,$22f0,$0052,$801a,$2010,$f000,$f945,$1dbb,$2200,$801a,
     $e007,$20ff,$f000,$f96c,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,
     $429a,$dbee,$2013,$f000,$f92d,$1dbb,$2200,$801a,$e007,$2000,$f000,$f954,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,$429a,$dbee,$f000,$f9b2,$46c0,$46bd,$b002,$bd80,
     $b580,$b088,$af00,$6078,$6039,$2351,$60fb,$23f0,$b580,$b088,$af00,$6078,$6039,$2351,$60fb,$23f0,
     $005b,$60bb,$2010,$f000,$f8fd,$2300,$61fb,$e017,$2300,$61bb,$e00d,$69fb,$68fa,$435a,$69bb,$18d3,
     $687a,$18d3,$781b,$0018,$f000,$f91a,$69bb,$3301,$61bb,$69ba,$68fb,$429a,$d3ed,$69fb,$3301,$61fb,
     $69fa,$68bb,$429a,$d3e3,$2013,$f000,$f8db,$2300,$617b,$e019,$2300,$613b,$e00f,$697b,$68fa,$435a,
     $693b,$18d3,$683a,$18d3,$781b,$43db,$b2db,$0018,$f000,$f8f6,$693b,$3301,$613b,$693a,$68fb,$429a,
     $d3eb,$697b,$3301,$617b,$697a,$68bb,$429a,$d3e1,$f000,$f954,$46c0,$46bd,$b008,$bd80,$b580,$af00,
     $2002,$f7ff,$fe99,$f7ff,$fee7,$2007,$b580,$af00,$2002,$f000,$f8a7,$f000,$f915,$2007,$f000,$f8a2,
     $20a5,$f000,$f8cd,$46c0,$46bd,$bd80,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f7f6,$b580,$af00,
     $b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43b8,$2000,$b590,$b087,
     $af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,
     $601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,
     $2101,$0018,$f000,$f90e,$4b10,$681b,$b29b,$2101,$0018,$f000,$f907,$4b0f,$681b,$b29b,$2101,$0018,
     $f000,$f900,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f8f9,$4b08,$681b,$b29b,$2101,$0018,$f000,$f922,
     $46c0,$46bd,$b004,$bd80,$4380,$2000,$4378,$2000,$436c,$2000,$4374,$2000,$4370,$2000,$437c,$2000,
     $b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f903,$20c8,
     $f000,$f87c,$4b0b,$681b,$b29b,$2100,$0018,$f000,$f8f9,$2001,$f000,$f872,$4b06,$681b,$b29b,$2101,
     $0018,$f000,$f8ef,$20c8,$f000,$f868,$46c0,$46bd,$bd80,$46c0,$4380,$2000,$b580,$b082,$af00,$0002,
     $1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f8d3,$4b0c,
     $681b,$b29b,$2100,$0018,$f000,$f8cc,$1dfb,$781b,$0018,$f000,$f8e7,$4b06,$681b,$b29b,$2101,$0018,
     $f000,$f8c0,$46c0,$46bd,$b002,$bd80,$4378,$2000,$4374,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f8a5,$4b0c,$681b,$b29b,
     $2101,$0018,$f000,$f89e,$1dfb,$781b,$0018,$f000,$f8b9,$4b05,$681b,$b29b,$2101,$0018,$f000,$f892,
     $46c0,$46bd,$b002,$bd80,$4374,$2000,$4378,$2000,$b590,$b083,$af00,$2071,$f7ff,$ffaa,$b580,$b082,
     $af00,$6078,$687b,$0018,$f000,$f8b8,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,
     $607a,$603b,$b590,$b083,$af00,$2071,$f7ff,$ff8a,$4b0e,$681b,$b29b,$1dfc,$0018,$f000,$f8b5,$0003,
     $7023,$1dfb,$781b,$2201,$4013,$425a,$4153,$b2da,$1dfb,$701a,$1dfb,$781b,$2b00,$d1e6,$20c8,$f7ff,
     $ffcd,$46c0,$46bd,$b003,$bd90,$46c0,$436c,$2000,$b580,$af00,$2012,$f7ff,$ff85,$2064,$b580,$af00,
     $2012,$f7ff,$ff5f,$2064,$f7ff,$ffb8,$f7ff,$ffca,$46c0,$46bd,$bd80,$b580,$af00,$f7ff,$ff53,$2001,
     $f7ff,$ff76,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f88c,
     $1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f89c,$e006,$1dbb,
     $881b,$2101,$0018,$f000,$f895,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,
     $f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,
     $418b,$b2db,$0019,$0010,$f000,$f898,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1dbb,$881b,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,
     $f000,$f8a0,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,$b580,$b082,
     $af00,$6078,$6878,$239a,$2200,$2100,$f000,$f88a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,
     $1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f891,$0003,
     $0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b082,$af00,$6078,
     $687b,$2100,$0018,$f000,$f815,$687b,$2100,$0018,$f000,$f834,$687b,$2105,$0018,$f000,$f88b,$46c0,
     $46bd,$b002,$bd80,$0000,$b40f,$b580,$b082,$af00,$4b0b,$0018,$b580,$b084,$af00,$6078,$000a,$1cfb,
     $701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8aa,$e003,$68fb,
     $0018,$f000,$f8b9,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,
     $f000,$f8ae,$e003,$68fb,$0018,$f000,$f8bd,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,
     $061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,
     $697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43b8,$2000,$b580,$b082,$af00,$6078,$6878,$239a,
     $b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,$687a,$4091,$000a,$4013,$1e5a,$4193,$b2db,$0018,
     $46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b088,$af00,$6078,$000a,$1cfb,
     $701a,$687b,$0018,$f000,$f883,$687b,$009b,$4a13,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,
     $681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4694,$4463,$68fa,$601a,$46c0,
     $46c0,$4907,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$46c0,$c004,$4001,
     $4000,$4001,$b580,$b082,$af00,$6078,$687b,$2100,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,
     $46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a

REM 0 bytes
LABEL C_RODATA
