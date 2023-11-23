rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:	EPD_7IN5B_V2.c
rem * | Author      :   Waveshare team
rem * | Function    :   Electronic paper driver
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2020-11-30
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

method EPD_7IN5B_V2_INIT
  goto C_EPD_7IN5B_V2_INIT
method EPD_7IN5B_V2_CLEAR
  goto C_EPD_7IN5B_V2_CLEAR
method EPD_7IN5B_V2_CLEARRED
  goto C_EPD_7IN5B_V2_CLEARRED
method EPD_7IN5B_V2_CLEARBLACK
  goto C_EPD_7IN5B_V2_CLEARBLACK
method EPD_7IN5B_V2_DISPLAY
  goto C_EPD_7IN5B_V2_DISPLAY
method EPD_7IN5B_V2_SLEEP
  goto C_EPD_7IN5B_V2_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+888,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1032,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1036,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1040,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1044,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1048,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1052,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1140,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1228,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1232,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1320,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1324,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1420,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2040,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_7IN5B_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f865,$b002,$bd00,$46c0
LABEL C_EPD_7IN5B_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8b7,$b002,$bd00,$46c0
LABEL C_EPD_7IN5B_V2_CLEARRED
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8f1,$b002,$bd00,$46c0
LABEL C_EPD_7IN5B_V2_CLEARBLACK
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f92b,$b002,$bd00,$46c0
LABEL C_EPD_7IN5B_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f965,$b002,$bd00,$46c0
LABEL C_EPD_7IN5B_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9b5,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9bf,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9c7,$b002,$bd00,$46c0

REM 2420 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fa12,$2001,$f000,$fa3b,$2007,$f000,$fa66,$2007,$f000,$fa63,$203f,$f000,$fa60,
     $203f,$f000,$fa5d,$2004,$f000,$fa2c,$2064,$f000,$fa85,$f000,$fa97,$2000,$f000,$fa24,$200f,$f000,
     $fa4f,$2061,$f000,$fa1e,$2003,$f000,$fa49,$2020,$f000,$fa46,$2001,$f000,$fa43,$20e0,$f000,$fa40,
     $2015,$f000,$fa0f,$2000,$f000,$fa3a,$2050,$f000,$fa09,$2011,$f000,$fa34,$2007,$f000,$fa31,$2060,
     $f000,$fa00,$2022,$f000,$fa2b,$2065,$f000,$f9fa,$2000,$f000,$fa25,$2000,$f000,$fa22,$2000,$f000,
     $fa1f,$2000,$f000,$fa1c,$2300,$0018,$46bd,$bd80,$b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,
     $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$0052,$801a,$2010,$f000,$f9d5,$1dbb,$2200,$801a,
     $e007,$20ff,$f000,$f9fc,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,
     $429a,$dbee,$2013,$f000,$f9bd,$1dbb,$2200,$801a,$e007,$2000,$f000,$f9e4,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,$429a,$dbee,$f000,$fa32,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,
     $0052,$801a,$2010,$f000,$f98d,$1dbb,$2200,$801a,$e007,$20ff,$f000,$f9b4,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,$429a,$dbee,$2013,$f000,$f975,$1dbb,$2200,$801a,
     $e007,$20ff,$f000,$f99c,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,
     $429a,$dbee,$f000,$f9ea,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,
     $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$0052,$801a,$2010,$f000,$f945,$1dbb,$2200,$801a,
     $e007,$2000,$f000,$f96c,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,
     $429a,$dbee,$2013,$f000,$f92d,$1dbb,$2200,$801a,$e007,$2000,$f000,$f954,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,$429a,$dbee,$f000,$f9a2,$46c0,$46bd,$b002,$bd80,
     $b580,$b088,$af00,$6078,$6039,$2364,$60fb,$23f0,$b580,$b088,$af00,$6078,$6039,$2364,$60fb,$23f0,
     $005b,$60bb,$2010,$f000,$f8fd,$2300,$61fb,$e017,$2300,$61bb,$e00d,$69fb,$68fa,$435a,$69bb,$18d3,
     $687a,$18d3,$781b,$0018,$f000,$f91a,$69bb,$3301,$61bb,$69ba,$68fb,$429a,$d3ed,$69fb,$3301,$61fb,
     $69fa,$68bb,$429a,$d3e3,$2013,$f000,$f8db,$2300,$617b,$e019,$2300,$613b,$e00f,$697b,$68fa,$435a,
     $693b,$18d3,$683a,$18d3,$781b,$43db,$b2db,$0018,$f000,$f8f6,$693b,$3301,$613b,$693a,$68fb,$429a,
     $d3eb,$697b,$3301,$617b,$697a,$68bb,$429a,$d3e1,$f000,$f944,$46c0,$46bd,$b008,$bd80,$b580,$af00,
     $2002,$f7ff,$fe1a,$f7ff,$fe68,$2007,$b580,$af00,$2002,$f000,$f8a7,$f000,$f915,$2007,$f000,$f8a2,
     $20a5,$f000,$f8cd,$46c0,$46bd,$bd80,$b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$b580,$af00,
     $b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43ec,$2000,$b590,$b087,
     $af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,
     $601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,
     $2101,$0018,$f000,$f8fe,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8f7,$4b0f,$681b,$b29b,$2101,$0018,
     $f000,$f8f0,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f8e9,$4b08,$681b,$b29b,$2101,$0018,$f000,$f912,
     $46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,$4364,$2000,
     $b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8f3,$20c8,
     $f000,$f87c,$4b0b,$681b,$b29b,$2100,$0018,$f000,$f8e9,$2002,$f000,$f872,$4b06,$681b,$b29b,$2101,
     $0018,$f000,$f8df,$20c8,$f000,$f868,$46c0,$46bd,$bd80,$46c0,$4368,$2000,$b580,$b082,$af00,$0002,
     $1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f8c3,$4b0c,
     $681b,$b29b,$2100,$0018,$f000,$f8bc,$1dfb,$781b,$0018,$f000,$f8d7,$4b06,$681b,$b29b,$2101,$0018,
     $f000,$f8b0,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,$f895,$4b0c,$681b,$b29b,
     $2100,$0018,$f000,$f88e,$1dfb,$781b,$0018,$f000,$f8a9,$4b06,$681b,$b29b,$2101,$0018,$f000,$f882,
     $46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,$2014,$f7f6,$fb9a,$4b07,$b580,$b082,
     $af00,$6078,$687b,$0018,$f000,$f8a8,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,
     $607a,$603b,$b580,$af00,$2014,$f7ff,$ffe7,$4b07,$681b,$b29b,$0018,$f000,$f8a7,$1e03,$d0f4,$2014,
     $f7ff,$ffdc,$46c0,$46bd,$bd80,$46c0,$4354,$2000,$b580,$af00,$2012,$f7ff,$ff95,$2064,$b580,$af00,
     $2012,$f7ff,$ff6f,$2064,$f7ff,$ffc8,$f7ff,$ffda,$46c0,$46bd,$bd80,$b580,$af00,$f7ff,$ff63,$2001,
     $f7ff,$ff86,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f88c,
     $1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f8a0,$e006,$1dbb,
     $881b,$2101,$0018,$f000,$f899,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,
     $f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,
     $418b,$b2db,$0019,$0010,$f000,$f89c,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1dbb,$881b,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,
     $f000,$f8a4,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,
     $af00,$6078,$6878,$239a,$2200,$2100,$f000,$f88e,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,
     $1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f895,$0003,
     $0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,
     $0018,$f000,$f88b,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,$2202,$4013,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,
     $f000,$f8a8,$e003,$68fb,$0018,$f000,$f8b7,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,
     $801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,
     $2b00,$d004,$68fb,$0018,$f000,$f8ac,$e003,$68fb,$0018,$f000,$f8bb,$46c0,$46bd,$b004,$bd80,$b580,
     $b082,$af00,$6078,$23d0,$061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,
     $683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,
     $af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,
     $1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b088,
     $af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f881,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,
     $61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,
     $68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,
     $c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,
     $701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,
     $b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
