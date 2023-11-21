rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:  	EPD_2in66b.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.66inch e-paper b
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2020-12-02
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
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+672,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+816,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+820,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+824,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+828,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+832,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+836,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+924,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+988,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1076,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1080,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1168,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1172,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2168,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN66B_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f82a,$bd00,$46c0
LABEL C_EPD_2IN66B_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f854,$bd00,$46c0
LABEL C_EPD_2IN66B_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8de,$bd00,$46c0
LABEL C_EPD_2IN66B_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f942,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f94c,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f95a,$bd00,$46c0

REM 2496 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f9a6,$f000,$f9d0,$2012,$f000,$f9ed,$f000,$f9cb,$2011,$f000,$f9e8,$2003,$f000,
     $fa13,$2328,$33ff,$2297,$2100,$2000,$f000,$fa3a,$2021,$f000,$f9db,$2000,$f000,$fa06,$2080,$f000,
     $fa03,$2100,$2000,$f000,$fa89,$f000,$f9af,$46c0,$46bd,$bd80,$b590,$b087,$af00,$6078,$6039,$230e,
     $18fb,$2213,$b590,$b087,$af00,$6078,$6039,$230e,$18fb,$2213,$801a,$230c,$18fb,$2294,$0052,$801a,
     $2024,$f000,$f9b3,$2316,$18fb,$2200,$801a,$e029,$2314,$18fb,$2200,$801a,$e016,$2414,$193b,$881a,
     $2316,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f9c5,$193b,
     $881a,$193b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2116,$187b,$881a,$187b,
     $3201,$801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$2026,$f000,$f979,$2312,$18fb,$2200,
     $801a,$e02b,$2310,$18fb,$2200,$801a,$e018,$2410,$193b,$881a,$2312,$18fb,$881b,$210e,$1879,$8809,
     $434b,$18d3,$001a,$683b,$189b,$781b,$43db,$b2db,$0018,$f000,$f989,$193b,$881a,$193b,$3201,$801a,
     $2310,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3de,$2112,$187b,$881a,$187b,$3201,$801a,$2312,$18fa,
     $230c,$18fb,$8812,$881b,$429a,$d3cb,$f000,$fa2a,$46c0,$46bd,$b007,$bd90,$b580,$b084,$af00,$1dbb,
     $2213,$801a,$1d3b,$2294,$b580,$b084,$af00,$1dbb,$2213,$801a,$1d3b,$2294,$0052,$801a,$2024,$f000,
     $f925,$230e,$18fb,$2200,$801a,$e01a,$230c,$18fb,$2200,$801a,$e008,$20ff,$f000,$f946,$210c,$187b,
     $881a,$187b,$3201,$801a,$230c,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210e,$187b,$881a,$187b,$3201,
     $801a,$230e,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$2026,$f000,$f8fb,$230a,$18fb,$2200,$801a,$e01a,
     $2308,$18fb,$2200,$801a,$e008,$2000,$f000,$f91c,$2108,$187b,$881a,$187b,$3201,$801a,$2308,$18fa,
     $1dbb,$8812,$881b,$429a,$d3ef,$210a,$187b,$881a,$187b,$3201,$801a,$230a,$18fa,$1d3b,$8812,$881b,
     $429a,$d3dd,$f000,$f9be,$46c0,$46bd,$b004,$bd80,$b580,$af00,$2010,$f7ff,$fded,$2001,$f7ff,$fe12,
     $b580,$af00,$2010,$f000,$f8c1,$2001,$f000,$f8ec,$46c0,$46bd,$bd80,$0000,$b580,$af00,$4b10,$681b,
     $b29b,$2101,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,
     $43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,
     $687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,
     $601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f97c,$4b10,$681b,$b29b,$2101,$0018,$f000,$f975,$4b0f,
     $681b,$b29b,$2101,$0018,$f000,$f96e,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f967,$4b08,$681b,$b29b,
     $2101,$0018,$f000,$f990,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,
     $4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,
     $0018,$f000,$f971,$20c8,$f000,$f98e,$4b0b,$681b,$b29b,$2100,$0018,$f000,$f967,$2002,$f000,$f984,
     $4b06,$681b,$b29b,$2101,$0018,$f000,$f95d,$20c8,$f000,$f97a,$46c0,$46bd,$bd80,$46c0,$4368,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$af00,$2032,$f000,$f969,$e002,$200a,$f000,$f965,$4b07,
     $681b,$b29b,$0018,$f000,$f973,$0003,$2b01,$d0f3,$2032,$f000,$f959,$46c0,$46bd,$bd80,$4354,$2000,
     $b580,$af00,$2020,$f7ff,$ff91,$f7ff,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,
     $0018,$f000,$f921,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f91a,$1dfb,$781b,$0018,$f000,$f961,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f90e,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,
     $f8f3,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8ec,$1dfb,$781b,$0018,$f000,$f933,$4b06,$681b,$b29b,
     $2101,$0018,$f000,$f8e0,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,$2032,$f7fd,
     $f968,$e002,$b5b0,$b082,$af00,$0005,$000c,$0010,$0019,$1dbb,$1c2a,$801a,$1d3b,$1c22,$801a,$1cbb,
     $1c02,$801a,$003b,$1c0a,$801a,$2044,$f7ff,$ff8e,$1dbb,$881b,$08db,$b29b,$b2db,$221f,$4013,$b2db,
     $0018,$f7ff,$ffb1,$1cbb,$881b,$08db,$b29b,$b2db,$221f,$4013,$b2db,$0018,$f7ff,$ffa6,$2045,$f7ff,
     $ff75,$1d3b,$881b,$b2db,$0018,$f7ff,$ff9d,$1d3b,$881b,$0a1b,$b29b,$b2db,$2201,$4013,$b2db,$0018,
     $f7ff,$ff92,$003b,$881b,$b2db,$0018,$f7ff,$ff8c,$003b,$881b,$0a1b,$b29b,$b2db,$2201,$4013,$b2db,
     $0018,$f7ff,$ff81,$46c0,$46bd,$b002,$bdb0,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$204e,$f7ff,$ff3c,$1dbb,$881b,$b2db,$221f,$4013,$b2db,
     $0018,$f7ff,$ff61,$204f,$f7ff,$ff30,$1d3b,$881b,$b2db,$0018,$f7ff,$ff58,$1d3b,$881b,$0a1b,$b29b,
     $b2db,$2201,$4013,$b2db,$0018,$f7ff,$ff4d,$46c0,$46bd,$b002,$bd80,$b580,$af00,$f7ff,$fee0,$f7ff,
     $ff54,$2012,$b580,$af00,$2020,$f7ff,$ff0f,$f7ff,$feed,$46c0,$46bd,$bd80,$b5b0,$b082,$af00,$0005,
     $000c,$0010,$0019,$1dbb,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,
     $f000,$f88a,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f89e,
     $e006,$1dbb,$881b,$2101,$0018,$f000,$f897,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,
     $781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1dbb,$881b,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8aa,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,
     $0018,$f000,$f8a9,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,
     $b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a6,
     $46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,$af00,$6078,
     $23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,
     $0018,$f000,$f8a1,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,$2202,$4013,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,
     $f000,$f8be,$e003,$68fb,$0018,$f000,$f8cd,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,
     $801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,
     $2b00,$d004,$68fb,$0018,$f000,$f8c2,$e003,$68fb,$0018,$f000,$f8d1,$46c0,$46bd,$b004,$bd80,$b580,
     $b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f826,
     $46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$6078,
     $23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,
     $b082,$af00,$6078,$23d0,$061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,
     $683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,
     $af00,$6078,$6878,$239a,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f881,$687b,
     $009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,
     $613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,
     $3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,
     $46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
