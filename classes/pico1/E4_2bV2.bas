rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_4in2b_V2.c
rem * | Author      :   Waveshare team
rem * | Function    :   4.2inch e-paper b V2
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2020-11-25
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

method EPD_4IN2B_V2_INIT
  goto C_EPD_4IN2B_V2_INIT
method EPD_4IN2B_V2_CLEAR
  goto C_EPD_4IN2B_V2_CLEAR
method EPD_4IN2B_V2_DISPLAY
  goto C_EPD_4IN2B_V2_DISPLAY
method EPD_4IN2B_V2_SLEEP
  goto C_EPD_4IN2B_V2_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+644,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+788,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+792,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+796,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+800,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+804,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+808,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+896,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+984,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+988,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1076,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1164,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1168,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1820,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_4IN2B_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f849,$b002,$bd00,$46c0
LABEL C_EPD_4IN2B_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f855,$b002,$bd00,$46c0
LABEL C_EPD_4IN2B_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8b3,$b002,$bd00,$46c0
LABEL C_EPD_4IN2B_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f935,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f945,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f94d,$b002,$bd00,$46c0

REM 2204 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f998,$2004,$f000,$f9c1,$f000,$f9ed,$2000,$f000,$f9bc,$200f,$f000,$fa13,$46c0,
     $46bd,$bd80,$b580,$b084,$af00,$1dbb,$2232,$801a,$1d3b,$2296,$b580,$b084,$af00,$1dbb,$2232,$801a,
     $1d3b,$2296,$0052,$801a,$2010,$f000,$f9a1,$230e,$18fb,$2200,$801a,$e01a,$230c,$18fb,$2200,$801a,
     $e008,$20ff,$f000,$f9ee,$210c,$187b,$881a,$187b,$3201,$801a,$230c,$18fa,$1dbb,$8812,$881b,$429a,
     $d3ef,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$2013,$f000,
     $f977,$230a,$18fb,$2200,$801a,$e01a,$2308,$18fb,$2200,$801a,$e008,$20ff,$f000,$f9c4,$2108,$187b,
     $881a,$187b,$3201,$801a,$2308,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210a,$187b,$881a,$187b,$3201,
     $801a,$230a,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$f000,$f9d6,$46c0,$46bd,$b004,$bd80,$b590,$b087,
     $af00,$6078,$6039,$230e,$18fb,$2232,$b590,$b087,$af00,$6078,$6039,$230e,$18fb,$2232,$801a,$230c,
     $18fb,$2296,$0052,$801a,$2010,$f000,$f931,$2316,$18fb,$2200,$801a,$e029,$2314,$18fb,$2200,$801a,
     $e016,$2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,
     $0018,$f000,$f96f,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,
     $2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$2013,$f000,
     $f8f7,$2312,$18fb,$2200,$801a,$e029,$2310,$18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,$18fb,
     $881b,$210e,$1879,$8809,$434b,$18d3,$001a,$683b,$189b,$781b,$0018,$f000,$f935,$193b,$881a,$193b,
     $3201,$801a,$2310,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,$801a,
     $2312,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$f000,$f946,$46c0,$46bd,$b007,$bd90,$b580,$af00,
     $2050,$f7ff,$fe7a,$20f7,$f7ff,$fe9f,$b580,$af00,$2050,$f000,$f8ad,$20f7,$f000,$f904,$2002,$f000,
     $f8a7,$f000,$f8d3,$2007,$f000,$f8a2,$20a5,$f000,$f8f9,$46c0,$46bd,$bd80,$0000,$b580,$af00,$4b10,
     $681b,$b29b,$2101,$0018,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,
     $bd80,$0000,$43b8,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,
     $603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,
     $4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f8fa,$4b10,$681b,$b29b,$2101,$0018,$f000,
     $f8f3,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f8ec,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f8e5,$4b08,
     $681b,$b29b,$2101,$0018,$f000,$f90e,$46c0,$46bd,$b004,$bd80,$4380,$2000,$4378,$2000,$436c,$2000,
     $4374,$2000,$4370,$2000,$437c,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,
     $b29b,$2101,$0018,$f000,$f8ef,$20c8,$f000,$f90c,$4b0b,$681b,$b29b,$2100,$0018,$f000,$f8e5,$2002,
     $f000,$f902,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8db,$20c8,$f000,$f8f8,$46c0,$46bd,$bd80,$46c0,
     $4380,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,
     $b29b,$2100,$0018,$f000,$f8bf,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8b8,$1dfb,$781b,$0018,$f000,
     $f8e7,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8ac,$46c0,$46bd,$b002,$bd80,$4378,$2000,$4374,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b590,$b083,$af00,$2071,$f7ff,$ffcc,$4b0e,$681b,$b29b,$1dfc,
     $0018,$f000,$f8e1,$0003,$7023,$1dfb,$781b,$2201,$4013,$425a,$4153,$b2da,$1dfb,$701a,$1dfb,$781b,
     $2b00,$d1e6,$20c8,$f000,$f89f,$46c0,$46bd,$b003,$bd90,$46c0,$436c,$2000,$b580,$af00,$2012,$f7ff,
     $ff85,$2064,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,$f865,$4b0c,
     $681b,$b29b,$2100,$0018,$f000,$f85e,$1dfb,$781b,$0018,$f000,$f88d,$4b06,$681b,$b29b,$2101,$0018,
     $f000,$f852,$46c0,$46bd,$b002,$bd80,$4378,$2000,$4374,$2000,$b590,$b083,$af00,$2071,$f7ff,$ffaa,
     $b580,$af00,$2012,$f7ff,$ff73,$2064,$f000,$f85c,$f7ff,$ff9c,$46c0,$46bd,$bd80,$b580,$af00,$f7ff,
     $ff53,$2004,$f7ff,$ff76,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,
     $f000,$f88a,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f89a,
     $e006,$1dbb,$881b,$2101,$0018,$f000,$f893,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,
     $781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f896,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1dbb,$881b,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8a6,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,
     $60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a0,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,
     $23d0,$061b,$685b,$2101,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8a7,$0003,
     $0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b082,$af00,$6078,
     $687b,$2100,$0018,$f000,$f815,$687b,$2100,$0018,$f000,$f834,$687b,$2105,$0018,$f000,$f8a1,$46c0,
     $46bd,$b002,$bd80,$0000,$b40f,$b580,$b082,$af00,$4b0b,$0018,$b580,$b084,$af00,$6078,$000a,$1cfb,
     $701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8c0,$e003,$68fb,
     $0018,$f000,$f8cf,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,
     $f000,$f8c4,$e003,$68fb,$0018,$f000,$f8d3,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,
     $061b,$687a,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f80c,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,
     $68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43b8,$2000,
     $b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,$687a,$4091,
     $000a,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,
     $b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f883,$687b,$009b,$4a13,$4694,$4463,
     $61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,
     $0152,$4694,$4463,$68fa,$601a,$46c0,$46c0,$4907,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,
     $46bd,$b008,$bd80,$46c0,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$687b,$2100,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,
     $af00,$6078,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a

REM 0 bytes
LABEL C_RODATA
