rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_2in7_V2.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.7inch V2 e-paper
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2022-08-18
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

method EPD_2IN7_V2_INIT
  goto C_EPD_2IN7_V2_INIT
method EPD_2IN7_V2_INIT_FAST
  goto C_EPD_2IN7_V2_INIT_FAST
method EPD_2IN7_V2_INIT_4GRAY
  goto C_EPD_2IN7_V2_INIT_4GRAY
method EPD_2IN7_V2_CLEAR
  goto C_EPD_2IN7_V2_CLEAR
method EPD_2IN7_V2_DISPLAY
  goto C_EPD_2IN7_V2_DISPLAY
method EPD_2IN7_V2_DISPLAY_FAST
  goto C_EPD_2IN7_V2_DISPLAY_FAST
method EPD_2IN7_V2_DISPLAY_BASE
  goto C_EPD_2IN7_V2_DISPLAY_BASE
method EPD_2IN7_V2_DISPLAY_BASE_COLOR
  goto C_EPD_2IN7_V2_DISPLAY_BASE_COLOR
method EPD_2IN7_V2_DISPLAY_PARTIAL
  goto C_EPD_2IN7_V2_DISPLAY_PARTIAL
method EPD_2IN7_V2_4GRAYDISPLAY
  goto C_EPD_2IN7_V2_4GRAYDISPLAY
method EPD_2IN7_V2_SLEEP
  goto C_EPD_2IN7_V2_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+2188,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2332,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2336,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2340,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2344,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2348,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+2352,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+2436,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2488,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2572,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2576,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2660,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2664,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3680,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+556,DATAADDRESS(C_FUNCTIONS)+2680
  POKE32 DATAADDRESS(C_FUNCTIONS)+2896,DATAADDRESS(C_FUNCTIONS)+2680
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN7_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8ab,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_INIT_FAST
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8cf,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_INIT_4GRAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f919,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f99f,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9c1,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY_FAST
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9ed,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY_BASE
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa19,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY_BASE_COLOR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa69,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY_PARTIAL
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$faa7,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_4GRAYDISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fb67,$b002,$bd00,$46c0
LABEL C_EPD_2IN7_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fc43,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fc47,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fc51,$b002,$bd00,$46c0

REM 3872 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fc9c,$f000,$fcc4,$2012,$f000,$fcdb,$f000,$fcbf,$2045,$f000,$fcd6,$2000,$f000,
     $fcff,$2000,$f000,$fcfc,$2007,$f000,$fcf9,$2001,$f000,$fcf6,$204f,$f000,$fcc7,$2000,$f000,$fcf0,
     $2000,$f000,$fced,$2011,$f000,$fcbe,$2003,$f000,$fce7,$bf00,$bd80,$b580,$af00,$f7ff,$fef3,$f7ff,
     $ff61,$2012,$b580,$af00,$f000,$fc6a,$f000,$fc92,$2012,$f000,$fca9,$f000,$fc8d,$2018,$f000,$fca4,
     $2080,$f000,$fccd,$2022,$f000,$fc9e,$20b1,$f000,$fcc7,$2020,$f000,$fc98,$f000,$fc7c,$201a,$f000,
     $fc93,$2064,$f000,$fcbc,$2000,$f000,$fcb9,$2045,$f000,$fc8a,$2000,$f000,$fcb3,$2000,$f000,$fcb0,
     $2007,$f000,$fcad,$2001,$f000,$fcaa,$204f,$f000,$fc7b,$2000,$f000,$fca4,$2000,$f000,$fca1,$2011,
     $f000,$fc72,$2003,$f000,$fc9b,$2022,$f000,$fc6c,$2091,$f000,$fc95,$2020,$f000,$fc66,$f000,$fc4a,
     $bf00,$bd80,$0000,$b580,$af00,$f7ff,$fea2,$f7ff,$ff10,$2012,$b580,$af00,$f000,$fc12,$f000,$fc3a,
     $2012,$f000,$fc51,$f000,$fc35,$2074,$f000,$fc4c,$2054,$f000,$fc75,$207e,$f000,$fc46,$203b,$f000,
     $fc6f,$2001,$f000,$fc40,$2007,$f000,$fc69,$2001,$f000,$fc66,$2000,$f000,$fc63,$2011,$f000,$fc34,
     $2003,$f000,$fc5d,$2044,$f000,$fc2e,$2000,$f000,$fc57,$2015,$f000,$fc54,$2045,$f000,$fc25,$2000,
     $f000,$fc4e,$2000,$f000,$fc4b,$2007,$f000,$fc48,$2001,$f000,$fc45,$203c,$f000,$fc16,$2000,$f000,
     $fc3f,$202c,$f000,$fc10,$4b20,$f893,$309e,$4618,$f000,$fc36,$203f,$f000,$fc07,$4b1c,$f893,$3099,
     $4618,$f000,$fc2d,$2003,$f000,$fbfe,$4b17,$f893,$309a,$4618,$f000,$fc24,$2004,$f000,$fbf5,$4b13,
     $f893,$309b,$4618,$f000,$fc1b,$4b10,$f893,$309c,$4618,$f000,$fc15,$4b0d,$f893,$309d,$4618,$f000,
     $fc0f,$f000,$fc89,$204e,$f000,$fbde,$2000,$f000,$fc07,$204f,$f000,$fbd8,$2000,$f000,$fc01,$2000,
     $f000,$fbfe,$f000,$fbb6,$bf00,$bd80,$04c0,$2000,$b580,$b082,$af00,$2316,$807b,$f44f,$b580,$b082,
     $af00,$2316,$807b,$f44f,$7384,$803b,$2024,$f000,$fbbb,$2300,$80fb,$e00f,$2300,$80bb,$e005,$20ff,
     $f000,$fbde,$88bb,$3301,$80bb,$88ba,$887b,$429a,$d3f5,$88fb,$3301,$80fb,$88fa,$883b,$429a,$d3eb,
     $f000,$fc6e,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$6078,$2316,$817b,$f44f,$7384,$b580,$b084,
     $af00,$6078,$2316,$817b,$f44f,$7384,$813b,$2024,$f000,$fb8a,$2300,$81fb,$e019,$2300,$81bb,$e00f,
     $89ba,$89fb,$8979,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$fba3,$89bb,$3301,$81bb,
     $89ba,$897b,$429a,$d3eb,$89fb,$3301,$81fb,$89fa,$893b,$429a,$d3e1,$f000,$fc33,$bf00,$3710,$46bd,
     $bd80,$b580,$b084,$af00,$6078,$2316,$817b,$f44f,$b580,$b084,$af00,$6078,$2316,$817b,$f44f,$7384,
     $813b,$2024,$f000,$fb50,$2300,$81fb,$e019,$2300,$81bb,$e00f,$89ba,$89fb,$8979,$fb01,$f303,$4413,
     $461a,$687b,$4413,$781b,$4618,$f000,$fb69,$89bb,$3301,$81bb,$89ba,$897b,$429a,$d3eb,$89fb,$3301,
     $81fb,$89fa,$893b,$429a,$d3e1,$f000,$fc0f,$bf00,$3710,$46bd,$bd80,$b580,$b086,$af00,$6078,$2316,
     $81fb,$f44f,$b580,$b086,$af00,$6078,$2316,$81fb,$f44f,$7384,$81bb,$2024,$f000,$fb16,$2300,$82fb,
     $e019,$2300,$82bb,$e00f,$8aba,$8afb,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,
     $fb2f,$8abb,$3301,$82bb,$8aba,$89fb,$429a,$d3eb,$8afb,$3301,$82fb,$8afa,$89bb,$429a,$d3e1,$2026,
     $f000,$faf2,$2300,$827b,$e019,$2300,$823b,$e00f,$8a3a,$8a7b,$89f9,$fb01,$f303,$4413,$461a,$687b,
     $4413,$781b,$4618,$f000,$fb0b,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3eb,$8a7b,$3301,$827b,$8a7a,
     $89bb,$429a,$d3e1,$f000,$fb9b,$bf00,$3718,$46bd,$bd80,$b580,$b086,$af00,$4603,$71fb,$2316,$81fb,
     $b580,$b086,$af00,$4603,$71fb,$2316,$81fb,$f44f,$7384,$81bb,$2024,$f000,$fab7,$2300,$82fb,$e010,
     $2300,$82bb,$e006,$79fb,$4618,$f000,$fad9,$8abb,$3301,$82bb,$8aba,$89fb,$429a,$d3f4,$8afb,$3301,
     $82fb,$8afa,$89bb,$429a,$d3ea,$2026,$f000,$fa9c,$2300,$827b,$e010,$2300,$823b,$e006,$79fb,$4618,
     $f000,$fabe,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3f4,$8a7b,$3301,$827b,$8a7a,$89bb,$429a,$d3ea,
     $bf00,$bf00,$3718,$46bd,$bd80,$b580,$b086,$af00,$60f8,$4608,$4611,$461a,$b580,$b086,$af00,$60f8,
     $4608,$4611,$461a,$4603,$817b,$460b,$813b,$4613,$80fb,$897b,$f003,$0207,$88fb,$f003,$0307,$4413,
     $2b08,$d109,$897b,$f003,$0307,$b29a,$88fb,$f003,$0307,$b29b,$429a,$d80f,$897b,$f003,$0207,$88fb,
     $f003,$0307,$4413,$2b00,$d006,$88fa,$897b,$1ad3,$f003,$0307,$2b00,$d106,$897b,$08db,$817b,$88fb,
     $08db,$80fb,$e012,$897b,$08db,$817b,$88fb,$f003,$0307,$b29b,$2b00,$d103,$88fb,$08db,$b29b,$e004,
     $88fb,$08db,$b29b,$3301,$b29b,$80fb,$88fa,$897b,$1ad3,$82bb,$8c3a,$893b,$1ad3,$b29b,$8aba,$fb12,
     $f303,$827b,$88fb,$3b01,$80fb,$8c3b,$3b01,$843b,$f000,$f9d6,$203c,$f000,$fa17,$2080,$f000,$fa40,
     $2044,$f000,$fa11,$897b,$b2db,$4618,$f000,$fa38,$88fb,$b2db,$4618,$f000,$fa33,$2045,$f000,$fa04,
     $893b,$b2db,$4618,$f000,$fa2b,$893b,$0a1b,$b29b,$b2db,$f003,$0301,$b2db,$4618,$f000,$fa21,$8c3b,
     $b2db,$4618,$f000,$fa1c,$8c3b,$0a1b,$b29b,$b2db,$f003,$0301,$b2db,$4618,$f000,$fa12,$204e,$f000,
     $f9e3,$897b,$b2db,$4618,$f000,$fa0a,$204f,$f000,$f9db,$893b,$b2db,$4618,$f000,$fa02,$893b,$0a1b,
     $b29b,$b2db,$f003,$0301,$b2db,$4618,$f000,$f9f8,$2024,$f000,$f9c9,$2300,$82fb,$e009,$8afb,$68fa,
     $4413,$781b,$4618,$f000,$f9eb,$8afb,$3301,$82fb,$8afa,$8a7b,$429a,$d3f1,$f000,$faae,$bf00,$3718,
     $46bd,$bd80,$b580,$b086,$af00,$6078,$2024,$f7ff,$fc45,$2300,$b580,$b086,$af00,$6078,$2024,$f000,
     $f9a3,$2300,$617b,$e060,$2300,$72bb,$2300,$613b,$e051,$697b,$005a,$693b,$4413,$687a,$4413,$781b,
     $72fb,$2300,$60fb,$e040,$7afb,$f023,$033f,$727b,$7a7b,$2bc0,$d00e,$7a7b,$2b00,$d104,$7abb,$f043,
     $0301,$72bb,$e006,$7a7b,$2b80,$d103,$7abb,$f043,$0301,$72bb,$7abb,$005b,$72bb,$7afb,$009b,$72fb,
     $7afb,$f023,$033f,$727b,$7a7b,$2bc0,$d00e,$7a7b,$2b00,$d104,$7abb,$f043,$0301,$72bb,$e006,$7a7b,
     $2b80,$d103,$7abb,$f043,$0301,$72bb,$693b,$2b01,$d102,$68fb,$2b01,$d002,$7abb,$005b,$72bb,$7afb,
     $009b,$72fb,$68fb,$3301,$60fb,$68fb,$2b01,$d9bb,$693b,$3301,$613b,$693b,$2b01,$d9aa,$7abb,$4618,
     $f000,$f96e,$697b,$3301,$617b,$697b,$f241,$62af,$4293,$d999,$2026,$f000,$f937,$2300,$617b,$e060,
     $2300,$72bb,$2300,$613b,$e051,$697b,$005a,$693b,$4413,$687a,$4413,$781b,$72fb,$2300,$60fb,$e040,
     $7afb,$f023,$033f,$727b,$7a7b,$2bc0,$d00e,$7a7b,$2b00,$d104,$7abb,$f043,$0301,$72bb,$e006,$7a7b,
     $2b80,$d003,$7abb,$f043,$0301,$72bb,$7abb,$005b,$72bb,$7afb,$009b,$72fb,$7afb,$f023,$033f,$727b,
     $7a7b,$2bc0,$d00e,$7a7b,$2b00,$d104,$7abb,$f043,$0301,$72bb,$e006,$7a7b,$2b80,$d003,$7abb,$f043,
     $0301,$72bb,$693b,$2b01,$d102,$68fb,$2b01,$d002,$7abb,$005b,$72bb,$7afb,$009b,$72fb,$68fb,$3301,
     $60fb,$68fb,$2b01,$d9bb,$693b,$3301,$613b,$693b,$2b01,$d9aa,$7abb,$4618,$f000,$f902,$697b,$3301,
     $617b,$697b,$f241,$62af,$4293,$d999,$f000,$f9da,$bf00,$3718,$46bd,$bd80,$b580,$af00,$2010,$f7ff,
     $fb65,$2001,$f7ff,$fb88,$b580,$af00,$2010,$f000,$f8bb,$2001,$f000,$f8e4,$bf00,$bd80,$b580,$af00,
     $4b0f,$681b,$b29b,$2101,$4618,$f7fc,$b480,$af00,$b403,$4906,$600d,$604e,$608f,$ea5f,$0008,$60c8,
     $bc03,$bf00,$46bd,$f85d,$7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,
     $af00,$60f8,$60b9,$607a,$603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,$683b,$6013,$4a1a,$68bb,
     $6013,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,$f000,$f99a,$4b10,$681b,
     $b29b,$2101,$4618,$f000,$f993,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f98c,$4b0a,$681b,$b29b,$2100,
     $4618,$f000,$f985,$4b08,$681b,$b29b,$2101,$4618,$f000,$f9a8,$bf00,$3710,$46bd,$bd80,$43a8,$2000,
     $43a0,$2000,$4394,$2000,$439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,$2302,$2201,$2103,$2000,
     $b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f989,$2014,$f000,$f9a4,$4b0a,$681b,$b29b,$2100,
     $4618,$f000,$f97f,$2002,$f000,$f99a,$4b05,$681b,$b29b,$2101,$4618,$f000,$f975,$2014,$f000,$f990,
     $bf00,$bd80,$43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$af00,$4b07,$681b,$b29b,$4618,
     $f000,$f990,$4603,$2b00,$d000,$e7f5,$bf00,$2014,$f000,$f976,$bf00,$bd80,$4394,$2000,$b580,$af00,
     $2022,$f7ff,$ff9b,$20f7,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f942,
     $4b0b,$681b,$b29b,$2100,$4618,$f000,$f93b,$79fb,$4618,$f000,$f97d,$4b06,$681b,$b29b,$2101,$4618,
     $f000,$f930,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,
     $b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2101,$4618,$f000,$f916,$4b0b,$681b,$b29b,$2100,
     $4618,$f000,$f90f,$79fb,$4618,$f000,$f951,$4b06,$681b,$b29b,$2101,$4618,$f000,$f904,$bf00,$3708,
     $46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$af00,$4b07,$681b,$b29b,$4618,$4840,$0080,$0000,$0000,
     $0000,$0000,$4808,$0010,$0000,$0000,$0000,$0000,$4802,$0004,$0000,$0000,$0000,$0000,$4820,$0001,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$190a,$0300,$0008,$1400,$0001,$0114,
     $0300,$030a,$0800,$0019,$0100,$0000,$0000,$0100,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$2222,$2222,$2222,$0000,$2200,$4117,$3200,$001c,$b580,$b082,$af00,$2032,
     $f7ff,$ff52,$2300,$607b,$e009,$4a09,$687b,$4413,$781b,$4618,$f7ff,$ff74,$687b,$3301,$607b,$687b,
     $2b98,$d9f2,$bf00,$bf00,$3708,$46bd,$bd80,$bf00,$04c0,$2000,$b580,$af00,$f7ff,$ff1e,$f7ff,$ff8c,
     $b580,$af00,$2022,$f7ff,$ff2f,$20f7,$f7ff,$ff58,$2020,$f7ff,$ff29,$f7ff,$ff0d,$bf00,$bd80,$b580,
     $af00,$2022,$f7ff,$ff8c,$20c7,$f7ff,$b580,$af00,$2022,$f7ff,$ff19,$20c7,$f7ff,$ff42,$2020,$f7ff,
     $ff13,$f7ff,$fef7,$bf00,$bd80,$b580,$af00,$2022,$f7ff,$ff7d,$20ff,$f7ff,$b580,$af00,$2022,$f7ff,
     $ff03,$20ff,$f7ff,$ff2c,$2020,$f7ff,$fefd,$f7ff,$fee1,$bf00,$bd80,$b580,$af00,$2022,$f7ff,$ff6e,
     $20c7,$f7ff,$b580,$af00,$2022,$f7ff,$feed,$20c7,$f7ff,$ff16,$2020,$f7ff,$fee7,$f7ff,$fecb,$bf00,
     $bd80,$b580,$b082,$af00,$2032,$f7ff,$ff5e,$2300,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,
     $88fb,$4618,$f000,$f87e,$88bb,$2b00,$d002,$88bb,$2b00,$d105,$88fb,$2100,$4618,$f000,$f88f,$e005,
     $88fb,$2101,$4618,$f000,$f889,$bf00,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$6078,$6878,$f7ff,
     $ff51,$bf00,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,$88fa,$797b,$2b00,$bf14,$2301,$2300,
     $b2db,$4619,$4610,$f000,$f885,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,
     $b580,$b082,$af00,$6078,$6878,$f000,$f88f,$bf00,$3708,$46bd,$bd80,$0000,$b580,$b084,$af00,$60f8,
     $60b9,$607a,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,$f891,$4603,$4618,$3708,$46bd,$bd80,
     $b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,
     $010c,$2394,$2203,$2001,$f000,$f894,$bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,$f04f,$4350,
     $685a,$2101,$b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,$2100,$6878,$f000,$f82c,$2105,$6878,
     $f000,$f896,$bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,$4809,$f002,$f99e,$693b,$b480,$b085,
     $af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3044,$bf00,$bf00,$3714,$46bd,
     $f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$b480,$b085,$af00,$6078,$460b,$70fb,
     $687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b480,
     $b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f82a,
     $bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$b480,$b083,$af00,$6078,
     $f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,$2b00,$bf14,$2301,$2300,$b2db,$4618,$370c,$46bd,
     $f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b590,$b087,$af00,$60f8,$60b9,$607a,
     $603b,$4b07,$68db,$617b,$697c,$683b,$687a,$68b9,$68f8,$47a0,$4603,$4618,$371c,$46bd,$bd90,$bf00,
     $4400,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b08a,$af00,$6078,$460b,$70fb,$6878,$f000,
     $f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$405a,$697b,$4013,
     $69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,$6013,$bf00,$bf00,$490d,$78fa,$687b,$00db,$440b,
     $605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,$623b,$6a7b,$f503,$5340,$461a,$6a3b,$6013,$bf00,
     $bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,$b580,$b082,$af00,$6078,$2100,$6878,$b480,$b083,
     $af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
