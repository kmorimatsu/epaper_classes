rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:	EPD_5in83b_V2.c
rem * | Author      :   Waveshare team
rem * | Function    :   Electronic paper driver
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2020-07-04
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

method EPD_5IN83B_V2_INIT
  goto C_EPD_5IN83B_V2_INIT
method EPD_5IN83B_V2_CLEAR
  goto C_EPD_5IN83B_V2_CLEAR
method EPD_5IN83B_V2_DISPLAY
  goto C_EPD_5IN83B_V2_DISPLAY
method EPD_5IN83B_V2_SLEEP
  goto C_EPD_5IN83B_V2_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+548,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+692,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+696,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+700,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+704,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+708,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+712,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+796,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+880,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+884,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+968,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+972,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1092,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1644,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_5IN83B_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f849,$b002,$bd00,$46c0
LABEL C_EPD_5IN83B_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f88b,$b002,$bd00,$46c0
LABEL C_EPD_5IN83B_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8b9,$b002,$bd00,$46c0
LABEL C_EPD_5IN83B_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f90b,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f913,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f91d,$b002,$bd00,$46c0

REM 1896 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f968,$2001,$f000,$f98f,$2007,$f000,$f9b8,$2007,$f000,$f9b5,$203f,$f000,$f9b2,
     $203f,$f000,$f9af,$2004,$f000,$f980,$2064,$f000,$f9d5,$f000,$f9e5,$2000,$f000,$f978,$200f,$f000,
     $f9a1,$2061,$f000,$f972,$2002,$f000,$f99b,$2088,$f000,$f998,$2001,$f000,$f995,$20e0,$f000,$f992,
     $2015,$f000,$f963,$2000,$f000,$f98c,$2050,$f000,$f95d,$2011,$f000,$f986,$2007,$f000,$f983,$2060,
     $f000,$f954,$2022,$f000,$f97d,$2300,$4618,$bd80,$b580,$b082,$af00,$2351,$80bb,$f44f,$73f0,$807b,
     $b580,$b082,$af00,$2351,$80bb,$f44f,$73f0,$807b,$2010,$f000,$f93b,$2300,$80fb,$e005,$20ff,$f000,
     $f961,$88fb,$3301,$80fb,$88fa,$88bb,$8879,$fb01,$f303,$429a,$dbf2,$2013,$f000,$f928,$2300,$80fb,
     $e005,$2000,$f000,$f94e,$88fb,$3301,$80fb,$88fa,$88bb,$8879,$fb01,$f303,$429a,$dbf2,$f000,$f9aa,
     $bf00,$3708,$46bd,$bd80,$b580,$b088,$af00,$6078,$6039,$2351,$60fb,$f44f,$b580,$b088,$af00,$6078,
     $6039,$2351,$60fb,$f44f,$73f0,$60bb,$2010,$f000,$f8fd,$2300,$61fb,$e018,$2300,$61bb,$e00e,$69fb,
     $68fa,$fb03,$f202,$69bb,$4413,$687a,$4413,$781b,$4618,$f000,$f917,$69bb,$3301,$61bb,$69ba,$68fb,
     $429a,$d3ec,$69fb,$3301,$61fb,$69fa,$68bb,$429a,$d3e2,$2013,$f000,$f8da,$2300,$617b,$e01a,$2300,
     $613b,$e010,$697b,$68fa,$fb03,$f202,$693b,$4413,$683a,$4413,$781b,$43db,$b2db,$4618,$f000,$f8f2,
     $693b,$3301,$613b,$693a,$68fb,$429a,$d3ea,$697b,$3301,$617b,$697a,$68bb,$429a,$d3e0,$f000,$f94a,
     $bf00,$3720,$46bd,$bd80,$b580,$af00,$2002,$f7ff,$feab,$f7ff,$fef5,$2007,$b580,$af00,$2002,$f000,
     $f8a5,$f000,$f90d,$2007,$f000,$f8a0,$20a5,$f000,$f8c9,$bf00,$bd80,$0000,$b580,$af00,$4b0f,$681b,
     $b29b,$2101,$b480,$af00,$b403,$4906,$600d,$604e,$608f,$ea5f,$0008,$60c8,$bc03,$bf00,$46bd,$f85d,
     $7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,
     $603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,$683b,$6013,$4a1a,$68bb,$6013,$4b1a,$2212,$601a,
     $4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,$f000,$f904,$4b10,$681b,$b29b,$2101,$4618,$f000,
     $f8fd,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f8f6,$4b0a,$681b,$b29b,$2100,$4618,$f000,$f8ef,$4b08,
     $681b,$b29b,$2101,$4618,$f000,$f912,$bf00,$3710,$46bd,$bd80,$43a8,$2000,$43a0,$2000,$4394,$2000,
     $439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b0f,$681b,
     $b29b,$2101,$4618,$f000,$f8f3,$20c8,$f000,$f876,$4b0a,$681b,$b29b,$2100,$4618,$f000,$f8e9,$2001,
     $f000,$f86c,$4b05,$681b,$b29b,$2101,$4618,$f000,$f8df,$20c8,$f000,$f862,$bf00,$bd80,$43a8,$2000,
     $b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2100,$4618,
     $f000,$f8c6,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f8bf,$79fb,$4618,$f000,$f8d9,$4b06,$681b,$b29b,
     $2101,$4618,$f000,$f8b4,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,$af00,$4603,
     $71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f89a,$4b0b,$681b,
     $b29b,$2101,$4618,$f000,$f893,$79fb,$4618,$f000,$f8ad,$4b05,$681b,$b29b,$2101,$4618,$f000,$f888,
     $bf00,$3708,$46bd,$bd80,$439c,$2000,$43a0,$2000,$b580,$b082,$af00,$2071,$f7ff,$ffae,$b580,$b082,
     $af00,$6078,$6878,$f000,$f8ab,$bf00,$3708,$46bd,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,
     $b580,$b082,$af00,$2071,$f7ff,$ff90,$4b0d,$681b,$b29b,$4618,$f000,$f8aa,$4603,$71fb,$79fb,$f003,
     $0301,$2b00,$bf0c,$2301,$2300,$b2db,$71fb,$79fb,$2b00,$d1e8,$20c8,$f7ff,$ffd1,$bf00,$3708,$46bd,
     $bd80,$bf00,$4394,$2000,$b580,$af00,$2012,$f7ff,$ff8b,$2064,$b580,$af00,$2012,$f7ff,$ff67,$2064,
     $f7ff,$ffbc,$f7ff,$ffcc,$bf00,$bd80,$b580,$af00,$f7ff,$ff5c,$2001,$f7ff,$ff7d,$2007,$b580,$b082,
     $af00,$4603,$460a,$80fb,$4613,$80bb,$88fb,$4618,$f000,$f882,$88bb,$2b00,$d002,$88bb,$2b00,$d105,
     $88fb,$2100,$4618,$f000,$f893,$e005,$88fb,$2101,$4618,$f000,$f88d,$bf00,$bf00,$3708,$46bd,$bd80,
     $b580,$b082,$af00,$6078,$6878,$f7ff,$ff51,$bf00,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,
     $88fa,$797b,$2b00,$bf14,$2301,$2300,$b2db,$4619,$4610,$f000,$f889,$bf00,$3708,$46bd,$bd80,$b580,
     $b082,$af00,$4603,$80fb,$88fb,$4618,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$010c,$2394,
     $2203,$2001,$f000,$f88c,$bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,
     $b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f876,$bf00,$3708,$46bd,$bd80,$b580,$b084,
     $af00,$4603,$71fb,$79fb,$60fb,$f107,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,$f87f,$4603,
     $4618,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b082,$af00,$6078,
     $2100,$6878,$f000,$f814,$2100,$6878,$f000,$f82c,$2105,$6878,$f000,$f880,$bf00,$3708,$46bd,$bd80,
     $b40f,$b580,$b082,$af00,$4809,$f002,$f99e,$693b,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,
     $78fb,$72fb,$68fb,$7afa,$ec42,$3044,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,
     $4603,$460a,$80fb,$4613,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,
     $ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,
     $b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,$687a,$68b9,$68f8,$47a0,
     $4603,$4618,$371c,$46bd,$bd90,$bf00,$4400,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b480,$b083,
     $af00,$6078,$f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,$2b00,$bf14,$2301,$2300,$b2db,$4618,
     $370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b08a,$af00,$6078,
     $460b,$70fb,$6878,$f000,$f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,
     $69bb,$405a,$697b,$4013,$69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,$6013,$bf00,$bf00,$490d,
     $78fa,$687b,$00db,$440b,$605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,$623b,$6a7b,$f503,$5340,
     $461a,$6a3b,$6013,$bf00,$bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,$b580,$b082,$af00,$6078,
     $2100,$6878,$b480,$b083,$af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,
     $460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
