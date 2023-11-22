rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_5in83_V2.c
rem * | Author      :   Waveshare team
rem * | Function    :   5.83inch e-paper V2
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2020-11-23
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
  POKE32 DATAADDRESS(C_FUNCTIONS)+640,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+784,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+788,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+792,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+796,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+800,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+804,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+892,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+980,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+984,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1072,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1076,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1172,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1792,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_5IN83_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f849,$b002,$bd00,$46c0
LABEL C_EPD_5IN83_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f88b,$b002,$bd00,$46c0
LABEL C_EPD_5IN83_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8c5,$b002,$bd00,$46c0
LABEL C_EPD_5IN83_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f939,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f943,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f94b,$b002,$bd00,$46c0

REM 2172 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f996,$2001,$f000,$f9bf,$2007,$f000,$f9ea,$2007,$f000,$f9e7,$203f,$f000,$f9e4,
     $203f,$f000,$f9e1,$2004,$f000,$f9b0,$2064,$f000,$fa09,$f000,$fa1b,$2000,$f000,$f9a8,$201f,$f000,
     $f9d3,$2061,$f000,$f9a2,$2002,$f000,$f9cd,$2088,$f000,$f9ca,$2001,$f000,$f9c7,$20e0,$f000,$f9c4,
     $2015,$f000,$f993,$2000,$f000,$f9be,$2050,$f000,$f98d,$2010,$f000,$f9b8,$2007,$f000,$f9b5,$2060,
     $f000,$f984,$2022,$f000,$f9af,$46c0,$46bd,$bd80,$b580,$b082,$af00,$1d3b,$2251,$801a,$1cbb,$22f0,
     $b580,$b082,$af00,$1d3b,$2251,$801a,$1cbb,$22f0,$0052,$801a,$2010,$f000,$f969,$1dbb,$2200,$801a,
     $e007,$2000,$f000,$f990,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,
     $429a,$dbee,$2013,$f000,$f951,$1dbb,$2200,$801a,$e007,$2000,$f000,$f978,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dbb,$881a,$1d3b,$881b,$1cb9,$8809,$434b,$429a,$dbee,$f000,$f9c6,$46c0,$46bd,$b002,$bd80,
     $b590,$b085,$af00,$6078,$230a,$18fb,$2251,$801a,$b590,$b085,$af00,$6078,$230a,$18fb,$2251,$801a,
     $2308,$18fb,$22f0,$0052,$801a,$2010,$f000,$f91e,$230e,$18fb,$2200,$801a,$e01b,$230c,$18fb,$2200,
     $801a,$e008,$2000,$f000,$f93f,$210c,$187b,$881a,$187b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,
     $881b,$429a,$d3ee,$210e,$187b,$881a,$187b,$3201,$801a,$240e,$193a,$2308,$18fb,$8812,$881b,$429a,
     $d3db,$2013,$f000,$f8f2,$193b,$2200,$801a,$e02b,$230c,$18fb,$2200,$801a,$e018,$230e,$18fb,$881b,
     $220a,$18ba,$8812,$435a,$240c,$193b,$881b,$18d3,$001a,$687b,$189b,$781b,$43db,$b2db,$0018,$f000,
     $f903,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,$881b,$429a,$d3de,$210e,$187b,
     $881a,$187b,$3201,$801a,$230e,$18fa,$2308,$18fb,$8812,$881b,$429a,$d3cb,$f000,$f944,$46c0,$46bd,
     $b005,$bd90,$b580,$af00,$2002,$f7ff,$fe86,$f7ff,$fed4,$2007,$b580,$af00,$2002,$f000,$f8a7,$f000,
     $f915,$2007,$f000,$f8a2,$20a5,$f000,$f8cd,$46c0,$46bd,$bd80,$0000,$b580,$b082,$af00,$0002,$1dfb,
     $701a,$4b0e,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,
     $43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,
     $687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,
     $601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f8fe,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8f7,$4b0f,
     $681b,$b29b,$2101,$0018,$f000,$f8f0,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f8e9,$4b08,$681b,$b29b,
     $2101,$0018,$f000,$f912,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,
     $4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,
     $0018,$f000,$f8f3,$20c8,$f000,$f87c,$4b0b,$681b,$b29b,$2100,$0018,$f000,$f8e9,$2005,$f000,$f872,
     $4b06,$681b,$b29b,$2101,$0018,$f000,$f8df,$20c8,$f000,$f868,$46c0,$46bd,$bd80,$46c0,$4368,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,
     $0018,$f000,$f8c3,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8bc,$1dfb,$781b,$0018,$f000,$f8d7,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f8b0,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,
     $f895,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f88e,$1dfb,$781b,$0018,$f000,$f8a9,$4b06,$681b,$b29b,
     $2101,$0018,$f000,$f882,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,$2071,$f7ff,
     $ffab,$200a,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8a8,$46c0,$46bd,$b002,$bd80,$0000,$b580,
     $b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$af00,$2071,$f7ff,$ff8b,$200a,$f7ff,$ffe4,$4b05,$681b,
     $b29b,$0018,$f000,$f8a4,$1e03,$d0f1,$46c0,$46c0,$46bd,$bd80,$4354,$2000,$b580,$af00,$2012,$f7ff,
     $ff95,$2064,$b580,$af00,$2012,$f7ff,$ff6f,$2064,$f7ff,$ffc8,$f7ff,$ffda,$46c0,$46bd,$bd80,$b580,
     $af00,$f7ff,$ff63,$2001,$f7ff,$ff86,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,
     $881b,$0018,$f000,$f88c,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,
     $f000,$f8a0,$e006,$1dbb,$881b,$2101,$0018,$f000,$f899,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,
     $881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89c,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,
     $18f9,$2394,$2203,$2001,$f000,$f8a4,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,
     $685a,$687b,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f88e,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,
     $0018,$f000,$f895,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,
     $b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,
     $000a,$619a,$687b,$2105,$0018,$f000,$f88b,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,
     $2202,$4013,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,
     $2b00,$d004,$68fb,$0018,$f000,$f8a8,$e003,$68fb,$0018,$f000,$f8b7,$46c0,$46bd,$b004,$bd80,$b580,
     $b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,
     $0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8ac,$e003,$68fb,$0018,$f000,$f8bb,$46c0,
     $46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,
     $603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,
     $43ec,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,
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
