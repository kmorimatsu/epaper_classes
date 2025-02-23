rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:  	EPD_2in13_V3.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.13inch e-paper V3
rem * | Info        :
rem *----------------
rem * |	This version:   V1.1
rem * | Date        :   2021-10-30
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

method EPD_2IN13_V3_INIT
  goto C_EPD_2IN13_V3_INIT
method EPD_2IN13_V3_CLEAR
  goto C_EPD_2IN13_V3_CLEAR
method EPD_2IN13_V3_DISPLAY
  goto C_EPD_2IN13_V3_DISPLAY
method EPD_2IN13_V3_DISPLAY_BASE
  goto C_EPD_2IN13_V3_DISPLAY_BASE
method EPD_2IN13_V3_DISPLAY_PARTIAL
  goto C_EPD_2IN13_V3_DISPLAY_PARTIAL
method EPD_2IN13_V3_SLEEP
  goto C_EPD_2IN13_V3_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+1044,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1136,C_RAM+16
  POKE32 DATAADDRESS(C_FUNCTIONS)+1280,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1284,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1288,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1292,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1296,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1300,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1548,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1648,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1736,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1740,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1828,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1832,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3136,C_RAM+16
  REM rodata vectors
  REM ram function vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+144,DATAADDRESS(C_FUNCTIONS)+1316
  POKE32 DATAADDRESS(C_FUNCTIONS)+1048,DATAADDRESS(C_FUNCTIONS)+2284
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN13_V3_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f865,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8a7,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8d3,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_DISPLAY_BASE
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f919,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_DISPLAY_PARTIAL
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f999,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V3_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa33,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa3b,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa43,$b002,$bd00,$46c0

REM 3520 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fade,$2064,$f000,$fb07,$f000,$fb19,$2012,$f000,$fb34,$f000,$fb14,$2001,$f000,
     $fb2f,$20f9,$f000,$fb5a,$2000,$f000,$fb57,$2000,$f000,$fb54,$2011,$f000,$fb23,$2003,$f000,$fb4e,
     $23f9,$2279,$2100,$2000,$f000,$fb76,$2100,$2000,$f000,$fbc2,$203c,$f000,$fb13,$2005,$f000,$fb3e,
     $2021,$f000,$fb0d,$2000,$f000,$fb38,$2080,$f000,$fb35,$2018,$f000,$fb04,$2080,$f000,$fb2f,$f000,
     $fae1,$4b03,$0018,$f000,$fbd5,$46c0,$46bd,$bd80,$03d8,$2000,$b580,$b082,$af00,$1cbb,$2210,$801a,
     $b580,$b082,$af00,$1cbb,$2210,$801a,$003b,$22fa,$801a,$2024,$f000,$fae4,$1dbb,$2200,$801a,$e016,
     $1d3b,$2200,$801a,$e007,$20ff,$f000,$fb07,$1d3b,$881a,$1d3b,$3201,$801a,$1d3a,$1cbb,$8812,$881b,
     $429a,$d3f1,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,$003b,$8812,$881b,$429a,$d3e2,$f000,$fbdf,$46c0,
     $46bd,$b002,$bd80,$b590,$b085,$af00,$6078,$230a,$18fb,$2210,$b590,$b085,$af00,$6078,$230a,$18fb,
     $2210,$801a,$2308,$18fb,$22fa,$801a,$2024,$f000,$faa7,$230e,$18fb,$2200,$801a,$e029,$230c,$18fb,
     $2200,$801a,$e016,$240c,$193b,$881a,$230e,$18fb,$881b,$210a,$1879,$8809,$434b,$18d3,$001a,$687b,
     $189b,$781b,$0018,$f000,$fab9,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,$881b,
     $429a,$d3e0,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$2308,$18fb,$8812,$881b,$429a,$d3cd,
     $f000,$fb8c,$46c0,$46bd,$b005,$bd90,$b590,$b087,$af00,$6078,$230e,$18fb,$2210,$801a,$b590,$b087,
     $af00,$6078,$230e,$18fb,$2210,$801a,$230c,$18fb,$22fa,$801a,$2024,$f000,$fa53,$2316,$18fb,$2200,
     $801a,$e029,$2314,$18fb,$2200,$801a,$e016,$2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,
     $434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$fa65,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,
     $230e,$18fb,$8812,$881b,$429a,$d3e0,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,
     $8812,$881b,$429a,$d3cd,$2026,$f000,$fa19,$2312,$18fb,$2200,$801a,$e029,$2310,$18fb,$2200,$801a,
     $e016,$2410,$193b,$881a,$2312,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,
     $0018,$f000,$fa2b,$193b,$881a,$193b,$3201,$801a,$2310,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,
     $2112,$187b,$881a,$187b,$3201,$801a,$2312,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$f000,$fafe,
     $46c0,$46bd,$b007,$bd90,$0000,$b590,$b085,$af00,$6078,$230a,$18fb,$2210,$b590,$b085,$af00,$6078,
     $230a,$18fb,$2210,$801a,$2308,$18fb,$22fa,$801a,$4b48,$681b,$b29b,$2100,$0018,$f000,$fb47,$2001,
     $f000,$f98c,$4b43,$681b,$b29b,$2101,$0018,$f000,$fb3d,$4b41,$0018,$f000,$fa8d,$2037,$f000,$f9b0,
     $2000,$f000,$f9db,$2000,$f000,$f9d8,$2000,$f000,$f9d5,$2000,$f000,$f9d2,$2000,$f000,$f9cf,$2040,
     $f000,$f9cc,$2000,$f000,$f9c9,$2000,$f000,$f9c6,$2000,$f000,$f9c3,$2000,$f000,$f9c0,$203c,$f000,
     $f98f,$2080,$f000,$f9ba,$2022,$f000,$f989,$20c0,$f000,$f9b4,$2020,$f000,$f983,$f000,$f963,$23f9,
     $2279,$2100,$2000,$f000,$f9d7,$2100,$2000,$f000,$fa23,$2024,$f000,$f974,$230e,$18fb,$2200,$801a,
     $e029,$230c,$18fb,$2200,$801a,$e016,$240c,$193b,$881a,$230e,$18fb,$881b,$210a,$1879,$8809,$434b,
     $18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f986,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,
     $18fb,$8812,$881b,$429a,$d3e0,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$2308,$18fb,$8812,
     $881b,$429a,$d3cd,$f000,$fae1,$46c0,$46bd,$b005,$bd90,$46c0,$4380,$2000,$0338,$2000,$b580,$af00,
     $2010,$f7ff,$fcaf,$2001,$b580,$af00,$2010,$f000,$f927,$2001,$f000,$f952,$2064,$f000,$f8ef,$46c0,
     $46bd,$bd80,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f7ff,$b580,$af00,$b403,$4905,$600d,$604e,
     $608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43b8,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,
     $b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,
     $4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$fa9e,
     $4b10,$681b,$b29b,$2101,$0018,$f000,$fa97,$4b0f,$681b,$b29b,$2101,$0018,$f000,$fa90,$4b0a,$681b,
     $b29b,$2100,$0018,$f000,$fa89,$4b08,$681b,$b29b,$2101,$0018,$f000,$fa4a,$46c0,$46bd,$b004,$bd80,
     $4380,$2000,$4378,$2000,$436c,$2000,$4374,$2000,$4370,$2000,$437c,$2000,$b580,$af00,$2302,$2201,
     $2103,$2000,$4a80,$0040,$0000,$0000,$0000,$0000,$4a40,$0080,$0000,$0000,$0000,$0000,$4a80,$0040,
     $0000,$0000,$0000,$0000,$4a40,$0080,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $000f,$0000,$0000,$0f00,$0000,$000f,$0200,$000f,$0000,$0000,$0100,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$2222,$2222,$2222,$0000,$2200,$4117,
     $3200,$0036,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f9db,$2014,$f000,$f820,$4b0b,$681b,
     $b29b,$2100,$0018,$f000,$f9d1,$2002,$f000,$f816,$4b06,$681b,$b29b,$2101,$0018,$f000,$f9c7,$2014,
     $f000,$f80c,$46c0,$46bd,$bd80,$46c0,$4380,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,
     $af00,$6078,$687b,$0018,$f000,$fa18,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,
     $607a,$603b,$b580,$af00,$4b09,$681b,$b29b,$0018,$f000,$fa1a,$1e03,$d003,$200a,$f7ff,$ffdf,$e7f3,
     $46c0,$200a,$f7ff,$ffda,$46c0,$46bd,$bd80,$46c0,$436c,$2000,$b580,$af00,$2022,$f7ff,$ff93,$20c7,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f979,$4b0c,$681b,$b29b,
     $2100,$0018,$f000,$f972,$1dfb,$781b,$0018,$f000,$fa03,$4b06,$681b,$b29b,$2101,$0018,$f000,$f966,
     $46c0,$46bd,$b002,$bd80,$4378,$2000,$4374,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,$f94b,$4b0c,$681b,$b29b,$2100,$0018,
     $f000,$f944,$1dfb,$781b,$0018,$f000,$f9d5,$4b06,$681b,$b29b,$2101,$0018,$f000,$f938,$46c0,$46bd,
     $b002,$bd80,$4378,$2000,$4374,$2000,$b580,$af00,$4b09,$681b,$b29b,$0018,$b5b0,$b082,$af00,$0005,
     $000c,$0010,$0019,$1dbb,$1c2a,$801a,$1d3b,$1c22,$801a,$1cbb,$1c02,$801a,$003b,$1c0a,$801a,$2044,
     $f7ff,$ff8e,$1dbb,$881b,$08db,$b29b,$b2db,$0018,$f7ff,$ffb4,$1cbb,$881b,$08db,$b29b,$b2db,$0018,
     $f7ff,$ffac,$2045,$f7ff,$ff7b,$1d3b,$881b,$b2db,$0018,$f7ff,$ffa3,$1d3b,$881b,$0a1b,$b29b,$b2db,
     $0018,$f7ff,$ff9b,$003b,$881b,$b2db,$0018,$f7ff,$ff95,$003b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,
     $ff8d,$46c0,$46bd,$b002,$bdb0,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1d3b,$1c0a,$801a,$204e,$f7ff,$ff48,$1dbb,$881b,$b2db,$0018,$f7ff,$ff70,$204f,$f7ff,
     $ff3f,$1d3b,$881b,$b2db,$0018,$f7ff,$ff67,$1d3b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff5f,$46c0,
     $46bd,$b002,$bd80,$0000,$b580,$af00,$f7ff,$fe7c,$2064,$f7ff,$b580,$b082,$af00,$6078,$687b,$0018,
     $f000,$f956,$203f,$f7ff,$ff1b,$687b,$3399,$781b,$0018,$f7ff,$ff43,$2003,$f7ff,$ff12,$687b,$339a,
     $781b,$0018,$f7ff,$ff3a,$2004,$f7ff,$ff09,$687b,$339b,$781b,$0018,$f7ff,$ff31,$687b,$339c,$781b,
     $0018,$f7ff,$ff2b,$687b,$339d,$781b,$0018,$f7ff,$ff25,$202c,$f7ff,$fef4,$687b,$339e,$781b,$0018,
     $f7ff,$ff1c,$46c0,$46bd,$b002,$bd80,$b5b0,$b082,$af00,$0005,$000c,$0010,$0019,$1dbb,$b580,$af00,
     $2022,$f7ff,$fedd,$20c7,$f7ff,$ff08,$2020,$f7ff,$fed7,$f7ff,$feb7,$46c0,$46bd,$bd80,$b580,$af00,
     $2022,$f7ff,$ff83,$200f,$f7ff,$ffa8,$4000,$0000,$0000,$0000,$0000,$0000,$8080,$0000,$0000,$0000,
     $0000,$0000,$4040,$0000,$0000,$0000,$0000,$0000,$8000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0014,$0000,$0000,$0100,$0000,$0000,$0000,$0001,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$2222,$2222,
     $2222,$0000,$2200,$4117,$3200,$0036,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,
     $881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f8ca,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$af00,$2022,$f7ff,$fe55,$200f,$f7ff,$fe80,$2020,$f7ff,
     $fe4f,$f7ff,$fe2f,$46c0,$46bd,$bd80,$b590,$b085,$af00,$6078,$2032,$f7ff,$ff71,$230f,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f8bc,$1d3b,$881b,$2b00,$d003,
     $1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f8cc,$e006,$1dbb,$881b,$2101,$0018,$f000,
     $f8c5,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,
     $af00,$6078,$6878,$239a,$2200,$2100,$f000,$f8d2,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,
     $1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8d9,$0003,
     $0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b084,$af00,$0002,
     $1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f89e,$46c0,$46bd,$b004,$bd80,
     $b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,$b590,$b085,$af00,$6078,$2032,$f7ff,$fdc1,$230f,
     $18fb,$2200,$701a,$e00d,$240f,$193b,$781b,$687a,$18d3,$781b,$0018,$f7ff,$fde1,$193b,$781a,$193b,
     $3201,$701a,$230f,$18fb,$781b,$2b98,$d9ec,$f7ff,$fd89,$46c0,$46bd,$b005,$bd90,$b580,$b082,$af00,
     $6078,$687b,$0018,$f7ff,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,
     $1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f88a,$e003,$68fb,$0018,$f000,$f899,$46c0,$46bd,$b004,
     $bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b082,$af00,$6078,$687b,$2100,$0018,$f000,
     $f815,$687b,$2100,$0018,$f7ff,$ffce,$687b,$2105,$0018,$f000,$f88f,$46c0,$46bd,$b002,$bd80,$0000,
     $b40f,$b580,$b082,$af00,$4b0b,$0018,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,
     $0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8ae,$e003,$68fb,$0018,$f000,$f8bd,$46c0,
     $46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$b590,$b087,$af00,$60f8,$60b9,$607a,
     $603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,
     $43b8,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,
     $687a,$4091,$000a,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,
     $061b,$687a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b088,$af00,$6078,$000a,$1cfb,
     $701a,$687b,$0018,$f000,$f85b,$687b,$009b,$4a13,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,
     $681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4694,$4463,$68fa,$601a,$46c0,
     $46c0,$4907,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$46c0,$c004,$4001,
     $4000,$4001,$b580,$b082,$af00,$6078,$687b,$2100,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,
     $46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a

REM 0 bytes
LABEL C_RODATA
