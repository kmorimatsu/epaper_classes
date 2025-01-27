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
  POKE32 DATAADDRESS(C_FUNCTIONS)+596,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+740,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+744,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+748,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+752,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+756,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+760,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+844,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+908,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+992,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+996,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1080,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1084,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1796,C_RAM+0
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
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f87d,$b002,$bd00,$46c0
LABEL C_EPD_2IN66_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8d5,$b002,$bd00,$46c0
LABEL C_EPD_2IN66_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8f7,$b002,$bd00,$46c0
LABEL C_EPD_2IN66_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f927,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f92b,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f935,$b002,$bd00,$46c0

REM 1988 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f980,$f000,$f9a8,$2012,$f000,$f9c5,$f000,$f9a3,$2011,$f000,$f9c0,$2003,$f000,
     $f9e9,$2044,$f000,$f9ba,$2001,$f000,$f9e3,$2013,$f000,$f9e0,$2045,$f000,$f9b1,$2000,$f000,$f9da,
     $2000,$f000,$f9d7,$2028,$f000,$f9d4,$2001,$f000,$f9d1,$f000,$f983,$bf00,$bd80,$b580,$af00,$f7ff,
     $ff1d,$f7ff,$ff8b,$2012,$b580,$af00,$f000,$f94c,$f000,$f974,$2012,$f000,$f991,$f000,$f96f,$f000,
     $f9e5,$2037,$f000,$f98a,$2000,$f000,$f9b3,$2000,$f000,$f9b0,$2000,$f000,$f9ad,$2000,$f000,$f9aa,
     $2000,$f000,$f9a7,$2040,$f000,$f9a4,$2000,$f000,$f9a1,$2000,$f000,$f99e,$2000,$f000,$f99b,$2000,
     $f000,$f998,$2011,$f000,$f969,$2003,$f000,$f992,$2044,$f000,$f963,$2001,$f000,$f98c,$2013,$f000,
     $f989,$2045,$f000,$f95a,$2000,$f000,$f983,$2000,$f000,$f980,$2028,$f000,$f97d,$2001,$f000,$f97a,
     $203c,$f000,$f94b,$2080,$f000,$f974,$2022,$f000,$f945,$20cf,$f000,$f96e,$2020,$f000,$f93f,$f000,
     $f91d,$bf00,$bd80,$b580,$b082,$af00,$2313,$807b,$f44f,$7394,$b580,$b082,$af00,$2313,$807b,$f44f,
     $7394,$803b,$2024,$f000,$f929,$2300,$80fb,$e00f,$2300,$80bb,$e005,$20ff,$f000,$f94c,$88bb,$3301,
     $80bb,$88ba,$887b,$429a,$d3f5,$88fb,$3301,$80fb,$88fa,$883b,$429a,$d9eb,$f000,$f98c,$bf00,$3708,
     $46bd,$bd80,$b580,$b086,$af00,$6078,$2313,$827b,$f44f,$7394,$b580,$b086,$af00,$6078,$2313,$827b,
     $f44f,$7394,$823b,$2300,$60fb,$2024,$f000,$f8f6,$2300,$82fb,$e01a,$2300,$82bb,$e010,$8aba,$8afb,
     $8a79,$fb01,$f303,$4413,$60fb,$687a,$68fb,$4413,$781b,$4618,$f000,$f90e,$8abb,$3301,$82bb,$8aba,
     $8a7b,$429a,$d3ea,$8afb,$3301,$82fb,$8afa,$8a3b,$429a,$d3e0,$f000,$f94e,$bf00,$3718,$46bd,$bd80,
     $b580,$af00,$2010,$f7ff,$fe83,$2001,$f7ff,$fea6,$b580,$af00,$2010,$f000,$f8c1,$2001,$f000,$f8ea,
     $bf00,$bd80,$b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$f7fd,$b480,$af00,$b403,$4906,$600d,$604e,
     $608f,$ea5f,$0008,$60c8,$bc03,$bf00,$46bd,$f85d,$7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,
     $683b,$6013,$4a1a,$68bb,$6013,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,
     $f000,$f908,$4b10,$681b,$b29b,$2101,$4618,$f000,$f901,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f8fa,
     $4b0a,$681b,$b29b,$2100,$4618,$f000,$f8f3,$4b08,$681b,$b29b,$2101,$4618,$f000,$f916,$bf00,$3710,
     $46bd,$bd80,$43a8,$2000,$43a0,$2000,$4394,$2000,$439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,
     $2302,$2201,$2103,$2000,$b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f8f7,$20c8,$f000,$f912,
     $4b0a,$681b,$b29b,$2100,$4618,$f000,$f8ed,$2002,$f000,$f908,$4b05,$681b,$b29b,$2101,$4618,$f000,
     $f8e3,$20c8,$f000,$f8fe,$bf00,$bd80,$43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$af00,
     $2064,$f000,$f8ef,$e002,$2064,$f000,$f8eb,$4b07,$681b,$b29b,$4618,$f000,$f8f7,$4603,$2b01,$d0f3,
     $2064,$f000,$f8df,$bf00,$bd80,$bf00,$4394,$2000,$b580,$af00,$2020,$f7ff,$ff95,$f7ff,$b580,$b082,
     $af00,$4603,$71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f8aa,$4b0b,$681b,$b29b,$2100,$4618,$f000,
     $f8a3,$79fb,$4618,$f000,$f8e5,$4b06,$681b,$b29b,$2101,$4618,$f000,$f898,$bf00,$3708,$46bd,$bd80,
     $43a0,$2000,$439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,
     $681b,$b29b,$2101,$4618,$f000,$f87e,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f877,$79fb,$4618,$f000,
     $f8b9,$4b06,$681b,$b29b,$2101,$4618,$f000,$f86c,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,
     $b580,$af00,$2064,$f7fd,$febd,$e002,$b580,$b082,$af00,$2032,$f7ff,$ffa2,$2300,$80fb,$e008,$88fb,
     $4a08,$5cd3,$4618,$f7ff,$ffc5,$88fb,$3301,$80fb,$88fb,$2b98,$d9f3,$f7ff,$ff71,$bf00,$3708,$46bd,
     $bd80,$bf00,$b3d4,$1000,$b580,$af00,$f7ff,$ff4a,$f7ff,$ffb8,$b580,$af00,$2020,$f7ff,$ff7f,$f7ff,
     $ff5d,$bf00,$bd80,$0000,$b580,$b082,$af00,$2032,$f7ff,$ff8a,$b580,$b082,$af00,$4603,$460a,$80fb,
     $4613,$80bb,$88fb,$4618,$f000,$f87e,$88bb,$2b00,$d002,$88bb,$2b00,$d105,$88fb,$2100,$4618,$f000,
     $f88f,$e005,$88fb,$2101,$4618,$f000,$f889,$bf00,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$6078,
     $6878,$f7ff,$ff51,$bf00,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,$88fa,$797b,$2b00,$bf14,
     $2301,$2300,$b2db,$4619,$4610,$f000,$f885,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$80fb,
     $88fb,$4618,$b580,$b082,$af00,$6078,$6878,$f000,$f88f,$bf00,$3708,$46bd,$bd80,$0000,$b580,$b084,
     $af00,$60f8,$60b9,$607a,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,$f891,$4603,$4618,$3708,
     $46bd,$bd80,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b084,$af00,$4603,$71fb,$79fb,
     $60fb,$f107,$010c,$2394,$2203,$2001,$f000,$f894,$bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,
     $f04f,$4350,$685a,$2101,$b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,$2100,$6878,$f000,$f82c,
     $2105,$6878,$f000,$f896,$bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,$4809,$f002,$f99e,$693b,
     $b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3044,$bf00,$bf00,
     $3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$b480,$b085,$af00,$6078,
     $460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,
     $4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,
     $f000,$f82a,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$b480,$b083,
     $af00,$6078,$f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,$2b00,$bf14,$2301,$2300,$b2db,$4618,
     $370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,$687a,$68b9,$68f8,$47a0,$4603,$4618,$371c,$46bd,
     $bd90,$bf00,$4400,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b08a,$af00,$6078,$460b,$70fb,
     $6878,$f000,$f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$405a,
     $697b,$4013,$69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,$6013,$bf00,$bf00,$490d,$78fa,$687b,
     $00db,$440b,$605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,$623b,$6a7b,$f503,$5340,$461a,$6a3b,
     $6013,$bf00,$bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,$b580,$b082,$af00,$6078,$2100,$6878,
     $b480,$b083,$af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,
     $687b,$60fb

REM 0 bytes
LABEL C_RODATA
