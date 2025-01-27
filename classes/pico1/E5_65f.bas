rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:  	EPD_2in9_V2.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.9inch e-paper V2
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2021-06-03
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

method EPD_5IN65F_CLEAR
  goto C_EPD_5IN65F_CLEAR
method EPD_5IN65F_SLEEP
  goto C_EPD_5IN65F_SLEEP
method EPD_5IN65F_DISPLAY
  goto C_EPD_5IN65F_DISPLAY
method EPD_5IN65F_INIT
  goto C_EPD_5IN65F_INIT
method EPD_5IN65F_DISPLAY_PART
  goto C_EPD_5IN65F_DISPLAY_PART

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+228,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+988,C_RAM+16
  POKE32 DATAADDRESS(C_FUNCTIONS)+1132,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1136,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1140,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1144,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1148,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1152,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1240,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1244,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1332,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1336,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1384,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1432,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1624,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2132,C_RAM+16
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_5IN65F_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f857,$b002,$bd00,$46c0
LABEL C_EPD_5IN65F_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8a3,$b002,$bd00,$46c0
LABEL C_EPD_5IN65F_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8b5,$b002,$bd00,$46c0
LABEL C_EPD_5IN65F_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f901,$b002,$bd00,$46c0
LABEL C_EPD_5IN65F_DISPLAY_PART
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f963,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9f1,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9f9,$b002,$bd00,$46c0

REM 2516 bytes
LABEL C_FUNCTIONS
EXEC $b580,$b084,$af00,$0002,$1dfb,$701a,$2061,$f000,$fa3f,$2002,$f000,$fa6a,$2058,$f000,$fa67,$2001,
     $f000,$fa64,$20c0,$f000,$fa61,$2010,$f000,$fa30,$2300,$60fb,$e01a,$2300,$60bb,$e00f,$1dfb,$781b,
     $011b,$b25a,$1dfb,$781b,$b25b,$4313,$b25b,$b2db,$0018,$f000,$fa4b,$68bb,$3301,$60bb,$68ba,$23e0,
     $005b,$429a,$dbea,$68fb,$3301,$60fb,$68fa,$2396,$005b,$429a,$dbdf,$2004,$f000,$fa0a,$f000,$fa64,
     $2012,$f000,$fa05,$f000,$fa5f,$2002,$f000,$fa00,$f000,$fa72,$23fa,$005b,$0018,$f000,$fa85,$46c0,
     $46bd,$b004,$bd80,$b580,$b084,$af00,$6078,$2061,$f7ff,$fec9,$b580,$af00,$2064,$f000,$fa75,$2007,
     $f000,$f9e6,$20a5,$f000,$fa11,$2064,$f000,$fa6c,$4b04,$681b,$b29b,$2100,$0018,$f000,$fa79,$46c0,
     $46bd,$bd80,$4380,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,$b580,$b084,$af00,$6078,$2061,$f000,
     $f9c7,$2002,$f000,$f9f2,$2058,$f000,$f9ef,$2001,$f000,$f9ec,$20c0,$f000,$f9e9,$2010,$f000,$f9b8,
     $2300,$60fb,$e01d,$2300,$60bb,$e012,$68fa,$0013,$009b,$189b,$011a,$1ad2,$0093,$001a,$68bb,$18d3,
     $687a,$18d3,$781b,$0018,$f000,$f9d0,$68bb,$3301,$60bb,$68ba,$2396,$005b,$429a,$d3e7,$68fb,$3301,
     $60fb,$68fa,$23e0,$005b,$429a,$d3dc,$2004,$f000,$f98f,$f000,$f9e9,$2012,$f000,$f98a,$f000,$f9e4,
     $2002,$f000,$f985,$f000,$f9f7,$20c8,$f000,$fa0c,$46c0,$46bd,$b004,$bd80,$b590,$b087,$af00,$60f8,
     $000c,$0010,$0019,$230a,$b580,$af00,$f000,$fa30,$f000,$f9ca,$2000,$f000,$f96b,$20ef,$f000,$f996,
     $2008,$f000,$f993,$2001,$f000,$f962,$2037,$f000,$f98d,$2000,$f000,$f98a,$2023,$f000,$f987,$2023,
     $f000,$f984,$2003,$f000,$f953,$2000,$f000,$f97e,$2006,$f000,$f94d,$20c7,$f000,$f978,$20c7,$f000,
     $f975,$201d,$f000,$f972,$2030,$f000,$f941,$203c,$f000,$f96c,$2041,$f000,$f93b,$2000,$f000,$f966,
     $2050,$f000,$f935,$2037,$f000,$f960,$2060,$f000,$f92f,$2022,$f000,$f95a,$2061,$f000,$f929,$2002,
     $f000,$f954,$2058,$f000,$f951,$2001,$f000,$f94e,$20c0,$f000,$f94b,$20e3,$f000,$f91a,$20aa,$f000,
     $f945,$2064,$f000,$f9a0,$2050,$f000,$f911,$2037,$f000,$f93c,$46c0,$46bd,$bd80,$b580,$b084,$af00,
     $0002,$1dfb,$701a,$2061,$b590,$b087,$af00,$60f8,$000c,$0010,$0019,$230a,$18fb,$1c22,$801a,$2308,
     $18fb,$1c02,$801a,$1dbb,$1c0a,$801a,$2061,$f000,$f8ef,$2002,$f000,$f91a,$2058,$f000,$f917,$2001,
     $f000,$f914,$20c0,$f000,$f911,$2010,$f000,$f8e0,$2300,$617b,$e051,$2300,$613b,$e046,$2328,$18fb,
     $881a,$2108,$187b,$881b,$18d3,$001a,$697b,$4293,$d235,$187b,$881b,$697a,$429a,$d330,$1dbb,$881a,
     $230a,$18fb,$881b,$18d3,$2b00,$da00,$3301,$105b,$001a,$693b,$4293,$d222,$210a,$187b,$881b,$085b,
     $b29b,$001a,$693b,$4293,$d319,$187b,$881b,$085b,$b29b,$001a,$693b,$1a9a,$1dbb,$881b,$085b,$b29b,
     $0018,$2308,$18fb,$881b,$6979,$1acb,$4343,$18d3,$68fa,$18d3,$781b,$0018,$f000,$f8c8,$e002,$2011,
     $f000,$f8c4,$693b,$3301,$613b,$693a,$2396,$005b,$429a,$d3b3,$697b,$3301,$617b,$697a,$23e0,$005b,
     $429a,$d3a8,$2004,$f000,$f883,$f000,$f8dd,$2012,$f000,$f87e,$f000,$f8d8,$2002,$f000,$f879,$f000,
     $f8eb,$20c8,$f000,$f900,$46c0,$46bd,$b007,$bd90,$b580,$af00,$2064,$f7f7,$f946,$2007,$f7ff,$fde2,
     $b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43b8,$2000,
     $b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,
     $4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,
     $681b,$b29b,$2101,$0018,$f000,$f91e,$4b10,$681b,$b29b,$2101,$0018,$f000,$f917,$4b0f,$681b,$b29b,
     $2101,$0018,$f000,$f910,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f909,$4b08,$681b,$b29b,$2101,$0018,
     $f000,$f8b6,$46c0,$46bd,$b004,$bd80,$4380,$2000,$4378,$2000,$436c,$2000,$4374,$2000,$4370,$2000,
     $437c,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,
     $b29b,$2100,$0018,$f000,$f893,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f88c,$1dfb,$781b,$0018,$f000,
     $f903,$4b06,$681b,$b29b,$2101,$0018,$f000,$f880,$46c0,$46bd,$b002,$bd80,$4378,$2000,$4374,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,
     $0018,$f000,$f865,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f85e,$1dfb,$781b,$0018,$f000,$f8d5,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f852,$46c0,$46bd,$b002,$bd80,$4378,$2000,$4374,$2000,$b580,$af00,
     $46c0,$4b06,$681b,$b29b,$b580,$af00,$46c0,$4b06,$681b,$b29b,$0018,$f000,$f8d3,$1e03,$d0f7,$46c0,
     $46c0,$46bd,$bd80,$46c0,$436c,$2000,$b580,$af00,$46c0,$4b06,$681b,$b29b,$b580,$af00,$46c0,$4b06,
     $681b,$b29b,$0018,$f000,$f8bb,$1e03,$d1f7,$46c0,$46c0,$46bd,$bd80,$46c0,$436c,$2000,$b580,$af00,
     $f7ff,$ff62,$f7ff,$ffd6,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8bc,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,
     $701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f8b2,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f7ff,
     $ffd7,$20c8,$f7ff,$ffc0,$4b0b,$681b,$b29b,$2100,$0018,$f7ff,$ffcd,$2001,$f7ff,$ffb6,$4b06,$681b,
     $b29b,$2101,$0018,$f7ff,$ffc3,$20c8,$f7ff,$ffac,$46c0,$46bd,$bd80,$46c0,$4380,$2000,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,
     $f000,$f890,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f8a0,
     $e006,$1dbb,$881b,$2101,$0018,$f000,$f899,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $687b,$0018,$f7ff,$ff09,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,
     $2203,$2001,$f000,$f8a0,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8a7,$0003,$0018,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,
     $f000,$f872,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,
     $f000,$f88a,$e003,$68fb,$0018,$f000,$f899,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,
     $061b,$687a,$b580,$b082,$af00,$6078,$687b,$2100,$0018,$f000,$f815,$687b,$2100,$0018,$f7ff,$ffce,
     $687b,$2105,$0018,$f000,$f88f,$46c0,$46bd,$b002,$bd80,$0000,$b40f,$b580,$b082,$af00,$4b0b,$0018,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,
     $68fb,$0018,$f000,$f8ae,$e003,$68fb,$0018,$f000,$f8bd,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,
     $0002,$1dbb,$801a,$1d7b,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,
     $68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43b8,$2000,$b580,$b082,$af00,$6078,
     $6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,$687a,$4091,$000a,$4013,$1e5a,$4193,
     $b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f85b,$687b,
     $009b,$4a13,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,
     $613a,$60fb,$693b,$2280,$0152,$4694,$4463,$68fa,$601a,$46c0,$46c0,$4907,$1cfb,$781a,$687b,$00db,
     $18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$46c0,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,
     $687b,$2100,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a

REM 0 bytes
LABEL C_RODATA
