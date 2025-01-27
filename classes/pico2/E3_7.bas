rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_3IN7.C
rem * | Author      :   Waveshare team
rem * | Function    :   3.7inch e-paper
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2020-07-16
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

method EPD_3IN7_4GRAY_CLEAR
  goto C_EPD_3IN7_4GRAY_CLEAR
method EPD_3IN7_4GRAY_INIT
  goto C_EPD_3IN7_4GRAY_INIT
method EPD_3IN7_4GRAY_DISPLAY
  goto C_EPD_3IN7_4GRAY_DISPLAY
method EPD_3IN7_1GRAY_CLEAR
  goto C_EPD_3IN7_1GRAY_CLEAR
method EPD_3IN7_1GRAY_INIT
  goto C_EPD_3IN7_1GRAY_INIT
method EPD_3IN7_1GRAY_DISPLAY
  goto C_EPD_3IN7_1GRAY_DISPLAY
method EPD_3IN7_1GRAY_DISPLAY_PART
  goto C_EPD_3IN7_1GRAY_DISPLAY_PART
method EPD_3IN7_SLEEP
  goto C_EPD_3IN7_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+2224,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2368,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2372,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2376,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2380,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2384,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+2388,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+2472,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2476,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2560,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2564,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2776,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2860,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+3408,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_3IN7_4GRAY_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f881,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_4GRAY_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8f3,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_4GRAY_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f997,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$faa9,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fad7,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fb7b,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_DISPLAY_PART
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fbad,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fc55,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fc59,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fc63,$b002,$bd00,$46c0

REM 3660 bytes
LABEL C_FUNCTIONS
EXEC $b580,$b084,$af00,$2323,$80fb,$f44f,$73f0,$80bb,$2049,$f000,$fca7,$2000,$f000,$fcd0,$204e,$f000,
     $fca1,$2000,$f000,$fcca,$2000,$f000,$fcc7,$204f,$f000,$fc98,$2000,$f000,$fcc1,$2000,$f000,$fcbe,
     $2024,$f000,$fc8f,$2300,$81fb,$e00f,$2300,$81bb,$e005,$20ff,$f000,$fcb2,$89bb,$3301,$81bb,$89ba,
     $88fb,$429a,$d3f5,$89fb,$3301,$81fb,$89fa,$88bb,$429a,$d3eb,$204e,$f000,$fc75,$2000,$f000,$fc9e,
     $2000,$f000,$fc9b,$204f,$f000,$fc6c,$2000,$f000,$fc95,$2000,$f000,$fc92,$2026,$f000,$fc63,$2300,
     $817b,$e00f,$2300,$813b,$e005,$20ff,$f000,$fc86,$893b,$3301,$813b,$893a,$88fb,$429a,$d3f5,$897b,
     $3301,$817b,$897a,$88bb,$429a,$d3eb,$2000,$f000,$fca1,$2022,$f000,$fc46,$20c7,$f000,$fc6f,$2020,
     $f000,$fc40,$f000,$fce2,$bf00,$3710,$46bd,$bd80,$b580,$b082,$af00,$f244,$13a0,$80bb,$204e,$f7ff,
     $b580,$af00,$f000,$fcf0,$2012,$f000,$fc2b,$f44f,$7096,$f000,$fd13,$2046,$f000,$fc24,$20f7,$f000,
     $fc4d,$f000,$fcc3,$2047,$f000,$fc1c,$20f7,$f000,$fc45,$f000,$fcbb,$2001,$f000,$fc14,$20df,$f000,
     $fc3d,$2001,$f000,$fc3a,$2000,$f000,$fc37,$2003,$f000,$fc08,$2000,$f000,$fc31,$2004,$f000,$fc02,
     $2041,$f000,$fc2b,$20a8,$f000,$fc28,$2032,$f000,$fc25,$2011,$f000,$fbf6,$2003,$f000,$fc1f,$203c,
     $f000,$fbf0,$2003,$f000,$fc19,$200c,$f000,$fbea,$20ae,$f000,$fc13,$20c7,$f000,$fc10,$20c3,$f000,
     $fc0d,$20c0,$f000,$fc0a,$20c0,$f000,$fc07,$2018,$f000,$fbd8,$2080,$f000,$fc01,$202c,$f000,$fbd2,
     $2044,$f000,$fbfb,$2037,$f000,$fbcc,$2000,$f000,$fbf5,$2000,$f000,$fbf2,$2000,$f000,$fbef,$2000,
     $f000,$fbec,$2000,$f000,$fbe9,$2000,$f000,$fbe6,$2000,$f000,$fbe3,$2000,$f000,$fbe0,$2000,$f000,
     $fbdd,$2000,$f000,$fbda,$2044,$f000,$fbab,$2000,$f000,$fbd4,$2000,$f000,$fbd1,$2017,$f000,$fbce,
     $2001,$f000,$fbcb,$2045,$f000,$fb9c,$2000,$f000,$fbc5,$2000,$f000,$fbc2,$20df,$f000,$fbbf,$2001,
     $f000,$fbbc,$2022,$f000,$fb8d,$20cf,$f000,$fbb6,$bf00,$bd80,$b580,$af00,$f7ff,$fe84,$2012,$f7ff,
     $fea5,$f44f,$b580,$b086,$af00,$6078,$2049,$f000,$fb79,$2000,$f000,$fba2,$204e,$f000,$fb73,$2000,
     $f000,$fb9c,$2000,$f000,$fb99,$204f,$f000,$fb6a,$2000,$f000,$fb93,$2000,$f000,$fb90,$2024,$f000,
     $fb61,$2300,$617b,$e060,$2300,$72bb,$2300,$613b,$e051,$697b,$005a,$693b,$4413,$687a,$4413,$781b,
     $72fb,$2300,$60fb,$e040,$7afb,$f023,$033f,$727b,$7a7b,$2bc0,$d104,$7abb,$f043,$0301,$72bb,$e009,
     $7a7b,$2b00,$d006,$7a7b,$2b80,$d003,$7abb,$f043,$0301,$72bb,$7abb,$005b,$72bb,$7afb,$009b,$72fb,
     $7afb,$f023,$033f,$727b,$7a7b,$2bc0,$d104,$7abb,$f043,$0301,$72bb,$e009,$7a7b,$2b00,$d006,$7a7b,
     $2b80,$d003,$7abb,$f043,$0301,$72bb,$693b,$2b01,$d102,$68fb,$2b01,$d002,$7abb,$005b,$72bb,$7afb,
     $009b,$72fb,$68fb,$3301,$60fb,$68fb,$2b01,$d9bb,$693b,$3301,$613b,$693b,$2b01,$d9aa,$7abb,$4618,
     $f000,$fb2c,$697b,$3301,$617b,$697b,$f244,$129f,$4293,$d999,$204e,$f000,$faf5,$2000,$f000,$fb1e,
     $2000,$f000,$fb1b,$204f,$f000,$faec,$2000,$f000,$fb15,$2000,$f000,$fb12,$2026,$f000,$fae3,$2300,
     $617b,$e060,$2300,$72bb,$2300,$613b,$e051,$697b,$005a,$693b,$4413,$687a,$4413,$781b,$72fb,$2300,
     $60fb,$e040,$7afb,$f023,$033f,$727b,$7a7b,$2bc0,$d104,$7abb,$f043,$0301,$72bb,$e009,$7a7b,$2b00,
     $d006,$7a7b,$2b80,$d103,$7abb,$f043,$0301,$72bb,$7abb,$005b,$72bb,$7afb,$009b,$72fb,$7afb,$f023,
     $033f,$727b,$7a7b,$2bc0,$d104,$7abb,$f043,$0301,$72bb,$e009,$7a7b,$2b00,$d006,$7a7b,$2b80,$d103,
     $7abb,$f043,$0301,$72bb,$693b,$2b01,$d102,$68fb,$2b01,$d002,$7abb,$005b,$72bb,$7afb,$009b,$72fb,
     $68fb,$3301,$60fb,$68fb,$2b01,$d9bb,$693b,$3301,$613b,$693b,$2b01,$d9aa,$7abb,$4618,$f000,$faae,
     $697b,$3301,$617b,$697b,$f244,$129f,$4293,$d999,$2000,$f000,$facf,$2022,$f000,$fa74,$20c7,$f000,
     $fa9d,$2020,$f000,$fa6e,$f000,$fb10,$bf00,$3718,$46bd,$bd80,$b580,$b084,$af00,$6078,$f244,$13a0,
     $81bb,$204e,$b580,$b082,$af00,$f244,$13a0,$80bb,$204e,$f000,$fa57,$2000,$f000,$fa80,$2000,$f000,
     $fa7d,$204f,$f000,$fa4e,$2000,$f000,$fa77,$2000,$f000,$fa74,$2024,$f000,$fa45,$2300,$80fb,$e005,
     $20ff,$f000,$fa6b,$88fb,$3301,$80fb,$88fa,$88bb,$429a,$d3f5,$2002,$f000,$fa8d,$2020,$f000,$fa32,
     $f000,$fad4,$bf00,$3708,$46bd,$bd80,$b580,$b086,$af00,$6078,$2049,$f7ff,$fd4f,$2000,$b580,$af00,
     $f000,$fae2,$2012,$f000,$fa1d,$f44f,$7096,$f000,$fb05,$2046,$f000,$fa16,$20f7,$f000,$fa3f,$f000,
     $fab5,$2047,$f000,$fa0e,$20f7,$f000,$fa37,$f000,$faad,$2001,$f000,$fa06,$20df,$f000,$fa2f,$2001,
     $f000,$fa2c,$2000,$f000,$fa29,$2003,$f000,$f9fa,$2000,$f000,$fa23,$2004,$f000,$f9f4,$2041,$f000,
     $fa1d,$20a8,$f000,$fa1a,$2032,$f000,$fa17,$2011,$f000,$f9e8,$2003,$f000,$fa11,$203c,$f000,$f9e2,
     $2003,$f000,$fa0b,$200c,$f000,$f9dc,$20ae,$f000,$fa05,$20c7,$f000,$fa02,$20c3,$f000,$f9ff,$20c0,
     $f000,$f9fc,$20c0,$f000,$f9f9,$2018,$f000,$f9ca,$2080,$f000,$f9f3,$202c,$f000,$f9c4,$2044,$f000,
     $f9ed,$2037,$f000,$f9be,$2000,$f000,$f9e7,$20ff,$f000,$f9e4,$20ff,$f000,$f9e1,$20ff,$f000,$f9de,
     $20ff,$f000,$f9db,$204f,$f000,$f9d8,$20ff,$f000,$f9d5,$20ff,$f000,$f9d2,$20ff,$f000,$f9cf,$20ff,
     $f000,$f9cc,$2044,$f000,$f99d,$2000,$f000,$f9c6,$2000,$f000,$f9c3,$2017,$f000,$f9c0,$2001,$f000,
     $f9bd,$2045,$f000,$f98e,$2000,$f000,$f9b7,$2000,$f000,$f9b4,$20df,$f000,$f9b1,$2001,$f000,$f9ae,
     $2022,$f000,$f97f,$20cf,$f000,$f9a8,$bf00,$bd80,$b580,$b084,$af00,$2323,$80fb,$f44f,$73f0,$80bb,
     $b580,$b084,$af00,$6078,$f244,$13a0,$81bb,$204e,$f000,$f968,$2000,$f000,$f991,$2000,$f000,$f98e,
     $204f,$f000,$f95f,$2000,$f000,$f988,$2000,$f000,$f985,$2024,$f000,$f956,$2300,$81fb,$e009,$89fb,
     $687a,$4413,$781b,$4618,$f000,$f978,$89fb,$3301,$81fb,$89fa,$89bb,$429a,$d3f1,$2002,$f000,$f99a,
     $2020,$f000,$f93f,$f000,$f9e1,$bf00,$3710,$46bd,$bd80,$b580,$b086,$af00,$60f8,$4608,$4611,$461a,
     $b580,$b086,$af00,$60f8,$4608,$4611,$461a,$4603,$817b,$460b,$813b,$4613,$80fb,$88fa,$897b,$1ad3,
     $f003,$0307,$2b00,$d108,$88fa,$897b,$1ad3,$2b00,$da00,$3307,$10db,$b29b,$e009,$88fa,$897b,$1ad3,
     $2b00,$da00,$3307,$10db,$b29b,$3301,$b29b,$82bb,$8c3a,$893b,$1ad3,$b29b,$8aba,$fb12,$f303,$827b,
     $88fb,$3b01,$80fb,$8c3b,$3b01,$843b,$2044,$f000,$f8f9,$897b,$b2db,$4618,$f000,$f920,$897b,$0a1b,
     $b29b,$b2db,$f003,$0303,$b2db,$4618,$f000,$f916,$88fb,$b2db,$4618,$f000,$f911,$88fb,$0a1b,$b29b,
     $b2db,$f003,$0303,$b2db,$4618,$f000,$f907,$2045,$f000,$f8d8,$893b,$b2db,$4618,$f000,$f8ff,$893b,
     $0a1b,$b29b,$b2db,$f003,$0303,$b2db,$4618,$f000,$f8f5,$8c3b,$b2db,$4618,$f000,$f8f0,$8c3b,$0a1b,
     $b29b,$b2db,$f003,$0303,$b2db,$4618,$f000,$f8e6,$204e,$f000,$f8b7,$897b,$b2db,$4618,$f000,$f8de,
     $204f,$f000,$f8af,$893b,$b2db,$4618,$f000,$f8d6,$893b,$0a1b,$b29b,$b2db,$4618,$f000,$f8cf,$2024,
     $f000,$f8a0,$2300,$82fb,$e009,$8afb,$68fa,$4413,$781b,$4618,$f000,$f8c2,$8afb,$3301,$82fb,$8afa,
     $8a7b,$429a,$d3f1,$2003,$f000,$f8e4,$2020,$f000,$f889,$f000,$f92b,$bf00,$3718,$46bd,$bd80,$b580,
     $af00,$2010,$f7ff,$fb51,$2003,$f7ff,$b580,$af00,$2010,$f000,$f877,$2003,$f000,$f8a0,$bf00,$bd80,
     $b580,$af00,$4b1e,$681b,$b29b,$2100,$4618,$f7fa,$b480,$af00,$b403,$4906,$600d,$604e,$608f,$ea5f,
     $0008,$60c8,$bc03,$bf00,$46bd,$f85d,$7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,
     $b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,$683b,$6013,
     $4a1a,$68bb,$6013,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,$f000,$f930,
     $4b10,$681b,$b29b,$2101,$4618,$f000,$f929,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f922,$4b0a,$681b,
     $b29b,$2100,$4618,$f000,$f91b,$4b08,$681b,$b29b,$2101,$4618,$f000,$f93e,$bf00,$3710,$46bd,$bd80,
     $43a8,$2000,$43a0,$2000,$4394,$2000,$439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,$2302,$2201,
     $2103,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f91c,$4b0b,$681b,
     $b29b,$2100,$4618,$f000,$f915,$79fb,$4618,$f000,$f92f,$4b06,$681b,$b29b,$2101,$4618,$f000,$f90a,
     $bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,
     $af00,$4603,$71fb,$4b0e,$681b,$b29b,$2101,$4618,$f000,$f8f0,$4b0b,$681b,$b29b,$2100,$4618,$f000,
     $f8e9,$79fb,$4618,$f000,$f903,$4b06,$681b,$b29b,$2101,$4618,$f000,$f8de,$bf00,$3708,$46bd,$bd80,
     $43a0,$2000,$439c,$2000,$b580,$b082,$af00,$4b09,$681b,$b29b,$b580,$b084,$af00,$4603,$71fb,$2032,
     $f7ff,$ffa0,$2300,$81fb,$e029,$79fb,$2b00,$d106,$89fb,$4a17,$5cd3,$4618,$f7ff,$ffc0,$e01c,$79fb,
     $2b01,$d106,$89fb,$4a13,$5cd3,$4618,$f7ff,$ffb6,$e012,$79fb,$2b02,$d106,$89fb,$4a0f,$5cd3,$4618,
     $f7ff,$ffac,$e008,$79fb,$2b03,$d105,$89fb,$4a0b,$5cd3,$4618,$f7ff,$ffa2,$89fb,$3301,$81fb,$89fb,
     $2b68,$d9d2,$bf00,$bf00,$3710,$46bd,$bd80,$bf00,$b7e4,$1000,$b850,$1000,$b8bc,$1000,$b928,$1000,
     $b580,$af00,$f7ff,$ff2e,$2012,$f7ff,$b580,$b082,$af00,$4b09,$681b,$b29b,$4618,$f000,$f8b3,$4603,
     $71fb,$79fb,$2b00,$d1f4,$20c8,$f000,$f837,$bf00,$3708,$46bd,$bd80,$bf00,$4394,$2000,$b580,$b084,
     $af00,$4603,$71fb,$2032,$b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f85d,$201e,$f000,$f81e,
     $4b0a,$681b,$b29b,$2100,$4618,$f000,$f853,$2003,$f000,$f814,$4b05,$681b,$b29b,$2101,$4618,$f000,
     $f849,$201e,$f000,$f80a,$bf00,$bd80,$43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,
     $af00,$6078,$6878,$f000,$f883,$bf00,$3708,$46bd,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,
     $b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$88fb,$4618,$f000,$f882,$88bb,$2b00,$d002,$88bb,
     $2b00,$d105,$88fb,$2100,$4618,$f000,$f893,$e005,$88fb,$2101,$4618,$f000,$f88d,$bf00,$bf00,$3708,
     $46bd,$bd80,$b580,$b082,$af00,$6078,$6878,$f7ff,$ff51,$bf00,$b580,$b082,$af00,$4603,$460a,$80fb,
     $4613,$717b,$88fa,$797b,$2b00,$bf14,$2301,$2300,$b2db,$4619,$4610,$f000,$f889,$bf00,$3708,$46bd,
     $bd80,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,
     $010c,$2394,$2203,$2001,$f000,$f88c,$bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,$f04f,$4350,
     $685a,$2101,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,$f895,$4603,$4618,$3708,$46bd,$bd80,
     $b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,
     $f000,$f860,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$b580,$b082,
     $af00,$6078,$2100,$6878,$f000,$f814,$2100,$6878,$f000,$f82c,$2105,$6878,$f000,$f880,$bf00,$3708,
     $46bd,$bd80,$b40f,$b580,$b082,$af00,$4809,$f002,$f99e,$693b,$b480,$b085,$af00,$6078,$460b,$70fb,
     $687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3044,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b580,
     $b082,$af00,$4603,$460a,$80fb,$4613,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,
     $68fb,$7afa,$ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,
     $70fb,$687b,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,$687a,$68b9,
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
