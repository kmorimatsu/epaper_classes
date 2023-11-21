rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_2in13b_V3.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.13inch e-paper b V3
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2020-04-13
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
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+684,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+828,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+832,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+836,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+840,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+844,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+848,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+948,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+952,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1080,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1084,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1172,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1260,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1264,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1884,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN13B_V3_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f82a,$bd00,$46c0
LABEL C_EPD_2IN13B_V3_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f854,$bd00,$46c0
LABEL C_EPD_2IN13B_V3_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8b6,$bd00,$46c0
LABEL C_EPD_2IN13B_V3_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f93c,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f952,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f960,$bd00,$46c0

REM 2264 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f9ac,$200a,$f000,$f9dd,$2004,$f000,$f9ee,$f000,$fa1a,$2000,$f000,$f9e9,$200f,
     $f000,$fa40,$2089,$f000,$fa3d,$2061,$f000,$f9e0,$2068,$f000,$fa37,$2000,$f000,$fa34,$20d4,$f000,
     $fa31,$2050,$f000,$f9d4,$2077,$f000,$fa2b,$46c0,$46bd,$bd80,$b580,$b084,$af00,$1dbb,$220d,$801a,
     $1d3b,$22d4,$b580,$b084,$af00,$1dbb,$220d,$801a,$1d3b,$22d4,$801a,$2010,$f000,$f9ba,$230e,$18fb,
     $2200,$801a,$e01a,$230c,$18fb,$2200,$801a,$e008,$20ff,$f000,$fa07,$210c,$187b,$881a,$187b,$3201,
     $801a,$230c,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,
     $1d3b,$8812,$881b,$429a,$d3dd,$2013,$f000,$f990,$230a,$18fb,$2200,$801a,$e01a,$2308,$18fb,$2200,
     $801a,$e008,$20ff,$f000,$f9dd,$2108,$187b,$881a,$187b,$3201,$801a,$2308,$18fa,$1dbb,$8812,$881b,
     $429a,$d3ef,$210a,$187b,$881a,$187b,$3201,$801a,$230a,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$f000,
     $f9ef,$46c0,$46bd,$b004,$bd80,$b590,$b087,$af00,$6078,$6039,$230e,$18fb,$b590,$b087,$af00,$6078,
     $6039,$230e,$18fb,$220d,$801a,$230c,$18fb,$22d4,$801a,$2010,$f000,$f94c,$2316,$18fb,$2200,$801a,
     $e029,$2314,$18fb,$2200,$801a,$e016,$2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,$434b,
     $18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f98a,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,$230e,
     $18fb,$8812,$881b,$429a,$d3e0,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,$8812,
     $881b,$429a,$d3cd,$2013,$f000,$f912,$2312,$18fb,$2200,$801a,$e029,$2310,$18fb,$2200,$801a,$e016,
     $2410,$193b,$881a,$2312,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$683b,$189b,$781b,$0018,
     $f000,$f950,$193b,$881a,$193b,$3201,$801a,$2310,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2112,
     $187b,$881a,$187b,$3201,$801a,$2312,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$f000,$f961,$46c0,
     $46bd,$b007,$bd90,$b580,$af00,$2050,$f7ff,$fe64,$20f7,$f7ff,$b580,$af00,$2050,$f000,$f8c9,$20f7,
     $f000,$f920,$2002,$f000,$f8c3,$f000,$f8ef,$2007,$f000,$f8be,$20a5,$f000,$f915,$46c0,$46bd,$bd80,
     $0000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,
     $60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,
     $af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,
     $601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f916,$4b10,$681b,
     $b29b,$2101,$0018,$f000,$f90f,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f908,$4b0a,$681b,$b29b,$2100,
     $0018,$f000,$f901,$4b08,$681b,$b29b,$2101,$0018,$f000,$f92a,$46c0,$46bd,$b004,$bd80,$4368,$2000,
     $4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,
     $b580,$af00,$4b13,$681b,$b29b,$2101,$0018,$f000,$f90b,$4b11,$681b,$b29b,$2101,$0018,$f000,$f904,
     $200a,$f000,$f821,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8fa,$2002,$f000,$f817,$4b07,$681b,$b29b,
     $2101,$0018,$f000,$f8f0,$200a,$f000,$f80d,$46c0,$46bd,$bd80,$435c,$2000,$4368,$2000,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8f8,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,
     $b29b,$2100,$0018,$f000,$f8bf,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8b8,$1dfb,$781b,$0018,$f000,
     $f8e9,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8ac,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b590,$b083,$af00,$2071,$f7ff,$ffcc,$4b0e,$681b,$b29b,$1dfc,
     $0018,$f000,$f8e3,$0003,$7023,$1dfb,$781b,$2201,$4013,$425a,$4153,$b2da,$1dfb,$701a,$1dfb,$781b,
     $2b00,$d1e6,$20c8,$f7ff,$ff9f,$46c0,$46bd,$b003,$bd90,$46c0,$4354,$2000,$b580,$af00,$2012,$f7ff,
     $ff85,$2064,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,$f865,$4b0c,
     $681b,$b29b,$2100,$0018,$f000,$f85e,$1dfb,$781b,$0018,$f000,$f88f,$4b06,$681b,$b29b,$2101,$0018,
     $f000,$f852,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b590,$b083,$af00,$2071,$f7ff,$ffaa,
     $b580,$af00,$2012,$f7ff,$ff73,$2064,$f7ff,$ff5c,$f7ff,$ff9c,$46c0,$46bd,$bd80,$b580,$af00,$f7ff,
     $ff4b,$200a,$f7fe,$fc69,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,
     $f000,$f88c,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f8a0,
     $e006,$1dbb,$881b,$2101,$0018,$f000,$f899,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,
     $781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89c,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1dbb,$881b,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f8aa,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b084,$af00,$0002,$1dfb,$701a,
     $1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f88e,$46c0,$46bd,$b004,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,
     $f895,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b082,
     $af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,
     $687b,$2105,$0018,$f000,$f88b,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,$2202,$4013,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,
     $68fb,$0018,$f000,$f8a8,$e003,$68fb,$0018,$f000,$f8b7,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,
     $0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,
     $1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8ac,$e003,$68fb,$0018,$f000,$f8bb,$46c0,$46bd,$b004,
     $bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,
     $68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,
     $b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,
     $2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,
     $b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f881,$687b,$009b,$4a12,$4694,$4463,
     $61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,
     $0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,
     $b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,
     $46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,
     $46c0,$46bd,$b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
