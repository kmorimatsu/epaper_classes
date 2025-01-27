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
  POKE32 DATAADDRESS(C_FUNCTIONS)+216,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+924,C_RAM+16
  POKE32 DATAADDRESS(C_FUNCTIONS)+1068,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1072,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1076,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1080,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1084,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1088,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1172,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1176,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1260,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1264,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1312,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1360,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1540,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1992,C_RAM+16
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
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f89d,$b002,$bd00,$46c0
LABEL C_EPD_5IN65F_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8af,$b002,$bd00,$46c0
LABEL C_EPD_5IN65F_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8f5,$b002,$bd00,$46c0
LABEL C_EPD_5IN65F_DISPLAY_PART
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f957,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9cf,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9d9,$b002,$bd00,$46c0

REM 2244 bytes
LABEL C_FUNCTIONS
EXEC $b580,$b084,$af00,$4603,$71fb,$2061,$f000,$fa20,$2002,$f000,$fa49,$2058,$f000,$fa46,$2001,$f000,
     $fa43,$20c0,$f000,$fa40,$2010,$f000,$fa11,$2300,$60fb,$e017,$2300,$60bb,$e00d,$79fb,$011b,$b25a,
     $f997,$3007,$4313,$b25b,$b2db,$4618,$f000,$fa2c,$68bb,$3301,$60bb,$68bb,$f5b3,$7fe0,$dbed,$68fb,
     $3301,$60fb,$68fb,$f5b3,$7f96,$dbe3,$2004,$f000,$f9ef,$f000,$fa45,$2012,$f000,$f9ea,$f000,$fa40,
     $2002,$f000,$f9e5,$f000,$fa53,$f44f,$70fa,$f000,$fa67,$bf00,$3710,$46bd,$bd80,$b580,$b084,$af00,
     $6078,$2061,$f7ff,$fed4,$b580,$af00,$2064,$f000,$fa57,$2007,$f000,$f9cc,$20a5,$f000,$f9f5,$2064,
     $f000,$fa4e,$4b04,$681b,$b29b,$2100,$4618,$f000,$fa59,$bf00,$bd80,$bf00,$43a8,$2000,$b580,$af00,
     $4b0f,$681b,$b29b,$2101,$b580,$b084,$af00,$6078,$2061,$f000,$f9ad,$2002,$f000,$f9d6,$2058,$f000,
     $f9d3,$2001,$f000,$f9d0,$20c0,$f000,$f9cd,$2010,$f000,$f99e,$2300,$60fb,$e019,$2300,$60bb,$e00f,
     $68fb,$f44f,$7296,$fb03,$f202,$68bb,$4413,$687a,$4413,$781b,$4618,$f000,$f9b7,$68bb,$3301,$60bb,
     $68bb,$f5b3,$7f96,$d3eb,$68fb,$3301,$60fb,$68fb,$f5b3,$7fe0,$d3e1,$2004,$f000,$f97a,$f000,$f9d0,
     $2012,$f000,$f975,$f000,$f9cb,$2002,$f000,$f970,$f000,$f9de,$20c8,$f000,$f9f3,$bf00,$3710,$46bd,
     $bd80,$b580,$b086,$af00,$60f8,$4608,$4611,$461a,$b580,$af00,$f000,$fa14,$f000,$f9b2,$2000,$f000,
     $f957,$20ef,$f000,$f980,$2008,$f000,$f97d,$2001,$f000,$f94e,$2037,$f000,$f977,$2000,$f000,$f974,
     $2023,$f000,$f971,$2023,$f000,$f96e,$2003,$f000,$f93f,$2000,$f000,$f968,$2006,$f000,$f939,$20c7,
     $f000,$f962,$20c7,$f000,$f95f,$201d,$f000,$f95c,$2030,$f000,$f92d,$203c,$f000,$f956,$2041,$f000,
     $f927,$2000,$f000,$f950,$2050,$f000,$f921,$2037,$f000,$f94a,$2060,$f000,$f91b,$2022,$f000,$f944,
     $2061,$f000,$f915,$2002,$f000,$f93e,$2058,$f000,$f93b,$2001,$f000,$f938,$20c0,$f000,$f935,$20e3,
     $f000,$f906,$20aa,$f000,$f92f,$2064,$f000,$f988,$2050,$f000,$f8fd,$2037,$f000,$f926,$bf00,$bd80,
     $b580,$b084,$af00,$4603,$71fb,$2061,$f7ff,$ff20,$b580,$b086,$af00,$60f8,$4608,$4611,$461a,$4603,
     $817b,$460b,$813b,$4613,$80fb,$2061,$f000,$f8e0,$2002,$f000,$f909,$2058,$f000,$f906,$2001,$f000,
     $f903,$20c0,$f000,$f900,$2010,$f000,$f8d1,$2300,$617b,$e042,$2300,$613b,$e038,$8c3a,$893b,$4413,
     $461a,$697b,$4293,$d22b,$893b,$697a,$429a,$d327,$88fa,$897b,$4413,$0fda,$4413,$105b,$461a,$693b,
     $4293,$d21d,$897b,$085b,$b29b,$461a,$693b,$4293,$d316,$897b,$085b,$b29b,$461a,$693b,$1a9a,$88fb,
     $085b,$b29b,$4618,$893b,$6979,$1acb,$fb00,$f303,$4413,$68fa,$4413,$781b,$4618,$f000,$f8c5,$e002,
     $2011,$f000,$f8c1,$693b,$3301,$613b,$693b,$f5b3,$7f96,$d3c2,$697b,$3301,$617b,$697b,$f5b3,$7fe0,
     $d3b8,$2004,$f000,$f884,$f000,$f8da,$2012,$f000,$f87f,$f000,$f8d5,$2002,$f000,$f87a,$f000,$f8e8,
     $20c8,$f000,$f8fd,$bf00,$3718,$46bd,$bd80,$0000,$b580,$af00,$2064,$f7f8,$fe3b,$2007,$b480,$af00,
     $b403,$4906,$600d,$604e,$608f,$ea5f,$0008,$60c8,$bc03,$bf00,$46bd,$f85d,$7b04,$4770,$4400,$2000,
     $b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4a1c,$687b,$6013,
     $4a1b,$68fb,$6013,$4a1b,$683b,$6013,$4a1a,$68bb,$6013,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,
     $681b,$b29b,$2101,$4618,$f000,$f914,$4b10,$681b,$b29b,$2101,$4618,$f000,$f90d,$4b0f,$681b,$b29b,
     $2101,$4618,$f000,$f906,$4b0a,$681b,$b29b,$2100,$4618,$f000,$f8ff,$4b08,$681b,$b29b,$2101,$4618,
     $f000,$f8b0,$bf00,$3710,$46bd,$bd80,$43a8,$2000,$43a0,$2000,$4394,$2000,$439c,$2000,$4398,$2000,
     $43a4,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,
     $2100,$4618,$f000,$f88e,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f887,$79fb,$4618,$f000,$f8f5,$4b06,
     $681b,$b29b,$2101,$4618,$f000,$f87c,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,
     $af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2101,$4618,$f000,$f862,
     $4b0b,$681b,$b29b,$2100,$4618,$f000,$f85b,$79fb,$4618,$f000,$f8c9,$4b06,$681b,$b29b,$2101,$4618,
     $f000,$f850,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$af00,$bf00,$4b06,$681b,$b29b,
     $b580,$af00,$bf00,$4b06,$681b,$b29b,$4618,$f000,$f8c5,$4603,$2b00,$d0f6,$bf00,$bf00,$bd80,$bf00,
     $4394,$2000,$b580,$af00,$bf00,$4b06,$681b,$b29b,$b580,$af00,$bf00,$4b06,$681b,$b29b,$4618,$f000,
     $f8ad,$4603,$2b00,$d1f6,$bf00,$bf00,$bd80,$bf00,$4394,$2000,$b580,$af00,$f7ff,$ff68,$f7ff,$ffd6,
     $b580,$b082,$af00,$6078,$6878,$f000,$f8ad,$bf00,$3708,$46bd,$bd80,$0000,$b580,$b084,$af00,$60f8,
     $60b9,$607a,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,$88fa,$797b,$2b00,$bf14,$2301,$2300,
     $b2db,$4619,$4610,$f000,$f8a5,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,
     $b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$f7ff,$ffd9,$20c8,$f7ff,$ffc4,$4b0a,$681b,$b29b,$2100,
     $4618,$f7ff,$ffcf,$2001,$f7ff,$ffba,$4b05,$681b,$b29b,$2101,$4618,$f7ff,$ffc5,$20c8,$f7ff,$ffb0,
     $bf00,$bd80,$43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$460a,$80fb,
     $4613,$80bb,$88fb,$4618,$f000,$f880,$88bb,$2b00,$d002,$88bb,$2b00,$d105,$88fb,$2100,$4618,$f000,
     $f891,$e005,$88fb,$2101,$4618,$f000,$f88b,$bf00,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$6078,
     $6878,$f7ff,$ff51,$bf00,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$010c,$2394,$2203,$2001,
     $f000,$f88c,$bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$b580,$b082,
     $af00,$4603,$80fb,$88fb,$4618,$f000,$f895,$4603,$4618,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,
     $460a,$80fb,$4613,$80bb,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f860,$bf00,$3708,
     $46bd,$bd80,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$b480,$b085,$af00,$6078,$460b,$70fb,
     $687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b480,
     $b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,$2100,$6878,
     $f7ff,$ffd8,$2105,$6878,$f000,$f864,$bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,$4809,$f002,
     $f99e,$693b,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3044,
     $bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$b590,$b087,
     $af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,$687a,$68b9,$68f8,$47a0,$4603,$4618,
     $371c,$46bd,$bd90,$bf00,$4400,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b480,$b083,$af00,$6078,
     $f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,$2b00,$bf14,$2301,$2300,$b2db,$4618,$370c,$46bd,
     $f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b08a,$af00,$6078,$460b,$70fb,
     $6878,$f000,$f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$405a,
     $697b,$4013,$69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,$6013,$bf00,$bf00,$490d,$78fa,$687b,
     $00db,$440b,$605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,$623b,$6a7b,$f503,$5340,$461a,$6a3b,
     $6013,$bf00,$bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,$b580,$b082,$af00,$6078,$2100,$6878,
     $b480,$b083,$af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,
     $687b,$60fb

REM 0 bytes
LABEL C_RODATA
