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
  POKE32 DATAADDRESS(C_FUNCTIONS)+696,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+840,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+844,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+848,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+852,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+856,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+860,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+948,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+952,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1040,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1044,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1140,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1716,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_7IN5B_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f857,$b002,$bd00,$46c0
LABEL C_EPD_7IN5B_V2_CLEARRED
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f891,$b002,$bd00,$46c0
LABEL C_EPD_7IN5B_V2_CLEARBLACK
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8cb,$b002,$bd00,$46c0
LABEL C_EPD_7IN5B_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f905,$b002,$bd00,$46c0
LABEL C_EPD_7IN5B_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f955,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f95f,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f967,$b002,$bd00,$46c0

REM 2140 bytes
LABEL C_FUNCTIONS
EXEC $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$0052,$801a,$2010,$f000,$f9a9,$1dbb,$2200,$801a,
     $e007,$20ff,$f000,$f9d0,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,
     $429a,$dbee,$2013,$f000,$f991,$1dbb,$2200,$801a,$e007,$2000,$f000,$f9b8,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,$429a,$dbee,$f000,$f9d6,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,
     $0052,$801a,$2010,$f000,$f961,$1dbb,$2200,$801a,$e007,$20ff,$f000,$f988,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,$429a,$dbee,$2013,$f000,$f949,$1dbb,$2200,$801a,
     $e007,$20ff,$f000,$f970,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,
     $429a,$dbee,$f000,$f98e,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,
     $b580,$b082,$af00,$1d3b,$2264,$801a,$1cbb,$22f0,$0052,$801a,$2010,$f000,$f919,$1dbb,$2200,$801a,
     $e007,$2000,$f000,$f940,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,
     $429a,$dbee,$2013,$f000,$f901,$1dbb,$2200,$801a,$e007,$2000,$f000,$f928,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,$429a,$dbee,$f000,$f946,$46c0,$46bd,$b002,$bd80,
     $b580,$b088,$af00,$6078,$6039,$2364,$60fb,$23f0,$b580,$b088,$af00,$6078,$6039,$2364,$60fb,$23f0,
     $005b,$60bb,$2010,$f000,$f8d1,$2300,$61fb,$e017,$2300,$61bb,$e00d,$69fb,$68fa,$435a,$69bb,$18d3,
     $687a,$18d3,$781b,$0018,$f000,$f8ee,$69bb,$3301,$61bb,$69ba,$68fb,$429a,$d3ed,$69fb,$3301,$61fb,
     $69fa,$68bb,$429a,$d3e3,$2013,$f000,$f8af,$2300,$617b,$e019,$2300,$613b,$e00f,$697b,$68fa,$435a,
     $693b,$18d3,$683a,$18d3,$781b,$43db,$b2db,$0018,$f000,$f8ca,$693b,$3301,$613b,$693a,$68fb,$429a,
     $d3eb,$697b,$3301,$617b,$697a,$68bb,$429a,$d3e1,$f000,$f8e8,$46c0,$46bd,$b008,$bd80,$b580,$af00,
     $2002,$f7ff,$fe72,$f7ff,$fec0,$2007,$b580,$af00,$2002,$f000,$f87b,$f000,$f8e9,$2007,$f000,$f876,
     $20a5,$f000,$f8a1,$46c0,$46bd,$bd80,$b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$b580,$af00,
     $b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43ec,$2000,$b590,$b087,
     $af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,
     $601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,
     $2101,$0018,$f000,$f8be,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8b7,$4b0f,$681b,$b29b,$2101,$0018,
     $f000,$f8b0,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f8a9,$4b08,$681b,$b29b,$2101,$0018,$f000,$f8d2,
     $46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,$4364,$2000,
     $b580,$af00,$2302,$2201,$2103,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,
     $0018,$f000,$f8af,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8a8,$1dfb,$781b,$0018,$f000,$f8c3,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f89c,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,
     $f881,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f87a,$1dfb,$781b,$0018,$f000,$f895,$4b06,$681b,$b29b,
     $2101,$0018,$f000,$f86e,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,$2014,$f7f6,
     $fcac,$4b07,$b580,$af00,$2012,$f7ff,$ff9f,$2064,$f000,$f894,$f000,$f80a,$46c0,$46bd,$bd80,$b580,
     $b082,$af00,$1d3b,$2264,$801a,$1cbb,$b580,$af00,$2014,$f000,$f883,$4b07,$681b,$b29b,$0018,$f000,
     $f891,$1e03,$d0f4,$2014,$f000,$f878,$46c0,$46bd,$bd80,$46c0,$4354,$2000,$b580,$af00,$2012,$f7ff,
     $ff95,$2064,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f88a,
     $1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f89e,$e006,$1dbb,
     $881b,$2101,$0018,$f000,$f897,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,
     $f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,
     $418b,$b2db,$0019,$0010,$f000,$f89a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1dbb,$881b,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,
     $f000,$f8a2,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,
     $af00,$6078,$687b,$0018,$f000,$f8ac,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,
     $607a,$603b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8ab,$0003,$0018,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b082,$af00,$6078,$23d0,$061b,
     $2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,
     $f8a1,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,$2202,$4013,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8be,
     $e003,$68fb,$0018,$f000,$f8cd,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,
     $68fb,$0018,$f000,$f8c2,$e003,$68fb,$0018,$f000,$f8d1,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,
     $6078,$23d0,$061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,
     $68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,
     $6878,$239a,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f7ff,$ffd8,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,
     $40da,$0013,$2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,
     $061b,$687a,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f881,$687b,$009b,$4a12,
     $4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,
     $693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,
     $46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,
     $af00,$6078,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
