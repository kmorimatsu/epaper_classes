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
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+2724,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2868,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2872,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2876,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2880,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2884,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+2888,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+2976,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2980,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3068,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+3072,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3328,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+3416,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+4036,C_RAM+0
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
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f915,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_4GRAY_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9bb,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fb5d,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fb91,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fc37,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_DISPLAY_PART
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fc75,$b002,$bd00,$46c0
LABEL C_EPD_3IN7_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fd51,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fd55,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fd5d,$b002,$bd00,$46c0

REM 4416 bytes
LABEL C_FUNCTIONS
EXEC $b580,$b084,$af00,$1dbb,$2223,$801a,$1d3b,$22f0,$0052,$801a,$2049,$f000,$fd9f,$2000,$f000,$fdca,
     $204e,$f000,$fd99,$2000,$f000,$fdc4,$2000,$f000,$fdc1,$204f,$f000,$fd90,$2000,$f000,$fdbb,$2000,
     $f000,$fdb8,$2024,$f000,$fd87,$230e,$18fb,$2200,$801a,$e01a,$230c,$18fb,$2200,$801a,$e008,$20ff,
     $f000,$fda8,$210c,$187b,$881a,$187b,$3201,$801a,$230c,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210e,
     $187b,$881a,$187b,$3201,$801a,$230e,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$204e,$f000,$fd5d,$2000,
     $f000,$fd88,$2000,$f000,$fd85,$204f,$f000,$fd54,$2000,$f000,$fd7f,$2000,$f000,$fd7c,$2026,$f000,
     $fd4b,$230a,$18fb,$2200,$801a,$e01a,$2308,$18fb,$2200,$801a,$e008,$20ff,$f000,$fd6c,$2108,$187b,
     $881a,$187b,$3201,$801a,$2308,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210a,$187b,$881a,$187b,$3201,
     $801a,$230a,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$2000,$f000,$fd7d,$2022,$f000,$fd1e,$20c7,$f000,
     $fd49,$2020,$f000,$fd18,$f000,$fdd2,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$1d3b,$4a1a,$801a,
     $204e,$f7ff,$b580,$af00,$f000,$fde2,$2012,$f000,$fd03,$2396,$005b,$0018,$f000,$fe06,$2046,$f000,
     $fcfb,$20f7,$f000,$fd26,$f000,$fdb2,$2047,$f000,$fcf3,$20f7,$f000,$fd1e,$f000,$fdaa,$2001,$f000,
     $fceb,$20df,$f000,$fd16,$2001,$f000,$fd13,$2000,$f000,$fd10,$2003,$f000,$fcdf,$2000,$f000,$fd0a,
     $2004,$f000,$fcd9,$2041,$f000,$fd04,$20a8,$f000,$fd01,$2032,$f000,$fcfe,$2011,$f000,$fccd,$2003,
     $f000,$fcf8,$203c,$f000,$fcc7,$2003,$f000,$fcf2,$200c,$f000,$fcc1,$20ae,$f000,$fcec,$20c7,$f000,
     $fce9,$20c3,$f000,$fce6,$20c0,$f000,$fce3,$20c0,$f000,$fce0,$2018,$f000,$fcaf,$2080,$f000,$fcda,
     $202c,$f000,$fca9,$2044,$f000,$fcd4,$2037,$f000,$fca3,$2000,$f000,$fcce,$2000,$f000,$fccb,$2000,
     $f000,$fcc8,$2000,$f000,$fcc5,$2000,$f000,$fcc2,$2000,$f000,$fcbf,$2000,$f000,$fcbc,$2000,$f000,
     $fcb9,$2000,$f000,$fcb6,$2000,$f000,$fcb3,$2044,$f000,$fc82,$2000,$f000,$fcad,$2000,$f000,$fcaa,
     $2017,$f000,$fca7,$2001,$f000,$fca4,$2045,$f000,$fc73,$2000,$f000,$fc9e,$2000,$f000,$fc9b,$20df,
     $f000,$fc98,$2001,$f000,$fc95,$2022,$f000,$fc64,$20cf,$f000,$fc8f,$46c0,$46bd,$bd80,$b580,$af00,
     $f7ff,$fe66,$2012,$f7ff,$fe89,$2396,$b590,$b087,$af00,$6078,$2049,$f000,$fc4f,$2000,$f000,$fc7a,
     $204e,$f000,$fc49,$2000,$f000,$fc74,$2000,$f000,$fc71,$204f,$f000,$fc40,$2000,$f000,$fc6b,$2000,
     $f000,$fc68,$2024,$f000,$fc37,$2300,$617b,$e0a8,$230a,$18fb,$2200,$701a,$2300,$613b,$e094,$697b,
     $005a,$693b,$18d3,$687a,$18d2,$230b,$18fb,$7812,$701a,$2300,$60fb,$e080,$2009,$183b,$220b,$18ba,
     $7812,$213f,$438a,$701a,$183b,$781b,$2bc0,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e01c,
     $2309,$18fb,$781b,$2b00,$d105,$220a,$18bb,$18ba,$7812,$701a,$e011,$2309,$18fb,$781b,$2b80,$d105,
     $220a,$18bb,$18ba,$7812,$701a,$e006,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$200a,$183a,$183b,
     $781b,$18db,$7013,$210b,$187b,$187a,$7812,$0092,$701a,$2409,$193b,$187a,$7812,$213f,$438a,$701a,
     $193b,$781b,$2bc0,$d106,$183b,$183a,$7812,$2101,$430a,$701a,$e01c,$2309,$18fb,$781b,$2b00,$d105,
     $220a,$18bb,$18ba,$7812,$701a,$e011,$2309,$18fb,$781b,$2b80,$d105,$220a,$18bb,$18ba,$7812,$701a,
     $e006,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$693b,$2b01,$d102,$68fb,$2b01,$d005,$230a,$18fa,
     $18fb,$781b,$18db,$7013,$220b,$18bb,$18ba,$7812,$0092,$701a,$68fb,$3301,$60fb,$68fb,$2b01,$d800,
     $e77a,$693b,$3301,$613b,$693b,$2b01,$d800,$e766,$230a,$18fb,$781b,$0018,$f000,$fbbc,$697b,$3301,
     $617b,$697b,$4a6d,$4293,$d800,$e751,$204e,$f000,$fb83,$2000,$f000,$fbae,$2000,$f000,$fbab,$204f,
     $f000,$fb7a,$2000,$f000,$fba5,$2000,$f000,$fba2,$2026,$f000,$fb71,$2300,$617b,$e0a8,$230a,$18fb,
     $2200,$701a,$2300,$613b,$e094,$697b,$005a,$693b,$18d3,$687a,$18d2,$230b,$18fb,$7812,$701a,$2300,
     $60fb,$e080,$2009,$183b,$220b,$18ba,$7812,$213f,$438a,$701a,$183b,$781b,$2bc0,$d107,$220a,$18bb,
     $18ba,$7812,$2101,$430a,$701a,$e01c,$2309,$18fb,$781b,$2b00,$d105,$220a,$18bb,$18ba,$7812,$701a,
     $e011,$2309,$18fb,$781b,$2b80,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e004,$220a,$18bb,
     $18ba,$7812,$701a,$200a,$183a,$183b,$781b,$18db,$7013,$210b,$187b,$187a,$7812,$0092,$701a,$2409,
     $193b,$187a,$7812,$213f,$438a,$701a,$193b,$781b,$2bc0,$d106,$183b,$183a,$7812,$2101,$430a,$701a,
     $e01c,$2309,$18fb,$781b,$2b00,$d105,$220a,$18bb,$18ba,$7812,$701a,$e011,$2309,$18fb,$781b,$2b80,
     $d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e004,$220a,$18bb,$18ba,$7812,$701a,$693b,$2b01,
     $d102,$68fb,$2b01,$d005,$230a,$18fa,$18fb,$781b,$18db,$7013,$220b,$18bb,$18ba,$7812,$0092,$701a,
     $68fb,$3301,$60fb,$68fb,$2b01,$d800,$e77a,$693b,$3301,$613b,$693b,$2b01,$d800,$e766,$230a,$18fb,
     $781b,$0018,$f000,$faf6,$697b,$3301,$617b,$697b,$4a0a,$4293,$d800,$e751,$2000,$f000,$fb19,$2022,
     $f000,$faba,$20c7,$f000,$fae5,$2020,$f000,$fab4,$f000,$fb6e,$46c0,$46bd,$b007,$bd90,$419f,$0000,
     $b590,$b085,$af00,$6078,$230c,$18fb,$b580,$b082,$af00,$1d3b,$4a1a,$801a,$204e,$f000,$fa9d,$2000,
     $f000,$fac8,$2000,$f000,$fac5,$204f,$f000,$fa94,$2000,$f000,$fabf,$2000,$f000,$fabc,$2024,$f000,
     $fa8b,$1dbb,$2200,$801a,$e007,$20ff,$f000,$fab2,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,$1d3b,$8812,
     $881b,$429a,$d3f1,$2002,$f000,$fad2,$2020,$f000,$fa73,$f000,$fb2d,$46c0,$46bd,$b002,$bd80,$46c0,
     $41a0,$0000,$b590,$b087,$af00,$6078,$2049,$f7ff,$b580,$af00,$f000,$fb3c,$2012,$f000,$fa5d,$2396,
     $005b,$0018,$f000,$fb60,$2046,$f000,$fa55,$20f7,$f000,$fa80,$f000,$fb0c,$2047,$f000,$fa4d,$20f7,
     $f000,$fa78,$f000,$fb04,$2001,$f000,$fa45,$20df,$f000,$fa70,$2001,$f000,$fa6d,$2000,$f000,$fa6a,
     $2003,$f000,$fa39,$2000,$f000,$fa64,$2004,$f000,$fa33,$2041,$f000,$fa5e,$20a8,$f000,$fa5b,$2032,
     $f000,$fa58,$2011,$f000,$fa27,$2003,$f000,$fa52,$203c,$f000,$fa21,$2003,$f000,$fa4c,$200c,$f000,
     $fa1b,$20ae,$f000,$fa46,$20c7,$f000,$fa43,$20c3,$f000,$fa40,$20c0,$f000,$fa3d,$20c0,$f000,$fa3a,
     $2018,$f000,$fa09,$2080,$f000,$fa34,$202c,$f000,$fa03,$2044,$f000,$fa2e,$2037,$f000,$f9fd,$2000,
     $f000,$fa28,$20ff,$f000,$fa25,$20ff,$f000,$fa22,$20ff,$f000,$fa1f,$20ff,$f000,$fa1c,$204f,$f000,
     $fa19,$20ff,$f000,$fa16,$20ff,$f000,$fa13,$20ff,$f000,$fa10,$20ff,$f000,$fa0d,$2044,$f000,$f9dc,
     $2000,$f000,$fa07,$2000,$f000,$fa04,$2017,$f000,$fa01,$2001,$f000,$f9fe,$2045,$f000,$f9cd,$2000,
     $f000,$f9f8,$2000,$f000,$f9f5,$20df,$f000,$f9f2,$2001,$f000,$f9ef,$2022,$f000,$f9be,$20cf,$f000,
     $f9e9,$46c0,$46bd,$bd80,$b580,$b084,$af00,$1dbb,$2223,$801a,$1d3b,$22f0,$b590,$b085,$af00,$6078,
     $230c,$18fb,$4a1e,$801a,$204e,$f000,$f9a5,$2000,$f000,$f9d0,$2000,$f000,$f9cd,$204f,$f000,$f99c,
     $2000,$f000,$f9c7,$2000,$f000,$f9c4,$2024,$f000,$f993,$230e,$18fb,$2200,$801a,$e00d,$240e,$193b,
     $881b,$687a,$18d3,$781b,$0018,$f000,$f9b3,$193b,$881a,$193b,$3201,$801a,$230e,$18fa,$230c,$18fb,
     $8812,$881b,$429a,$d3e9,$2002,$f000,$f9d1,$2020,$f000,$f972,$f000,$fa2c,$46c0,$46bd,$b005,$bd90,
     $41a0,$0000,$b5f0,$b087,$af00,$60f8,$000c,$0010,$b5f0,$b087,$af00,$60f8,$000c,$0010,$0019,$250a,
     $197b,$1c22,$801a,$2308,$18fb,$1c02,$801a,$1dbb,$1c0a,$801a,$1dbb,$881a,$197b,$881b,$1ad3,$001a,
     $2307,$4013,$d109,$1dbb,$881a,$197b,$881b,$1ad3,$d500,$3307,$10db,$b29b,$e00b,$1dbb,$881a,$230a,
     $18fb,$881b,$1ad3,$d500,$3307,$10db,$b29b,$3301,$b29b,$2014,$183a,$8013,$2428,$2608,$19bb,$191b,
     $2508,$1979,$881a,$880b,$1ad3,$b29a,$2312,$18fb,$1839,$8809,$434a,$801a,$1dbb,$1dba,$8812,$3a01,
     $801a,$19bb,$191b,$19ba,$1912,$8812,$3a01,$801a,$2044,$f000,$f911,$260a,$19bb,$881b,$b2db,$0018,
     $f000,$f938,$19bb,$881b,$0a1b,$b29b,$b2db,$2203,$4013,$b2db,$0018,$f000,$f92d,$1dbb,$881b,$b2db,
     $0018,$f000,$f927,$1dbb,$881b,$0a1b,$b29b,$b2db,$2203,$4013,$b2db,$0018,$f000,$f91c,$2045,$f000,
     $f8eb,$197b,$881b,$b2db,$0018,$f000,$f913,$197b,$881b,$0a1b,$b29b,$b2db,$2203,$4013,$b2db,$0018,
     $f000,$f908,$2308,$18fa,$1913,$881b,$b2db,$0018,$f000,$f900,$2308,$18fb,$191b,$881b,$0a1b,$b29b,
     $b2db,$2203,$4013,$b2db,$0018,$f000,$f8f3,$204e,$f000,$f8c2,$19bb,$881b,$b2db,$0018,$f000,$f8ea,
     $204f,$f000,$f8b9,$197b,$881b,$b2db,$0018,$f000,$f8e1,$197b,$881b,$0a1b,$b29b,$b2db,$0018,$f000,
     $f8d9,$2024,$f000,$f8a8,$2316,$18fb,$2200,$801a,$e00d,$2416,$193b,$881b,$68fa,$18d3,$781b,$0018,
     $f000,$f8c8,$193b,$881a,$193b,$3201,$801a,$2316,$18fa,$2312,$18fb,$8812,$881b,$429a,$d3e9,$2003,
     $f000,$f8e6,$2020,$f000,$f887,$f000,$f941,$46c0,$46bd,$b007,$bdf0,$b580,$af00,$2010,$f7ff,$fa36,
     $2003,$f7ff,$b580,$af00,$2010,$f000,$f875,$2003,$f000,$f8a0,$46c0,$46bd,$bd80,$b580,$af00,$4b1f,
     $681b,$b29b,$2100,$0018,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,
     $bd80,$0000,$43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,
     $603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,
     $4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f94e,$4b10,$681b,$b29b,$2101,$0018,$f000,
     $f947,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f940,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f939,$4b08,
     $681b,$b29b,$2101,$0018,$f000,$f962,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,
     $435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$b082,$af00,$0002,
     $1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f93f,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f938,
     $1dfb,$781b,$0018,$f000,$f953,$4b06,$681b,$b29b,$2101,$0018,$f000,$f92c,$46c0,$46bd,$b002,$bd80,
     $4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $4b0e,$681b,$b29b,$2101,$0018,$f000,$f911,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f90a,$1dfb,$781b,
     $0018,$f000,$f925,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8fe,$46c0,$46bd,$b002,$bd80,$4360,$2000,
     $435c,$2000,$b590,$b083,$af00,$4b0a,$681b,$b29b,$b580,$b084,$af00,$0002,$1dfb,$701a,$2032,$f7ff,
     $ff9b,$230e,$18fb,$2200,$801a,$e038,$1dfb,$781b,$2b00,$d108,$230e,$18fb,$881b,$4a1e,$5cd3,$0018,
     $f7ff,$ffb8,$e025,$1dfb,$781b,$2b01,$d108,$230e,$18fb,$881b,$4a18,$5cd3,$0018,$f7ff,$ffab,$e018,
     $1dfb,$781b,$2b02,$d108,$230e,$18fb,$881b,$4a13,$5cd3,$0018,$f7ff,$ff9e,$e00b,$1dfb,$781b,$2b03,
     $d107,$230e,$18fb,$881b,$4a0d,$5cd3,$0018,$f7ff,$ff91,$210e,$187b,$881a,$187b,$3201,$801a,$230e,
     $18fb,$881b,$2b68,$d9c1,$46c0,$46c0,$46bd,$b004,$bd80,$46c0,$e1a0,$1000,$e20c,$1000,$e278,$1000,
     $e2e4,$1000,$b580,$af00,$f7ff,$ff12,$2012,$f7ff,$b590,$b083,$af00,$4b0a,$681b,$b29b,$1dfc,$0018,
     $f000,$f8c2,$0003,$7023,$1dfb,$781b,$2b00,$d1f2,$20c8,$f000,$f839,$46c0,$46bd,$b003,$bd90,$46c0,
     $4354,$2000,$b580,$b084,$af00,$0002,$1dfb,$701a,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,
     $f867,$201e,$f000,$f820,$4b0b,$681b,$b29b,$2100,$0018,$f000,$f85d,$2003,$f000,$f816,$4b06,$681b,
     $b29b,$2101,$0018,$f000,$f853,$201e,$f000,$f80c,$46c0,$46bd,$bd80,$46c0,$4368,$2000,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f890,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,
     $801a,$1dbb,$881b,$0018,$f000,$f88c,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,
     $2100,$0018,$f000,$f8a0,$e006,$1dbb,$881b,$2101,$0018,$f000,$f899,$46c0,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,
     $701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89c,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,
     $60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a4,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,
     $23d0,$061b,$685a,$687b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8ab,$0003,
     $0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b082,$af00,$6078,
     $6878,$239a,$2200,$2100,$f000,$f876,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,
     $1dfb,$781b,$b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,
     $687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,$f88b,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,
     $4b04,$681b,$2202,$4013,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,
     $1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8a8,$e003,$68fb,$0018,$f000,$f8b7,$46c0,$46bd,$b004,
     $bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8ac,$e003,$68fb,$0018,$f000,
     $f8bb,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,
     $bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,
     $685a,$687b,$40da,$0013,$2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,
     $6078,$23d0,$061b,$687a,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f881,$687b,
     $009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,
     $613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,
     $3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,
     $46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
