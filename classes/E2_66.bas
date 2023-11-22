rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:  	EPD_2in66.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.66inch e-paper
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2020-07-29
rem * | Info        :
rem * -----------------------------------------------------------------------------
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

method EPD_2IN66_INIT
  goto C_EPD_2IN66_INIT
method EPD_2IN66_INIT_PARTIAL
  goto C_EPD_2IN66_INIT_PARTIAL
method EPD_2IN66_CLEAR
  goto C_EPD_2IN66_CLEAR
method EPD_2IN66_DISPLAY
  goto C_EPD_2IN66_DISPLAY
method EPD_2IN66_SLEEP
  goto C_EPD_2IN66_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+676,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+820,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+824,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+828,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+832,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+836,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+840,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+928,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+992,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1080,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1084,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1172,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1176,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1964,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN66_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f857,$b002,$bd00,$46c0
LABEL C_EPD_2IN66_INIT_PARTIAL
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f87f,$b002,$bd00,$46c0
LABEL C_EPD_2IN66_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8d9,$b002,$bd00,$46c0
LABEL C_EPD_2IN66_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f907,$b002,$bd00,$46c0
LABEL C_EPD_2IN66_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f951,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f955,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f95d,$b002,$bd00,$46c0

REM 2292 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f9a8,$f000,$f9d2,$2012,$f000,$f9ef,$f000,$f9cd,$2011,$f000,$f9ea,$2003,$f000,
     $fa15,$2044,$f000,$f9e4,$2001,$f000,$fa0f,$2013,$f000,$fa0c,$2045,$f000,$f9db,$2000,$f000,$fa06,
     $2000,$f000,$fa03,$2028,$f000,$fa00,$2001,$f000,$f9fd,$f000,$f9ad,$46c0,$46bd,$bd80,$b580,$af00,
     $f7ff,$ff12,$f7ff,$ff86,$2012,$f7ff,$b580,$af00,$f000,$f972,$f000,$f99c,$2012,$f000,$f9b9,$f000,
     $f997,$f000,$fa11,$2037,$f000,$f9b2,$2000,$f000,$f9dd,$2000,$f000,$f9da,$2000,$f000,$f9d7,$2000,
     $f000,$f9d4,$2000,$f000,$f9d1,$2040,$f000,$f9ce,$2000,$f000,$f9cb,$2000,$f000,$f9c8,$2000,$f000,
     $f9c5,$2000,$f000,$f9c2,$2011,$f000,$f991,$2003,$f000,$f9bc,$2044,$f000,$f98b,$2001,$f000,$f9b6,
     $2013,$f000,$f9b3,$2045,$f000,$f982,$2000,$f000,$f9ad,$2000,$f000,$f9aa,$2028,$f000,$f9a7,$2001,
     $f000,$f9a4,$203c,$f000,$f973,$2080,$f000,$f99e,$2022,$f000,$f96d,$20cf,$f000,$f998,$2020,$f000,
     $f967,$f000,$f945,$46c0,$46bd,$bd80,$b580,$b082,$af00,$1cbb,$2213,$801a,$003b,$2294,$b580,$b082,
     $af00,$1cbb,$2213,$801a,$003b,$2294,$0052,$801a,$2024,$f000,$f94d,$1dbb,$2200,$801a,$e016,$1d3b,
     $2200,$801a,$e007,$20ff,$f000,$f970,$1d3b,$881a,$1d3b,$3201,$801a,$1d3a,$1cbb,$8812,$881b,$429a,
     $d3f1,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,$003b,$8812,$881b,$429a,$d9e2,$f000,$f9ae,$46c0,$46bd,
     $b002,$bd80,$b590,$b087,$af00,$6078,$2312,$18fb,$2213,$801a,$b590,$b087,$af00,$6078,$2312,$18fb,
     $2213,$801a,$2310,$18fb,$2294,$0052,$801a,$2300,$60fb,$2024,$f000,$f90c,$2316,$18fb,$2200,$801a,
     $e02a,$2314,$18fb,$2200,$801a,$e017,$2414,$193b,$881a,$2316,$18fb,$881b,$2112,$1879,$8809,$434b,
     $18d3,$60fb,$687a,$68fb,$18d3,$781b,$0018,$f000,$f91d,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,
     $2312,$18fb,$8812,$881b,$429a,$d3df,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$2310,$18fb,
     $8812,$881b,$429a,$d3cc,$f000,$f956,$46c0,$46bd,$b007,$bd90,$b580,$af00,$2010,$f7ff,$fe53,$2001,
     $f7ff,$fe78,$b580,$af00,$2010,$f000,$f8c1,$2001,$f000,$f8ec,$46c0,$46bd,$bd80,$0000,$b580,$af00,
     $4b10,$681b,$b29b,$2101,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,
     $bd80,$0000,$43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,
     $603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,
     $4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f914,$4b10,$681b,$b29b,$2101,$0018,$f000,
     $f90d,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f906,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f8ff,$4b08,
     $681b,$b29b,$2101,$0018,$f000,$f928,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,
     $435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,
     $b29b,$2101,$0018,$f000,$f909,$20c8,$f000,$f926,$4b0b,$681b,$b29b,$2100,$0018,$f000,$f8ff,$2002,
     $f000,$f91c,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8f5,$20c8,$f000,$f912,$46c0,$46bd,$bd80,$46c0,
     $4368,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$af00,$2064,$f000,$f901,$e002,$2064,$f000,
     $f8fd,$4b07,$681b,$b29b,$0018,$f000,$f90b,$0003,$2b01,$d0f3,$2064,$f000,$f8f1,$46c0,$46bd,$bd80,
     $4354,$2000,$b580,$af00,$2020,$f7ff,$ff91,$f7ff,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,
     $b29b,$2100,$0018,$f000,$f8b9,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8b2,$1dfb,$781b,$0018,$f000,
     $f8f9,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8a6,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,
     $0018,$f000,$f88b,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f884,$1dfb,$781b,$0018,$f000,$f8cb,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f878,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,
     $2064,$f7fd,$fb42,$e002,$b580,$b082,$af00,$2032,$f7ff,$ff9e,$1dbb,$2200,$801a,$e00b,$1dbb,$881b,
     $4a09,$5cd3,$0018,$f7ff,$ffc1,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881b,$2b98,$d9ef,$f7ff,$ff68,
     $46c0,$46bd,$b002,$bd80,$dd90,$1000,$b580,$af00,$f7ff,$ff40,$f7ff,$ffb4,$b580,$af00,$2020,$f7ff,
     $ff77,$f7ff,$ff55,$46c0,$46bd,$bd80,$b580,$b082,$af00,$2032,$f7ff,$ff86,$1dbb,$2200,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f88a,$1d3b,$881b,$2b00,$d003,
     $1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f89e,$e006,$1dbb,$881b,$2101,$0018,$f000,
     $f897,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,
     $f000,$f89a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b082,
     $af00,$6078,$687b,$0018,$f000,$f8aa,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,
     $607a,$603b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8a9,$0003,$0018,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b084,$af00,$0002,$1dfb,$701a,
     $1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a6,$46c0,$46bd,$b004,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,
     $629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,$f8a1,$46c0,$46bd,$b002,
     $bd80,$0000,$b580,$af00,$4b04,$681b,$2202,$4013,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8be,$e003,$68fb,$0018,$f000,
     $f8cd,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8c2,
     $e003,$68fb,$0018,$f000,$f8d1,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,
     $b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f826,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,
     $2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,
     $b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,
     $0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b088,
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
