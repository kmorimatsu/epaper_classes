rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_2in13_V2.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.13inch e-paper V2
rem * | Info        :
rem *----------------
rem * |	This version:   V3.0
rem * | Date        :   2019-06-13
rem * | Info        :
rem * -----------------------------------------------------------------------------
rem * V3.0(2019-06-13):
rem * 1.Change name:
rem *    EPD_Reset() => EPD_2IN13_V2_Reset()
rem *    EPD_SendCommand() => EPD_2IN13_V2_SendCommand()
rem *    EPD_SendData() => EPD_2IN13_V2_SendData()
rem *    EPD_WaitUntilIdle() => EPD_2IN13_V2_ReadBusy()
rem *    EPD_Init() => EPD_2IN13_V2_Init()
rem *    EPD_Clear() => EPD_2IN13_V2_Clear()
rem *    EPD_Display() => EPD_2IN13_V2_Display()
rem *    EPD_Sleep() => EPD_2IN13_V2_Sleep()
rem * 2.add:
rem *    EPD_2IN13_V2_DisplayPartBaseImage()
rem * -----------------------------------------------------------------------------
rem * V2.0(2018-11-14):
rem * 1.Remove:ImageBuff[EPD_HEIGHT * EPD_WIDTH / 8]
rem * 2.Change:EPD_2IN13_V2_Display(UBYTE *Image)
rem *   Need to pass parameters: pointer to cached data
rem * 3.Change:
rem *   EPD_RST -> EPD_RST_PIN
rem *   EPD_DC -> EPD_DC_PIN
rem *   EPD_CS -> EPD_CS_PIN
rem *   EPD_BUSY -> EPD_BUSY_PIN
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

method EPD_2IN13_V2_INIT
  goto C_EPD_2IN13_V2_INIT
method EPD_2IN13_V2_CLEAR
  goto C_EPD_2IN13_V2_CLEAR
method EPD_2IN13_V2_DISPLAY
  goto C_EPD_2IN13_V2_DISPLAY
method EPD_2IN13_V2_DISPLAYPART
  goto C_EPD_2IN13_V2_DISPLAYPART
method EPD_2IN13_V2_DISPLAYPARTBASEIMAGE
  goto C_EPD_2IN13_V2_DISPLAYPARTBASEIMAGE
method EPD_2IN13_V2_SLEEP
  goto C_EPD_2IN13_V2_SLEEP

method INIT
  var a,b,c,d
  GOSUB INIT_C
  spi 4000
  if args(0)<4 then
    a=8:b=9:c=12:d=13
  else
    a=args(1):b=args(2):c=args(3):d=args(4)
  endif
  gosub C_DEV_GPIO_INIT,a,b,c,d
return

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+1352,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1496,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1500,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1504,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1508,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1512,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1516,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1604,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1660,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1748,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1752,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1840,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1844,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2612,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN13_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f865,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f95b,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f987,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V2_DISPLAYPART
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9cd,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V2_DISPLAYPARTBASEIMAGE
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa13,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa97,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$faa7,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$faaf,$b002,$bd00,$46c0

REM 2940 bytes
LABEL C_FUNCTIONS
EXEC $b590,$b085,$af00,$0002,$1dfb,$701a,$f000,$faf6,$1dfb,$781b,$2b00,$d000,$e098,$f000,$fb1b,$2012,
     $f000,$fb34,$f000,$fb16,$2074,$f000,$fb2f,$2054,$f000,$fb5a,$207e,$f000,$fb29,$203b,$f000,$fb54,
     $2001,$f000,$fb23,$20f9,$f000,$fb4e,$2000,$f000,$fb4b,$2000,$f000,$fb48,$2011,$f000,$fb17,$2001,
     $f000,$fb42,$2044,$f000,$fb11,$2000,$f000,$fb3c,$200f,$f000,$fb39,$2045,$f000,$fb08,$20f9,$f000,
     $fb33,$2000,$f000,$fb30,$2000,$f000,$fb2d,$2000,$f000,$fb2a,$203c,$f000,$faf9,$2003,$f000,$fb24,
     $202c,$f000,$faf3,$2055,$f000,$fb1e,$2003,$f000,$faed,$2315,$0018,$f000,$fb17,$2004,$f000,$fae6,
     $2341,$0018,$f000,$fb10,$23a8,$0018,$f000,$fb0c,$2332,$0018,$f000,$fb08,$203a,$f000,$fad7,$2330,
     $0018,$f000,$fb01,$203b,$f000,$fad0,$230a,$0018,$f000,$fafa,$2032,$f000,$fac9,$230f,$18fb,$2200,
     $701a,$e00c,$240f,$193b,$781b,$4a3a,$5cd3,$0018,$f000,$faea,$193b,$781a,$193b,$3201,$701a,$230f,
     $18fb,$781b,$2b45,$d9ed,$204e,$f000,$faaf,$2000,$f000,$fada,$204f,$f000,$faa9,$20f9,$f000,$fad4,
     $2000,$f000,$fad1,$f000,$fa85,$e04e,$1dfb,$781b,$2b01,$d14a,$202c,$f000,$fa99,$2026,$f000,$fac4,
     $f000,$fa78,$2032,$f000,$fa91,$230f,$18fb,$2200,$701a,$e00c,$240f,$193b,$781b,$4a1f,$5cd3,$0018,
     $f000,$fab2,$193b,$781a,$193b,$3201,$701a,$230f,$18fb,$781b,$2b45,$d9ed,$2037,$f000,$fa77,$2000,
     $f000,$faa2,$2000,$f000,$fa9f,$2000,$f000,$fa9c,$2000,$f000,$fa99,$2040,$f000,$fa96,$2000,$f000,
     $fa93,$2000,$f000,$fa90,$2022,$f000,$fa5f,$20c0,$f000,$fa8a,$2020,$f000,$fa59,$f000,$fa3b,$203c,
     $f000,$fa54,$2001,$f000,$fa7f,$46c0,$46bd,$b005,$bd90,$46c0,$db40,$1000,$db8c,$1000,$b580,$b082,
     $af00,$1cbb,$2210,$801a,$b580,$b082,$af00,$1cbb,$2210,$801a,$003b,$22fa,$801a,$2024,$f000,$fa36,
     $1dbb,$2200,$801a,$e016,$1d3b,$2200,$801a,$e007,$20ff,$f000,$fa59,$1d3b,$881a,$1d3b,$3201,$801a,
     $1d3a,$1cbb,$8812,$881b,$429a,$d3f1,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,$003b,$8812,$881b,$429a,
     $d3e2,$f000,$fa6f,$46c0,$46bd,$b002,$bd80,$b590,$b085,$af00,$6078,$230a,$18fb,$2210,$b590,$b085,
     $af00,$6078,$230a,$18fb,$2210,$801a,$2308,$18fb,$22fa,$801a,$2024,$f000,$f9f9,$230e,$18fb,$2200,
     $801a,$e029,$230c,$18fb,$2200,$801a,$e016,$240c,$193b,$881a,$230e,$18fb,$881b,$210a,$1879,$8809,
     $434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$fa0b,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,
     $230a,$18fb,$8812,$881b,$429a,$d3e0,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$2308,$18fb,
     $8812,$881b,$429a,$d3cd,$f000,$fa1c,$46c0,$46bd,$b005,$bd90,$b590,$b087,$af00,$6078,$230e,$18fb,
     $2210,$801a,$b590,$b085,$af00,$6078,$230a,$18fb,$2210,$801a,$2308,$18fb,$22fa,$801a,$2024,$f000,
     $f9a5,$230e,$18fb,$2200,$801a,$e029,$230c,$18fb,$2200,$801a,$e016,$240c,$193b,$881a,$230e,$18fb,
     $881b,$210a,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f9b7,$193b,$881a,$193b,
     $3201,$801a,$230c,$18fa,$230a,$18fb,$8812,$881b,$429a,$d3e0,$210e,$187b,$881a,$187b,$3201,$801a,
     $230e,$18fa,$2308,$18fb,$8812,$881b,$429a,$d3cd,$f000,$f9e0,$46c0,$46bd,$b005,$bd90,$b580,$af00,
     $2022,$f7ff,$fd22,$20c3,$f7ff,$fd47,$b590,$b087,$af00,$6078,$230e,$18fb,$2210,$801a,$230c,$18fb,
     $22fa,$801a,$2300,$60bb,$2024,$f000,$f94f,$2316,$18fb,$2200,$801a,$e02a,$2314,$18fb,$2200,$801a,
     $e017,$2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$60bb,$687a,$68bb,$18d3,
     $781b,$0018,$f000,$f960,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,
     $d3df,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cc,$2026,
     $f000,$f914,$2312,$18fb,$2200,$801a,$e02a,$2310,$18fb,$2200,$801a,$e017,$2410,$193b,$881a,$2312,
     $18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$60bb,$687a,$68bb,$18d3,$781b,$0018,$f000,$f925,$193b,
     $881a,$193b,$3201,$801a,$2310,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3df,$2112,$187b,$881a,$187b,
     $3201,$801a,$2312,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cc,$f000,$f936,$46c0,$46bd,$b007,$bd90,
     $b590,$b085,$af00,$6078,$230a,$18fb,$2210,$801a,$b580,$af00,$2022,$f000,$f8c9,$20c3,$f000,$f8f4,
     $2020,$f000,$f8c3,$2010,$f000,$f8c0,$2001,$f000,$f8eb,$2064,$f000,$f946,$46c0,$46bd,$bd80,$b580,
     $af00,$4b10,$681b,$b29b,$2101,$0018,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,
     $46c0,$46bd,$bd80,$0000,$43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,
     $60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,
     $2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f91a,$4b10,$681b,$b29b,$2101,
     $0018,$f000,$f913,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f90c,$4b0a,$681b,$b29b,$2100,$0018,$f000,
     $f905,$4b08,$681b,$b29b,$2101,$0018,$f000,$f92e,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,
     $4354,$2000,$435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,
     $4b10,$681b,$b29b,$2101,$0018,$f000,$f90f,$20c8,$f000,$f8c8,$4b0b,$681b,$b29b,$2100,$0018,$f000,
     $f905,$2002,$f000,$f8be,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8fb,$20c8,$f000,$f8b4,$46c0,$46bd,
     $bd80,$46c0,$4368,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$af00,$e002,$2064,$f000,$f8a2,
     $4b06,$681b,$b29b,$0018,$f000,$f900,$0003,$2b01,$d0f3,$46c0,$46c0,$46bd,$bd80,$46c0,$4354,$2000,
     $b580,$af00,$2022,$f7ff,$ff95,$20c7,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,
     $0018,$f000,$f8c3,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8bc,$1dfb,$781b,$0018,$f000,$f8ef,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f8b0,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,
     $f895,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f88e,$1dfb,$781b,$0018,$f000,$f8c1,$4b06,$681b,$b29b,
     $2101,$0018,$f000,$f882,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,$e002,$2064,
     $f7ff,$feff,$b580,$af00,$2022,$f7ff,$ff9f,$20c7,$f7ff,$ffca,$2020,$f7ff,$ff99,$f7ff,$ff7b,$46c0,
     $46bd,$bd80,$b580,$af00,$2022,$f7ff,$ff85,$200c,$f7ff,$ffaa,$b580,$af00,$2022,$f7ff,$ff87,$200c,
     $f7ff,$ffb2,$2020,$f7ff,$ff81,$f7ff,$ff63,$46c0,$46bd,$bd80,$b590,$b085,$af00,$0002,$1dfb,$701a,
     $f7ff,$ff4c,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f890,$46c0,$46bd,$b002,$bd80,$0000,$b580,
     $b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,
     $881b,$0018,$f000,$f88c,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,
     $f000,$f8a0,$e006,$1dbb,$881b,$2101,$0018,$f000,$f899,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,
     $881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89c,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,
     $f8a9,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b084,
     $af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a6,$46c0,$46bd,
     $b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,$af00,$6078,$6878,$239a,
     $2200,$2100,$f000,$f890,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,
     $b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,
     $000a,$619a,$687b,$2105,$0018,$f000,$f88b,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,
     $2202,$4013,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,
     $2b00,$d004,$68fb,$0018,$f000,$f8a8,$e003,$68fb,$0018,$f000,$f8b7,$46c0,$46bd,$b004,$bd80,$b580,
     $b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,
     $0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8ac,$e003,$68fb,$0018,$f000,$f8bb,$46c0,
     $46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b082,$af00,$6078,$23d0,$061b,
     $685a,$687b,$40da,$0013,$2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,
     $6078,$23d0,$061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,
     $68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,
     $6878,$239a,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f881,$687b,$009b,$4a12,
     $4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,
     $693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,
     $46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,
     $af00,$6078,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
