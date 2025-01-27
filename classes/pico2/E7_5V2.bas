rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:	EPD_7in5.c
rem * | Author      :   Waveshare team
rem * | Function    :   Electronic paper driver
rem * | Info        :
rem *----------------
rem * |	This version:   V2.0
rem * | Date        :   2018-11-09
rem * | Info        :
rem *****************************************************************************
rem #
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

method EPD_7IN5_V2_INIT
  goto C_EPD_7IN5_V2_INIT
method EPD_7IN5_V2_CLEAR
  goto C_EPD_7IN5_V2_CLEAR
method EPD_7IN5_V2_CLEARBLACK
  goto C_EPD_7IN5_V2_CLEARBLACK
method EPD_7IN5_V2_DISPLAY
  goto C_EPD_7IN5_V2_DISPLAY
method EPD_7IN5_V2_SLEEP
  goto C_EPD_7IN5_V2_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+692,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+836,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+840,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+844,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+848,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+852,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+856,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+940,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1024,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1028,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1112,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1116,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1212,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1764,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_7IN5_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f857,$b002,$bd00,$46c0
LABEL C_EPD_7IN5_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8a7,$b002,$bd00,$46c0
LABEL C_EPD_7IN5_V2_CLEARBLACK
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8d5,$b002,$bd00,$46c0
LABEL C_EPD_7IN5_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f903,$b002,$bd00,$46c0
LABEL C_EPD_7IN5_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f953,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f95b,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f965,$b002,$bd00,$46c0

REM 2016 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f9b0,$2001,$f000,$f9d7,$2007,$f000,$fa00,$2007,$f000,$f9fd,$203f,$f000,$f9fa,
     $203f,$f000,$f9f7,$2004,$f000,$f9c8,$2064,$f000,$fa1d,$f000,$fa2d,$2000,$f000,$f9c0,$201f,$f000,
     $f9e9,$2061,$f000,$f9ba,$2003,$f000,$f9e3,$2020,$f000,$f9e0,$2001,$f000,$f9dd,$20e0,$f000,$f9da,
     $2015,$f000,$f9ab,$2000,$f000,$f9d4,$2050,$f000,$f9a5,$2010,$f000,$f9ce,$2000,$f000,$f9cb,$2060,
     $f000,$f99c,$2022,$f000,$f9c5,$2065,$f000,$f996,$2000,$f000,$f9bf,$2000,$f000,$f9bc,$2000,$f000,
     $f9b9,$2000,$f000,$f9b6,$2300,$4618,$bd80,$b580,$b082,$af00,$2364,$80bb,$f44f,$73f0,$b580,$b082,
     $af00,$2364,$80bb,$f44f,$73f0,$807b,$2010,$f000,$f975,$2300,$80fb,$e005,$20ff,$f000,$f99b,$88fb,
     $3301,$80fb,$88fa,$887b,$88b9,$fb01,$f303,$429a,$dbf2,$2013,$f000,$f962,$2300,$80fb,$e005,$2000,
     $f000,$f988,$88fb,$3301,$80fb,$88fa,$887b,$88b9,$fb01,$f303,$429a,$dbf2,$f000,$f9d8,$bf00,$3708,
     $46bd,$bd80,$b580,$b082,$af00,$2364,$80bb,$f44f,$73f0,$807b,$b580,$b082,$af00,$2364,$80bb,$f44f,
     $73f0,$807b,$2010,$f000,$f939,$2300,$80fb,$e005,$2000,$f000,$f95f,$88fb,$3301,$80fb,$88fa,$887b,
     $88b9,$fb01,$f303,$429a,$dbf2,$2013,$f000,$f926,$2300,$80fb,$e005,$20ff,$f000,$f94c,$88fb,$3301,
     $80fb,$88fa,$887b,$88b9,$fb01,$f303,$429a,$dbf2,$f000,$f99c,$bf00,$3708,$46bd,$bd80,$b580,$b088,
     $af00,$6078,$2364,$60fb,$f44f,$73f0,$b580,$b088,$af00,$6078,$2364,$60fb,$f44f,$73f0,$60bb,$2010,
     $f000,$f8fc,$2300,$61fb,$e018,$2300,$61bb,$e00e,$69fb,$68fa,$fb03,$f202,$69bb,$4413,$687a,$4413,
     $781b,$4618,$f000,$f916,$69bb,$3301,$61bb,$69ba,$68fb,$429a,$d3ec,$69fb,$3301,$61fb,$69fa,$68bb,
     $429a,$d3e2,$2013,$f000,$f8d9,$2300,$617b,$e01a,$2300,$613b,$e010,$697b,$68fa,$fb03,$f202,$693b,
     $4413,$687a,$4413,$781b,$43db,$b2db,$4618,$f000,$f8f1,$693b,$3301,$613b,$693a,$68fb,$429a,$d3ea,
     $697b,$3301,$617b,$697a,$68bb,$429a,$d3e0,$f000,$f93d,$bf00,$3720,$46bd,$bd80,$b580,$af00,$2002,
     $f7ff,$fe75,$f7ff,$febf,$b580,$af00,$2002,$f000,$f8a5,$f000,$f90d,$2007,$f000,$f8a0,$20a5,$f000,
     $f8c9,$bf00,$bd80,$0000,$b580,$af00,$4b0f,$681b,$b29b,$2101,$b480,$af00,$b403,$4906,$600d,$604e,
     $608f,$ea5f,$0008,$60c8,$bc03,$bf00,$46bd,$f85d,$7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,
     $683b,$6013,$4a1a,$68bb,$6013,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,
     $f000,$f8f8,$4b10,$681b,$b29b,$2101,$4618,$f000,$f8f1,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f8ea,
     $4b0a,$681b,$b29b,$2100,$4618,$f000,$f8e3,$4b08,$681b,$b29b,$2101,$4618,$f000,$f906,$bf00,$3710,
     $46bd,$bd80,$43a8,$2000,$43a0,$2000,$4394,$2000,$439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,
     $2302,$2201,$2103,$2000,$b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f8e7,$20c8,$f000,$f876,
     $4b0a,$681b,$b29b,$2100,$4618,$f000,$f8dd,$2002,$f000,$f86c,$4b05,$681b,$b29b,$2101,$4618,$f000,
     $f8d3,$20c8,$f000,$f862,$bf00,$bd80,$43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,
     $af00,$4603,$71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f8ba,$4b0b,$681b,$b29b,$2100,$4618,$f000,
     $f8b3,$79fb,$4618,$f000,$f8cd,$4b06,$681b,$b29b,$2101,$4618,$f000,$f8a8,$bf00,$3708,$46bd,$bd80,
     $43a0,$2000,$439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,
     $681b,$b29b,$2101,$4618,$f000,$f88e,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f887,$79fb,$4618,$f000,
     $f8a1,$4b06,$681b,$b29b,$2101,$4618,$f000,$f87c,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,
     $b580,$af00,$2071,$f7ff,$ffaf,$2014,$b580,$b082,$af00,$6078,$6878,$f000,$f89f,$bf00,$3708,$46bd,
     $bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$b580,$af00,$2071,$f7ff,$ff91,$2014,$f7ff,$ffe6,
     $4b06,$681b,$b29b,$4618,$f000,$f89c,$4603,$2b00,$d0f0,$2014,$f7ff,$ffda,$bf00,$bd80,$4394,$2000,
     $b580,$af00,$2012,$f7ff,$ff97,$2064,$b580,$af00,$2012,$f7ff,$ff73,$2064,$f7ff,$ffc8,$f7ff,$ffd8,
     $bf00,$bd80,$b580,$af00,$f7ff,$ff68,$2001,$f7ff,$ff89,$2007,$b580,$b082,$af00,$4603,$460a,$80fb,
     $4613,$80bb,$88fb,$4618,$f000,$f882,$88bb,$2b00,$d002,$88bb,$2b00,$d105,$88fb,$2100,$4618,$f000,
     $f893,$e005,$88fb,$2101,$4618,$f000,$f88d,$bf00,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$6078,
     $6878,$f7ff,$ff51,$bf00,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,$88fa,$797b,$2b00,$bf14,
     $2301,$2300,$b2db,$4619,$4610,$f000,$f889,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$80fb,
     $88fb,$4618,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$010c,$2394,$2203,$2001,$f000,$f88c,
     $bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$b580,$b082,$af00,$6078,
     $6878,$239a,$2200,$2100,$f000,$f876,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,$71fb,$79fb,
     $60fb,$f107,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,$f87f,$4603,$4618,$3708,$46bd,$bd80,
     $b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,
     $2100,$6878,$f000,$f82c,$2105,$6878,$f000,$f880,$bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,
     $4809,$f002,$f99e,$693b,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,
     $ec42,$3044,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,
     $b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,
     $3714,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,$687a,$68b9,$68f8,$47a0,$4603,$4618,$371c,$46bd,
     $bd90,$bf00,$4400,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b480,$b083,$af00,$6078,$f04f,$4350,
     $685a,$2101,$687b,$fa01,$f303,$4013,$2b00,$bf14,$2301,$2300,$b2db,$4618,$370c,$46bd,$f85d,$7b04,
     $4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b08a,$af00,$6078,$460b,$70fb,$6878,$f000,
     $f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$405a,$697b,$4013,
     $69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,$6013,$bf00,$bf00,$490d,$78fa,$687b,$00db,$440b,
     $605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,$623b,$6a7b,$f503,$5340,$461a,$6a3b,$6013,$bf00,
     $bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,$b580,$b082,$af00,$6078,$2100,$6878,$b480,$b083,
     $af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
