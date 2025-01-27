rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:  	EPD_2in9_V2.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.9inch e-paper V2
rem * | Info        :
rem *----------------
rem * |	This version:   V1.1
rem * | Date        :   2023-08-30
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

method EPD_2IN9_V2_INIT
  goto C_EPD_2IN9_V2_INIT
method EPD_2IN9_V2_GRAY4_INIT
  goto C_EPD_2IN9_V2_GRAY4_INIT
method EPD_2IN9_V2_CLEAR
  goto C_EPD_2IN9_V2_CLEAR
method EPD_2IN9_V2_DISPLAY
  goto C_EPD_2IN9_V2_DISPLAY
method EPD_2IN9_V2_DISPLAY_BASE
  goto C_EPD_2IN9_V2_DISPLAY_BASE
method EPD_2IN9_V2_4GRAYDISPLAY
  goto C_EPD_2IN9_V2_4GRAYDISPLAY
method EPD_2IN9_V2_DISPLAY_PARTIAL
  goto C_EPD_2IN9_V2_DISPLAY_PARTIAL
method EPD_2IN9_V2_SLEEP
  goto C_EPD_2IN9_V2_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+1244,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1336,C_RAM+16
  POKE32 DATAADDRESS(C_FUNCTIONS)+1480,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1484,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1488,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1492,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1496,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1500,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1744,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1840,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1924,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1928,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2012,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2016,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3364,C_RAM+16
  REM rodata vectors
  REM ram function vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+120,DATAADDRESS(C_FUNCTIONS)+1516
  POKE32 DATAADDRESS(C_FUNCTIONS)+248,DATAADDRESS(C_FUNCTIONS)+2388
  POKE32 DATAADDRESS(C_FUNCTIONS)+1248,DATAADDRESS(C_FUNCTIONS)+2592
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN9_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f881,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_GRAY4_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8b7,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8e9,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f90b,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_DISPLAY_BASE
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f923,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_4GRAYDISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f94f,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_DISPLAY_PARTIAL
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa29,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa97,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa9d,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$faa7,$b002,$bd00,$46c0

REM 3616 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fb42,$2064,$f000,$fb69,$f000,$fb79,$2012,$f000,$fb94,$f000,$fb74,$2001,$f000,
     $fb8f,$2027,$f000,$fbb8,$2001,$f000,$fbb5,$2000,$f000,$fbb2,$2011,$f000,$fb83,$2003,$f000,$fbac,
     $f240,$1327,$227f,$2100,$2000,$f000,$fbd1,$2021,$f000,$fb76,$2000,$f000,$fb9f,$2080,$f000,$fb9c,
     $2100,$2000,$f000,$fc0a,$f000,$fb4c,$4802,$f000,$fc2f,$bf00,$bd80,$bf00,$0600,$2000,$b580,$af00,
     $f7ff,$fe5e,$2064,$f7fc,$b580,$af00,$f000,$fafe,$2064,$f000,$fb25,$f000,$fb35,$2012,$f000,$fb50,
     $f000,$fb30,$2001,$f000,$fb4b,$2027,$f000,$fb74,$2001,$f000,$fb71,$2000,$f000,$fb6e,$2011,$f000,
     $fb3f,$2003,$f000,$fb68,$f240,$1327,$2280,$2100,$2008,$f000,$fb8d,$203c,$f000,$fb32,$2004,$f000,
     $fb5b,$2100,$2001,$f000,$fbc9,$f000,$fb0b,$4802,$f000,$fbee,$bf00,$bd80,$06a0,$2000,$b580,$b082,
     $af00,$2024,$f7ff,$fe46,$b580,$b082,$af00,$2024,$f000,$fb16,$2300,$80fb,$e005,$20ff,$f000,$fb3c,
     $88fb,$3301,$80fb,$88fb,$f5b3,$5f94,$d3f5,$2026,$f000,$fb06,$2300,$80fb,$e005,$20ff,$f000,$fb2c,
     $88fb,$3301,$80fb,$88fb,$f5b3,$5f94,$d3f5,$f000,$fc51,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,
     $6078,$2024,$f7ff,$fe1c,$b580,$b084,$af00,$6078,$2024,$f000,$fae5,$2300,$81fb,$e009,$89fb,$687a,
     $4413,$781b,$4618,$f000,$fb07,$89fb,$3301,$81fb,$89fb,$f5b3,$5f94,$d3f1,$f000,$fc2c,$bf00,$3710,
     $46bd,$bd80,$b580,$b084,$af00,$6078,$2024,$f7ff,$fdfe,$2300,$b580,$b084,$af00,$6078,$2024,$f000,
     $fabf,$2300,$81fb,$e009,$89fb,$687a,$4413,$781b,$4618,$f000,$fae1,$89fb,$3301,$81fb,$89fb,$f5b3,
     $5f94,$d3f1,$2026,$f000,$faab,$2300,$81fb,$e009,$89fb,$687a,$4413,$781b,$4618,$f000,$facd,$89fb,
     $3301,$81fb,$89fb,$f5b3,$5f94,$d3f1,$f000,$fbf2,$bf00,$3710,$46bd,$bd80,$b580,$b086,$af00,$6078,
     $2024,$f7ff,$fdcc,$2300,$b580,$b086,$af00,$6078,$2024,$f000,$fa85,$2300,$617b,$e060,$2300,$72bb,
     $2300,$613b,$e051,$697b,$005a,$693b,$4413,$687a,$4413,$781b,$72fb,$2300,$60fb,$e040,$7afb,$f023,
     $033f,$727b,$7a7b,$2bc0,$d00e,$7a7b,$2b00,$d104,$7abb,$f043,$0301,$72bb,$e006,$7a7b,$2b80,$d103,
     $7abb,$f043,$0301,$72bb,$7abb,$005b,$72bb,$7afb,$009b,$72fb,$7afb,$f023,$033f,$727b,$7a7b,$2bc0,
     $d00e,$7a7b,$2b00,$d104,$7abb,$f043,$0301,$72bb,$e006,$7a7b,$2b80,$d103,$7abb,$f043,$0301,$72bb,
     $693b,$2b01,$d102,$68fb,$2b01,$d002,$7abb,$005b,$72bb,$7afb,$009b,$72fb,$68fb,$3301,$60fb,$68fb,
     $2b01,$d9bb,$693b,$3301,$613b,$693b,$2b01,$d9aa,$7abb,$4618,$f000,$fa50,$697b,$3301,$617b,$697b,
     $f5b3,$5f94,$d39a,$2026,$f000,$fa1a,$2300,$617b,$e060,$2300,$72bb,$2300,$613b,$e051,$697b,$005a,
     $693b,$4413,$687a,$4413,$781b,$72fb,$2300,$60fb,$e040,$7afb,$f023,$033f,$727b,$7a7b,$2bc0,$d00e,
     $7a7b,$2b00,$d104,$7abb,$f043,$0301,$72bb,$e006,$7a7b,$2b80,$d003,$7abb,$f043,$0301,$72bb,$7abb,
     $005b,$72bb,$7afb,$009b,$72fb,$7afb,$f023,$033f,$727b,$7a7b,$2bc0,$d00e,$7a7b,$2b00,$d104,$7abb,
     $f043,$0301,$72bb,$e006,$7a7b,$2b80,$d003,$7abb,$f043,$0301,$72bb,$693b,$2b01,$d102,$68fb,$2b01,
     $d002,$7abb,$005b,$72bb,$7afb,$009b,$72fb,$68fb,$3301,$60fb,$68fb,$2b01,$d9bb,$693b,$3301,$613b,
     $693b,$2b01,$d9aa,$7abb,$4618,$f000,$f9e5,$697b,$3301,$617b,$697b,$f5b3,$5f94,$d39a,$f000,$fb0a,
     $bf00,$3718,$46bd,$bd80,$0000,$b580,$b084,$af00,$6078,$4b36,$681b,$b29b,$b580,$b084,$af00,$6078,
     $4b36,$681b,$b29b,$2100,$4618,$f000,$fb59,$2001,$f000,$f966,$4b31,$681b,$b29b,$2101,$4618,$f000,
     $fb4f,$2002,$f000,$f95c,$482d,$f000,$fb67,$2037,$f000,$f986,$2000,$f000,$f9af,$2000,$f000,$f9ac,
     $2000,$f000,$f9a9,$2000,$f000,$f9a6,$2000,$f000,$f9a3,$2040,$f000,$f9a0,$2000,$f000,$f99d,$2000,
     $f000,$f99a,$2000,$f000,$f997,$2000,$f000,$f994,$203c,$f000,$f965,$2080,$f000,$f98e,$2022,$f000,
     $f95f,$20c0,$f000,$f988,$2020,$f000,$f959,$f000,$f939,$f240,$1327,$227f,$2100,$2000,$f000,$f9a8,
     $2100,$2000,$f000,$f9ea,$2024,$f000,$f949,$2300,$81fb,$e009,$89fb,$687a,$4413,$781b,$4618,$f000,
     $f96b,$89fb,$3301,$81fb,$89fb,$f5b3,$5f94,$d3f1,$f000,$fb38,$bf00,$3710,$46bd,$bd80,$43a8,$2000,
     $0560,$2000,$b580,$af00,$2010,$f7ff,$fc77,$2001,$b580,$af00,$2010,$f000,$f923,$2001,$f000,$f94c,
     $2064,$f000,$f8ed,$bf00,$bd80,$0000,$b580,$af00,$4b0f,$681b,$b29b,$2101,$b480,$af00,$b403,$4906,
     $600d,$604e,$608f,$ea5f,$0008,$60c8,$bc03,$bf00,$46bd,$f85d,$7b04,$4770,$4400,$2000,$b590,$b087,
     $af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4a1c,$687b,$6013,$4a1b,$68fb,
     $6013,$4a1b,$683b,$6013,$4a1a,$68bb,$6013,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,
     $2101,$4618,$f000,$faf4,$4b10,$681b,$b29b,$2101,$4618,$f000,$faed,$4b0f,$681b,$b29b,$2101,$4618,
     $f000,$fae6,$4b0a,$681b,$b29b,$2100,$4618,$f000,$fadf,$4b08,$681b,$b29b,$2101,$4618,$f000,$fa80,
     $bf00,$3710,$46bd,$bd80,$43a8,$2000,$43a0,$2000,$4394,$2000,$439c,$2000,$4398,$2000,$43a4,$2000,
     $b580,$af00,$2302,$2201,$2103,$2000,$6680,$0000,$0000,$0000,$0040,$0000,$6610,$0000,$0000,$0000,
     $0020,$0000,$6680,$0000,$0000,$0000,$0040,$0000,$6610,$0000,$0000,$0000,$0020,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0814,$0000,$0000,$0a01,$000a,$0a0a,$0100,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0814,$0100,$0000,$0001,$0000,$0000,$0100,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$4444,$4444,
     $4444,$0000,$2200,$4117,$3200,$0036,$b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$f000,$fa11,$200a,
     $f000,$f81e,$4b0a,$681b,$b29b,$2100,$4618,$f000,$fa07,$2002,$f000,$f814,$4b05,$681b,$b29b,$2101,
     $4618,$f000,$f9fd,$200a,$f000,$f80a,$bf00,$bd80,$43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,
     $b580,$b082,$af00,$6078,$6878,$f000,$fa6b,$bf00,$3708,$46bd,$bd80,$0000,$b580,$b084,$af00,$60f8,
     $60b9,$607a,$b580,$af00,$4b09,$681b,$b29b,$4618,$f000,$fa6e,$4603,$2b00,$d003,$2032,$f7ff,$ffe0,
     $e7f2,$bf00,$2032,$f7ff,$ffdb,$bf00,$bd80,$bf00,$4394,$2000,$b580,$b084,$af00,$6078,$2032,$f7ff,
     $b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f9b4,$4b0b,$681b,$b29b,$2100,
     $4618,$f000,$f9ad,$79fb,$4618,$f000,$fa57,$4b06,$681b,$b29b,$2101,$4618,$f000,$f9a2,$bf00,$3708,
     $46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,
     $71fb,$4b0e,$681b,$b29b,$2101,$4618,$f000,$f988,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f981,$79fb,
     $4618,$f000,$fa2b,$4b06,$681b,$b29b,$2101,$4618,$f000,$f976,$bf00,$3708,$46bd,$bd80,$43a0,$2000,
     $439c,$2000,$b580,$af00,$4b09,$681b,$b29b,$4618,$b590,$b083,$af00,$4604,$4608,$4611,$461a,$4623,
     $80fb,$4603,$80bb,$460b,$807b,$4613,$803b,$2044,$f7ff,$ff96,$88fb,$08db,$b29b,$b2db,$4618,$f7ff,
     $ffbb,$887b,$08db,$b29b,$b2db,$4618,$f7ff,$ffb4,$2045,$f7ff,$ff85,$88bb,$b2db,$4618,$f7ff,$ffac,
     $88bb,$0a1b,$b29b,$b2db,$4618,$f7ff,$ffa5,$883b,$b2db,$4618,$f7ff,$ffa0,$883b,$0a1b,$b29b,$b2db,
     $4618,$f7ff,$ff99,$bf00,$370c,$46bd,$bd90,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$b580,$b082,
     $af00,$4603,$460a,$80fb,$4613,$80bb,$204e,$f7ff,$ff57,$88fb,$b2db,$4618,$f7ff,$ff7e,$204f,$f7ff,
     $ff4f,$88bb,$b2db,$4618,$f7ff,$ff76,$88bb,$0a1b,$b29b,$b2db,$4618,$f7ff,$ff6f,$bf00,$3708,$46bd,
     $bd80,$b580,$af00,$f7ff,$fe9c,$2064,$f7fc,$f95b,$b580,$b082,$af00,$6078,$6878,$f000,$f90f,$203f,
     $f7ff,$ff2e,$687b,$3399,$781b,$4618,$f7ff,$ff54,$2003,$f7ff,$ff25,$687b,$339a,$781b,$4618,$f7ff,
     $ff4b,$2004,$f7ff,$ff1c,$687b,$339b,$781b,$4618,$f7ff,$ff42,$687b,$339c,$781b,$4618,$f7ff,$ff3c,
     $687b,$339d,$781b,$4618,$f7ff,$ff36,$202c,$f7ff,$ff07,$687b,$339e,$781b,$4618,$f7ff,$ff2d,$bf00,
     $3708,$46bd,$bd80,$b580,$af00,$2022,$f7ff,$ff3f,$20c7,$f7ff,$6000,$0000,$0000,$0000,$0000,$0000,
     $6020,$0010,$0000,$0000,$0000,$0000,$6028,$0014,$0000,$0000,$0000,$0000,$602a,$0015,$0000,$0000,
     $0000,$0000,$9000,$0000,$0000,$0000,$0000,$0000,$0200,$0500,$0014,$1e00,$001e,$0000,$0100,$0200,
     $0500,$0014,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$2224,$2222,$3223,$0000,$2200,$4117,$32ae,$1028,$b580,$af00,$2022,$f7ff,$fea1,$20c7,
     $f7ff,$feca,$2020,$f7ff,$fe9b,$f7ff,$fe7b,$bf00,$bd80,$b580,$af00,$2022,$f7ff,$ff30,$200f,$f7ff,
     $4000,$0000,$0000,$0000,$0000,$0000,$8080,$0000,$0000,$0000,$0000,$0000,$4040,$0000,$0000,$0000,
     $0000,$0000,$8000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$000a,$0000,
     $0000,$0102,$0000,$0000,$0000,$0001,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$2222,$2222,$2222,$0000,$2200,$4117,$32b0,$0036,
     $b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,$88fa,$797b,$2b00,$bf14,$2301,$2300,$b2db,$4619,
     $4610,$f000,$f8b5,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$b580,$b084,
     $af00,$6078,$2032,$f7ff,$fe1b,$2300,$73fb,$e009,$7bfb,$687a,$4413,$781b,$4618,$f7ff,$fe3d,$7bfb,
     $3301,$73fb,$7bfb,$2b98,$d9f2,$f7ff,$fdeb,$bf00,$3710,$46bd,$bd80,$b580,$b082,$af00,$6078,$6878,
     $f7ff,$ffdc,$b580,$af00,$2022,$f7ff,$fdf9,$200f,$f7ff,$fe22,$2020,$f7ff,$fdf3,$f7ff,$fdd3,$bf00,
     $bd80,$b590,$b083,$af00,$4604,$4608,$4611,$461a,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,
     $88fb,$4618,$f000,$f880,$88bb,$2b00,$d002,$88bb,$2b00,$d105,$88fb,$2100,$4618,$f000,$f891,$e005,
     $88fb,$2101,$4618,$f000,$f88b,$bf00,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$6078,$6878,$f7ff,
     $ff51,$bf00,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f890,$bf00,$3708,$46bd,$bd80,
     $b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,
     $f899,$4603,$4618,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b084,
     $af00,$4603,$71fb,$79fb,$60fb,$f107,$010c,$2394,$2203,$2001,$f000,$f860,$bf00,$3710,$46bd,$bd80,
     $b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,
     $78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,
     $6078,$460b,$70fb,$687b,$b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,$2100,$6878,$f7ff,$ffd8,
     $2105,$6878,$f000,$f864,$bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,$4809,$f002,$f99e,$693b,
     $b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3044,$bf00,$bf00,
     $3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$b590,$b087,$af00,$60f8,
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
