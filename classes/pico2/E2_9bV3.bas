rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_2in9b_V3.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.9inch e-paper b V3
rem * | Info        :
rem *----------------
rem * |	This version:   V1.1
rem * | Date        :   2020-12-03
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

method EPD_2IN9B_V3_INIT
  goto C_EPD_2IN9B_V3_INIT
method EPD_2IN9B_V3_CLEAR
  goto C_EPD_2IN9B_V3_CLEAR
method EPD_2IN9B_V3_DISPLAY
  goto C_EPD_2IN9B_V3_DISPLAY
method EPD_2IN9B_V3_SLEEP
  goto C_EPD_2IN9B_V3_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+528,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+672,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+676,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+680,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+684,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+688,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+692,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+776,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+860,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+864,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+948,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1032,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1036,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1584,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN9B_V3_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f849,$b002,$bd00,$46c0
LABEL C_EPD_2IN9B_V3_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f869,$b002,$bd00,$46c0
LABEL C_EPD_2IN9B_V3_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8a7,$b002,$bd00,$46c0
LABEL C_EPD_2IN9B_V3_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f901,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f909,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f913,$b002,$bd00,$46c0

REM 1836 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f95e,$2004,$f000,$f985,$f000,$f9af,$2000,$f000,$f980,$200f,$f000,$f9d3,$2089,
     $f000,$f9d0,$2061,$f000,$f977,$2080,$f000,$f9ca,$2001,$f000,$f9c7,$2028,$f000,$f9c4,$2050,$f000,
     $f96b,$2077,$f000,$f9be,$bf00,$bd80,$b580,$b084,$af00,$2310,$80fb,$f44f,$7394,$80bb,$b580,$b084,
     $af00,$2310,$80fb,$f44f,$7394,$80bb,$2010,$f000,$f953,$2300,$81fb,$e00f,$2300,$81bb,$e005,$20ff,
     $f000,$f9a0,$89bb,$3301,$81bb,$89ba,$88fb,$429a,$d3f5,$89fb,$3301,$81fb,$89fa,$88bb,$429a,$d3eb,
     $2013,$f000,$f939,$2300,$817b,$e00f,$2300,$813b,$e005,$20ff,$f000,$f986,$893b,$3301,$813b,$893a,
     $88fb,$429a,$d3f5,$897b,$3301,$817b,$897a,$88bb,$429a,$d3eb,$2012,$f000,$f91f,$f000,$f949,$bf00,
     $3710,$46bd,$bd80,$b580,$b086,$af00,$6078,$6039,$2310,$81fb,$b580,$b086,$af00,$6078,$6039,$2310,
     $81fb,$f44f,$7394,$81bb,$2010,$f000,$f905,$2300,$82fb,$e019,$2300,$82bb,$e00f,$8aba,$8afb,$89f9,
     $fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$f948,$8abb,$3301,$82bb,$8aba,$89fb,$429a,
     $d3eb,$8afb,$3301,$82fb,$8afa,$89bb,$429a,$d3e1,$2092,$f000,$f8e1,$2013,$f000,$f8de,$2300,$827b,
     $e019,$2300,$823b,$e00f,$8a3a,$8a7b,$89f9,$fb01,$f303,$4413,$461a,$683b,$4413,$781b,$4618,$f000,
     $f921,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3eb,$8a7b,$3301,$827b,$8a7a,$89bb,$429a,$d3e1,$2092,
     $f000,$f8ba,$2012,$f000,$f8b7,$f000,$f8e1,$bf00,$3718,$46bd,$bd80,$b580,$af00,$2002,$f7ff,$febf,
     $f7ff,$ff09,$b580,$af00,$2002,$f000,$f8a5,$f000,$f8cf,$2007,$f000,$f8a0,$20a5,$f000,$f8f3,$bf00,
     $bd80,$0000,$b580,$af00,$4b0f,$681b,$b29b,$2101,$b480,$af00,$b403,$4906,$600d,$604e,$608f,$ea5f,
     $0008,$60c8,$bc03,$bf00,$46bd,$f85d,$7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,
     $b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,$683b,$6013,
     $4a1a,$68bb,$6013,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,$f000,$f8de,
     $4b10,$681b,$b29b,$2101,$4618,$f000,$f8d7,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f8d0,$4b0a,$681b,
     $b29b,$2100,$4618,$f000,$f8c9,$4b08,$681b,$b29b,$2101,$4618,$f000,$f8ec,$bf00,$3710,$46bd,$bd80,
     $43a8,$2000,$43a0,$2000,$4394,$2000,$439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,$2302,$2201,
     $2103,$2000,$b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f8cd,$20c8,$f000,$f8e8,$4b0a,$681b,
     $b29b,$2100,$4618,$f000,$f8c3,$2002,$f000,$f8de,$4b05,$681b,$b29b,$2101,$4618,$f000,$f8b9,$20c8,
     $f000,$f8d4,$bf00,$bd80,$43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,
     $71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f8a0,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f899,$79fb,
     $4618,$f000,$f8c5,$4b06,$681b,$b29b,$2101,$4618,$f000,$f88e,$bf00,$3708,$46bd,$bd80,$43a0,$2000,
     $439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$2071,$f7ff,$ffce,$4b0d,$681b,
     $b29b,$4618,$f000,$f8be,$4603,$71fb,$79fb,$f003,$0301,$2b00,$bf0c,$2301,$2300,$b2db,$71fb,$79fb,
     $2b00,$d1e8,$20c8,$f000,$f881,$bf00,$3708,$46bd,$bd80,$bf00,$4394,$2000,$b580,$af00,$f7ff,$ff68,
     $2004,$f7ff,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2101,$4618,$f000,$f84a,$4b0b,$681b,
     $b29b,$2100,$4618,$f000,$f843,$79fb,$4618,$f000,$f86f,$4b06,$681b,$b29b,$2101,$4618,$f000,$f838,
     $bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,$af00,$2071,$f7ff,$ffae,$b580,$b082,
     $af00,$4603,$460a,$80fb,$4613,$80bb,$88fb,$4618,$f000,$f87e,$88bb,$2b00,$d002,$88bb,$2b00,$d105,
     $88fb,$2100,$4618,$f000,$f88f,$e005,$88fb,$2101,$4618,$f000,$f889,$bf00,$bf00,$3708,$46bd,$bd80,
     $b580,$b082,$af00,$6078,$6878,$f7ff,$ff51,$bf00,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,
     $88fa,$797b,$2b00,$bf14,$2301,$2300,$b2db,$4619,$4610,$f000,$f885,$bf00,$3708,$46bd,$bd80,$b580,
     $b082,$af00,$4603,$80fb,$88fb,$4618,$b580,$b082,$af00,$6078,$6878,$f000,$f88f,$bf00,$3708,$46bd,
     $bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,
     $010c,$2394,$2203,$2001,$f000,$f88c,$bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,$f04f,$4350,
     $685a,$2101,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,$f895,$4603,$4618,$3708,$46bd,$bd80,
     $b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,
     $2100,$6878,$f000,$f82c,$2105,$6878,$f000,$f896,$bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,
     $4809,$f002,$f99e,$693b,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,
     $ec42,$3044,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,
     $b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,
     $3714,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b082,$af00,$6078,
     $6878,$239a,$2200,$2100,$f000,$f80c,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,$71fb,$79fb,
     $60fb,$f107,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,$687a,$68b9,
     $68f8,$47a0,$4603,$4618,$371c,$46bd,$bd90,$bf00,$4400,$2000,$b580,$b082,$af00,$6078,$6878,$239a,
     $b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,$2b00,$bf14,$2301,$2300,
     $b2db,$4618,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b08a,
     $af00,$6078,$460b,$70fb,$6878,$f000,$f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,$23c0,$617b,
     $69fb,$681a,$69bb,$405a,$697b,$4013,$69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,$6013,$bf00,
     $bf00,$490d,$78fa,$687b,$00db,$440b,$605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,$623b,$6a7b,
     $f503,$5340,$461a,$6a3b,$6013,$bf00,$bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,$b580,$b082,
     $af00,$6078,$2100,$6878,$b480,$b083,$af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,
     $af00,$6078,$460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
