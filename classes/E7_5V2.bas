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
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+548,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+692,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+696,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+700,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+704,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+708,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+712,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+800,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+804,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+892,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+896,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+996,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1572,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_7IN5_V2_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f82a,$bd00,$46c0
LABEL C_EPD_7IN5_V2_CLEARBLACK
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f86a,$bd00,$46c0
LABEL C_EPD_7IN5_V2_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8aa,$bd00,$46c0
LABEL C_EPD_7IN5_V2_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8fe,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f90e,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f91c,$bd00,$46c0

REM 1996 bytes
LABEL C_FUNCTIONS
EXEC $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$0052,$801a,$2010,$f000,$f95f,$1dbb,$2200,$801a,
     $e007,$20ff,$f000,$f986,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1cbb,$881b,$1d39,$8809,$434b,
     $429a,$dbee,$2013,$f000,$f947,$1dbb,$2200,$801a,$e007,$2000,$f000,$f96e,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1cbb,$881b,$1d39,$8809,$434b,$429a,$dbee,$f000,$f98c,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,
     $0052,$801a,$2010,$f000,$f917,$1dbb,$2200,$801a,$e007,$2000,$f000,$f93e,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1cbb,$881b,$1d39,$8809,$434b,$429a,$dbee,$2013,$f000,$f8ff,$1dbb,$2200,$801a,
     $e007,$20ff,$f000,$f926,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1cbb,$881b,$1d39,$8809,$434b,
     $429a,$dbee,$f000,$f944,$46c0,$46bd,$b002,$bd80,$b580,$b088,$af00,$6078,$2364,$60fb,$23f0,$005b,
     $b580,$b088,$af00,$6078,$2364,$60fb,$23f0,$005b,$60bb,$2010,$f000,$f8d0,$2300,$61fb,$e017,$2300,
     $61bb,$e00d,$69fb,$68fa,$435a,$69bb,$18d3,$687a,$18d3,$781b,$0018,$f000,$f8ed,$69bb,$3301,$61bb,
     $69ba,$68fb,$429a,$d3ed,$69fb,$3301,$61fb,$69fa,$68bb,$429a,$d3e3,$2013,$f000,$f8ae,$2300,$617b,
     $e019,$2300,$613b,$e00f,$697b,$68fa,$435a,$693b,$18d3,$687a,$18d3,$781b,$43db,$b2db,$0018,$f000,
     $f8c9,$693b,$3301,$613b,$693a,$68fb,$429a,$d3eb,$697b,$3301,$617b,$697a,$68bb,$429a,$d3e1,$f000,
     $f8e7,$46c0,$46bd,$b008,$bd80,$b580,$af00,$2002,$f7ff,$feb1,$f7ff,$feff,$b580,$af00,$2002,$f000,
     $f87b,$f000,$f8e9,$2007,$f000,$f876,$20a5,$f000,$f8a1,$46c0,$46bd,$bd80,$b580,$b082,$af00,$0002,
     $1dfb,$701a,$4b0e,$681b,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,
     $bd80,$0000,$43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,
     $603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,
     $4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f8c0,$4b10,$681b,$b29b,$2101,$0018,$f000,
     $f8b9,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f8b2,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f8ab,$4b08,
     $681b,$b29b,$2101,$0018,$f000,$f8d4,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,
     $435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$b082,$af00,$0002,
     $1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f8b1,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8aa,
     $1dfb,$781b,$0018,$f000,$f8c5,$4b06,$681b,$b29b,$2101,$0018,$f000,$f89e,$46c0,$46bd,$b002,$bd80,
     $4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $4b0e,$681b,$b29b,$2101,$0018,$f000,$f883,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f87c,$1dfb,$781b,
     $0018,$f000,$f897,$4b06,$681b,$b29b,$2101,$0018,$f000,$f870,$46c0,$46bd,$b002,$bd80,$4360,$2000,
     $435c,$2000,$b580,$af00,$2071,$f7ff,$ffab,$2014,$b580,$af00,$2012,$f7ff,$ff9f,$2064,$f000,$f896,
     $f000,$f80a,$46c0,$46bd,$bd80,$b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$b580,$af00,$2071,$f7ff,
     $ff8b,$2014,$f000,$f882,$4b06,$681b,$b29b,$0018,$f000,$f890,$1e03,$d0f1,$2014,$f000,$f877,$46c0,
     $46bd,$bd80,$4354,$2000,$b580,$af00,$2012,$f7ff,$ff93,$2064,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f88a,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,
     $1dbb,$881b,$2100,$0018,$f000,$f89e,$e006,$1dbb,$881b,$2101,$0018,$f000,$f897,$46c0,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89a,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b084,$af00,$0002,$1dfb,$701a,
     $1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a2,$46c0,$46bd,$b004,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8ac,$46c0,$46bd,
     $b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1dbb,$881b,$0018,$f000,$f8ab,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1d3b,$1c0a,$b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,
     $687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,$f8a1,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,
     $4b04,$681b,$2202,$4013,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,
     $1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8be,$e003,$68fb,$0018,$f000,$f8cd,$46c0,$46bd,$b004,
     $bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8c2,$e003,$68fb,$0018,$f000,
     $f8d1,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,
     $bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$6878,$239a,
     $2200,$2100,$f7ff,$ffd8,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,
     $b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,$1e5a,$4193,$b2db,$0018,
     $46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b088,$af00,$6078,$000a,$1cfb,
     $701a,$687b,$0018,$f000,$f881,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,
     $681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,
     $4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,
     $b580,$b082,$af00,$6078,$23d0,$061b,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$0000,$b580,
     $b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
