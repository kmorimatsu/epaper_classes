rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:  	EPD_2in13_V4.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.13inch e-paper V4
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2023-08-12
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
  POKE32 DATAADDRESS(C_FUNCTIONS)+1396,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1484,C_RAM+16
  POKE32 DATAADDRESS(C_FUNCTIONS)+1628,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1632,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1636,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1640,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1644,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1648,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1736,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1796,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1884,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1888,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1976,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1980,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3048,C_RAM+16
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN13_V4_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f852,$bd00,$46c0
LABEL C_EPD_2IN13_V4_INIT_FAST
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f892,$bd00,$46c0
LABEL C_EPD_2IN13_V4_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8d2,$bd00,$46c0
LABEL C_EPD_2IN13_V4_CLEAR_BLACK
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f904,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f936,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY_FAST
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f982,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY_BASE
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f9ce,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY_PARTIAL
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fa54,$bd00,$46c0
LABEL C_EPD_2IN13_V4_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fad4,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fae2,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$faf0,$bd00,$46c0

REM 3376 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fb3c,$f000,$fb66,$2012,$f000,$fb81,$f000,$fb61,$2001,$f000,$fb7c,$20f9,$f000,
     $fba7,$2000,$f000,$fba4,$2000,$f000,$fba1,$2011,$f000,$fb70,$2003,$f000,$fb9b,$23f9,$2279,$2100,
     $2000,$f000,$fbc3,$2100,$2000,$f000,$fc0f,$203c,$f000,$fb60,$2005,$f000,$fb8b,$2021,$f000,$fb5a,
     $2000,$f000,$fb85,$2080,$f000,$fb82,$2018,$f000,$fb51,$2080,$f000,$fb7c,$f000,$fb2e,$46c0,$46bd,
     $bd80,$b580,$af00,$f7ff,$fe8d,$2012,$f7ff,$feb0,$b580,$af00,$f000,$faf4,$2012,$f000,$fb3b,$f000,
     $fb1b,$2018,$f000,$fb36,$2080,$f000,$fb61,$2011,$f000,$fb30,$2003,$f000,$fb5b,$23f9,$2279,$2100,
     $2000,$f000,$fb83,$2100,$2000,$f000,$fbcf,$2022,$f000,$fb20,$20b1,$f000,$fb4b,$2020,$f000,$fb1a,
     $f000,$fafa,$201a,$f000,$fb15,$2064,$f000,$fb40,$2000,$f000,$fb3d,$2022,$f000,$fb0c,$2091,$f000,
     $fb37,$2020,$f000,$fb06,$f000,$fae6,$46c0,$46bd,$bd80,$b580,$b082,$af00,$1cbb,$2210,$801a,$003b,
     $b580,$b082,$af00,$1cbb,$2210,$801a,$003b,$22fa,$801a,$2024,$f000,$faee,$1dbb,$2200,$801a,$e016,
     $1d3b,$2200,$801a,$e007,$20ff,$f000,$fb11,$1d3b,$881a,$1d3b,$3201,$801a,$1d3a,$1cbb,$8812,$881b,
     $429a,$d3f1,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,$003b,$8812,$881b,$429a,$d3e2,$f000,$fba5,$46c0,
     $46bd,$b002,$bd80,$b580,$b082,$af00,$1cbb,$2210,$801a,$003b,$b580,$b082,$af00,$1cbb,$2210,$801a,
     $003b,$22fa,$801a,$2024,$f000,$fab4,$1dbb,$2200,$801a,$e016,$1d3b,$2200,$801a,$e007,$2000,$f000,
     $fad7,$1d3b,$881a,$1d3b,$3201,$801a,$1d3a,$1cbb,$8812,$881b,$429a,$d3f1,$1dbb,$881a,$1dbb,$3201,
     $801a,$1dba,$003b,$8812,$881b,$429a,$d3e2,$f000,$fb6b,$46c0,$46bd,$b002,$bd80,$b590,$b085,$af00,
     $6078,$230a,$18fb,$2210,$b590,$b085,$af00,$6078,$230a,$18fb,$2210,$801a,$2308,$18fb,$22fa,$801a,
     $2024,$f000,$fa77,$230e,$18fb,$2200,$801a,$e029,$230c,$18fb,$2200,$801a,$e016,$240c,$193b,$881a,
     $230e,$18fb,$881b,$210a,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$fa89,$193b,
     $881a,$193b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,$881b,$429a,$d3e0,$210e,$187b,$881a,$187b,
     $3201,$801a,$230e,$18fa,$2308,$18fb,$8812,$881b,$429a,$d3cd,$f000,$fb18,$46c0,$46bd,$b005,$bd90,
     $b590,$b085,$af00,$6078,$230a,$18fb,$2210,$801a,$b590,$b085,$af00,$6078,$230a,$18fb,$2210,$801a,
     $2308,$18fb,$22fa,$801a,$2024,$f000,$fa23,$230e,$18fb,$2200,$801a,$e029,$230c,$18fb,$2200,$801a,
     $e016,$240c,$193b,$881a,$230e,$18fb,$881b,$210a,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,
     $0018,$f000,$fa35,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,$881b,$429a,$d3e0,
     $210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$2308,$18fb,$8812,$881b,$429a,$d3cd,$f000,$fadc,
     $46c0,$46bd,$b005,$bd90,$b590,$b087,$af00,$6078,$230e,$18fb,$2210,$801a,$b590,$b087,$af00,$6078,
     $230e,$18fb,$2210,$801a,$230c,$18fb,$22fa,$801a,$2024,$f000,$f9cf,$2316,$18fb,$2200,$801a,$e029,
     $2314,$18fb,$2200,$801a,$e016,$2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,
     $001a,$687b,$189b,$781b,$0018,$f000,$f9e1,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,$230e,$18fb,
     $8812,$881b,$429a,$d3e0,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,$8812,$881b,
     $429a,$d3cd,$2026,$f000,$f995,$2312,$18fb,$2200,$801a,$e029,$2310,$18fb,$2200,$801a,$e016,$2410,
     $193b,$881a,$2312,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,
     $f9a7,$193b,$881a,$193b,$3201,$801a,$2310,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2112,$187b,
     $881a,$187b,$3201,$801a,$2312,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$f000,$fa36,$46c0,$46bd,
     $b007,$bd90,$b590,$b085,$af00,$6078,$230a,$18fb,$2210,$801a,$b590,$b085,$af00,$6078,$230a,$18fb,
     $2210,$801a,$2308,$18fb,$22fa,$801a,$4b39,$681b,$b29b,$2100,$0018,$f000,$fa47,$2001,$f000,$fa64,
     $4b34,$681b,$b29b,$2101,$0018,$f000,$fa3d,$203c,$f000,$f930,$2080,$f000,$f95b,$2001,$f000,$f92a,
     $20f9,$f000,$f955,$2000,$f000,$f952,$2000,$f000,$f94f,$2011,$f000,$f91e,$2003,$f000,$f949,$23f9,
     $2279,$2100,$2000,$f000,$f971,$2100,$2000,$f000,$f9bd,$2024,$f000,$f90e,$230e,$18fb,$2200,$801a,
     $e029,$230c,$18fb,$2200,$801a,$e016,$240c,$193b,$881a,$230e,$18fb,$881b,$210a,$1879,$8809,$434b,
     $18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f920,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,
     $18fb,$8812,$881b,$429a,$d3e0,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$2308,$18fb,$8812,
     $881b,$429a,$d3cd,$f000,$fa13,$46c0,$46bd,$b005,$bd90,$46c0,$4368,$2000,$b580,$af00,$2010,$f7ff,
     $fc6b,$2001,$b580,$af00,$2010,$f000,$f8c3,$2001,$f000,$f8ee,$2064,$f000,$f9e7,$46c0,$46bd,$bd80,
     $b580,$af00,$4b13,$681b,$b29b,$2101,$0018,$f7fe,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,
     $60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,
     $af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,
     $601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f9d2,$4b10,$681b,
     $b29b,$2101,$0018,$f000,$f9cb,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f9c4,$4b0a,$681b,$b29b,$2100,
     $0018,$f000,$f9bd,$4b08,$681b,$b29b,$2101,$0018,$f000,$f96a,$46c0,$46bd,$b004,$bd80,$4368,$2000,
     $4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,
     $b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f94b,$2014,$f000,$f968,$4b0b,$681b,$b29b,$2100,
     $0018,$f000,$f941,$2002,$f000,$f95e,$4b06,$681b,$b29b,$2101,$0018,$f000,$f937,$2014,$f000,$f954,
     $46c0,$46bd,$bd80,$46c0,$4368,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$af00,$4b09,$681b,
     $b29b,$0018,$f000,$f99c,$1e03,$d003,$200a,$f000,$f93b,$e7f3,$46c0,$200a,$f000,$f936,$46c0,$46bd,
     $bd80,$46c0,$4354,$2000,$b5b0,$b082,$af00,$0005,$000c,$0010,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $4b0e,$681b,$b29b,$2100,$0018,$f000,$f8fd,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8f6,$1dfb,$781b,
     $0018,$f000,$f985,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8ea,$46c0,$46bd,$b002,$bd80,$4360,$2000,
     $435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,
     $b29b,$2101,$0018,$f000,$f8cf,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8c8,$1dfb,$781b,$0018,$f000,
     $f957,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8bc,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,
     $b580,$af00,$4b09,$681b,$b29b,$0018,$b5b0,$b082,$af00,$0005,$000c,$0010,$0019,$1dbb,$1c2a,$801a,
     $1d3b,$1c22,$801a,$1cbb,$1c02,$801a,$003b,$1c0a,$801a,$2044,$f7ff,$ff8e,$1dbb,$881b,$08db,$b29b,
     $b2db,$0018,$f7ff,$ffb4,$1cbb,$881b,$08db,$b29b,$b2db,$0018,$f7ff,$ffac,$2045,$f7ff,$ff7b,$1d3b,
     $881b,$b2db,$0018,$f7ff,$ffa3,$1d3b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff9b,$003b,$881b,$b2db,
     $0018,$f7ff,$ff95,$003b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff8d,$46c0,$46bd,$b002,$bdb0,$b580,
     $b082,$af00,$0002,$1dbb,$801a,$1d3b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$204e,
     $f7ff,$ff48,$1dbb,$881b,$b2db,$0018,$f7ff,$ff70,$204f,$f7ff,$ff3f,$1d3b,$881b,$b2db,$0018,$f7ff,
     $ff67,$1d3b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff5f,$46c0,$46bd,$b002,$bd80,$b580,$af00,$2022,
     $f7ff,$ff23,$20f7,$f7ff,$b580,$af00,$2022,$f7ff,$ff21,$20f7,$f7ff,$ff4c,$2020,$f7ff,$ff1b,$f7ff,
     $fefb,$46c0,$46bd,$bd80,$b580,$af00,$2022,$f7ff,$ff13,$20c7,$f7ff,$ff38,$b580,$af00,$2022,$f7ff,
     $ff09,$20c7,$f7ff,$ff34,$2020,$f7ff,$ff03,$f7ff,$fee3,$46c0,$46bd,$bd80,$b580,$af00,$2022,$f7ff,
     $ff03,$20ff,$f7ff,$ff28,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,
     $781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89c,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1dbb,$881b,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8ac,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$af00,$2022,$f7ff,$febd,$20ff,$f7ff,$fee8,
     $2020,$f7ff,$feb7,$f7ff,$fe97,$46c0,$46bd,$bd80,$b580,$af00,$f7ff,$fece,$f7ff,$ff42,$2012,$f7ff,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f890,$1d3b,$881b,
     $2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f8a4,$e006,$1dbb,$881b,$2101,
     $0018,$f000,$f89d,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8a9,$0003,$0018,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,
     $60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a6,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,
     $23d0,$061b,$685a,$687b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,
     $1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8a4,$e003,$68fb,$0018,$f000,$f8b3,$46c0,$46bd,$b004,
     $bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,
     $f000,$f86c,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b082,
     $af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,
     $687b,$2105,$0018,$f000,$f88f,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,$2202,$4013,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,
     $68fb,$0018,$f000,$f8ac,$e003,$68fb,$0018,$f000,$f8bb,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,
     $0002,$1dbb,$801a,$1d7b,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,
     $1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b590,$b087,
     $af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,
     $46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f859,$687b,
     $009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,
     $613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,
     $3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
