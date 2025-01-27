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
  POKE32 DATAADDRESS(C_FUNCTIONS)+1092,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1236,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1240,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1244,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1248,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1252,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1256,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1340,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1392,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1476,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1480,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1564,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1568,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2264,C_RAM+0
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
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f947,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f967,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V2_DISPLAYPART
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f993,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V2_DISPLAYPARTBASEIMAGE
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9bf,$b002,$bd00,$46c0
LABEL C_EPD_2IN13_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa13,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa23,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa2d,$b002,$bd00,$46c0

REM 2456 bytes
LABEL C_FUNCTIONS
EXEC $b580,$b084,$af00,$4603,$71fb,$f000,$fa75,$79fb,$2b00,$f040,$8091,$f000,$fa99,$2012,$f000,$fab0,
     $f000,$fa94,$2074,$f000,$faab,$2054,$f000,$fad4,$207e,$f000,$faa5,$203b,$f000,$face,$2001,$f000,
     $fa9f,$20f9,$f000,$fac8,$2000,$f000,$fac5,$2000,$f000,$fac2,$2011,$f000,$fa93,$2001,$f000,$fabc,
     $2044,$f000,$fa8d,$2000,$f000,$fab6,$200f,$f000,$fab3,$2045,$f000,$fa84,$20f9,$f000,$faad,$2000,
     $f000,$faaa,$2000,$f000,$faa7,$2000,$f000,$faa4,$203c,$f000,$fa75,$2003,$f000,$fa9e,$202c,$f000,
     $fa6f,$2055,$f000,$fa98,$2003,$f000,$fa69,$2315,$4618,$f000,$fa91,$2004,$f000,$fa62,$2341,$4618,
     $f000,$fa8a,$23a8,$4618,$f000,$fa86,$2332,$4618,$f000,$fa82,$203a,$f000,$fa53,$2330,$4618,$f000,
     $fa7b,$203b,$f000,$fa4c,$230a,$4618,$f000,$fa74,$2032,$f000,$fa45,$2300,$73fb,$e008,$7bfb,$4a33,
     $5cd3,$4618,$f000,$fa68,$7bfb,$3301,$73fb,$7bfb,$2b45,$d9f3,$204e,$f000,$fa33,$2000,$f000,$fa5c,
     $204f,$f000,$fa2d,$20f9,$f000,$fa56,$2000,$f000,$fa53,$f000,$fa0b,$e045,$79fb,$2b01,$d142,$202c,
     $f000,$fa1e,$2026,$f000,$fa47,$f000,$f9ff,$2032,$f000,$fa16,$2300,$73fb,$e008,$7bfb,$4a1c,$5cd3,
     $4618,$f000,$fa39,$7bfb,$3301,$73fb,$7bfb,$2b45,$d9f3,$2037,$f000,$fa04,$2000,$f000,$fa2d,$2000,
     $f000,$fa2a,$2000,$f000,$fa27,$2000,$f000,$fa24,$2040,$f000,$fa21,$2000,$f000,$fa1e,$2000,$f000,
     $fa1b,$2022,$f000,$f9ec,$20c0,$f000,$fa15,$2020,$f000,$f9e6,$f000,$f9ca,$203c,$f000,$f9e1,$2001,
     $f000,$fa0a,$bf00,$3710,$46bd,$bd80,$b184,$1000,$b1d0,$1000,$b580,$b082,$af00,$2310,$807b,$23fa,
     $b580,$b082,$af00,$2310,$807b,$23fa,$803b,$2024,$f000,$f9c6,$2300,$80fb,$e00f,$2300,$80bb,$e005,
     $20ff,$f000,$f9e9,$88bb,$3301,$80bb,$88ba,$887b,$429a,$d3f5,$88fb,$3301,$80fb,$88fa,$883b,$429a,
     $d3eb,$f000,$fa05,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$6078,$2310,$817b,$23fa,$b580,$b084,
     $af00,$6078,$2310,$817b,$23fa,$813b,$2024,$f000,$f997,$2300,$81fb,$e019,$2300,$81bb,$e00f,$89ba,
     $89fb,$8979,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$f9b0,$89bb,$3301,$81bb,$89ba,
     $897b,$429a,$d3eb,$89fb,$3301,$81fb,$89fa,$893b,$429a,$d3e1,$f000,$f9cc,$bf00,$3710,$46bd,$bd80,
     $b580,$b086,$af00,$6078,$2310,$81fb,$23fa,$81bb,$b580,$b084,$af00,$6078,$2310,$817b,$23fa,$813b,
     $2024,$f000,$f95d,$2300,$81fb,$e019,$2300,$81bb,$e00f,$89ba,$89fb,$8979,$fb01,$f303,$4413,$461a,
     $687b,$4413,$781b,$4618,$f000,$f976,$89bb,$3301,$81bb,$89ba,$897b,$429a,$d3eb,$89fb,$3301,$81fb,
     $89fa,$893b,$429a,$d3e1,$f000,$f9a8,$bf00,$3710,$46bd,$bd80,$b580,$af00,$2022,$f7ff,$fdae,$20c3,
     $f7ff,$fdd1,$b580,$b086,$af00,$6078,$2310,$81fb,$23fa,$81bb,$2300,$60bb,$2024,$f000,$f921,$2300,
     $82fb,$e01a,$2300,$82bb,$e010,$8aba,$8afb,$89f9,$fb01,$f303,$4413,$60bb,$687a,$68bb,$4413,$781b,
     $4618,$f000,$f939,$8abb,$3301,$82bb,$8aba,$89fb,$429a,$d3ea,$8afb,$3301,$82fb,$8afa,$89bb,$429a,
     $d3e0,$2026,$f000,$f8fc,$2300,$827b,$e01a,$2300,$823b,$e010,$8a3a,$8a7b,$89f9,$fb01,$f303,$4413,
     $60bb,$687a,$68bb,$4413,$781b,$4618,$f000,$f914,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3ea,$8a7b,
     $3301,$827b,$8a7a,$89bb,$429a,$d3e0,$f000,$f930,$bf00,$3718,$46bd,$bd80,$b580,$b084,$af00,$6078,
     $2310,$817b,$23fa,$813b,$b580,$af00,$2022,$f000,$f8c7,$20c3,$f000,$f8f0,$2020,$f000,$f8c1,$2010,
     $f000,$f8be,$2001,$f000,$f8e7,$2064,$f000,$f93c,$bf00,$bd80,$0000,$b580,$af00,$4b0f,$681b,$b29b,
     $2101,$4618,$b480,$af00,$b403,$4906,$600d,$604e,$608f,$ea5f,$0008,$60c8,$bc03,$bf00,$46bd,$f85d,
     $7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,
     $603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,$683b,$6013,$4a1a,$68bb,$6013,$4b1a,$2212,$601a,
     $4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,$f000,$f90c,$4b10,$681b,$b29b,$2101,$4618,$f000,
     $f905,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f8fe,$4b0a,$681b,$b29b,$2100,$4618,$f000,$f8f7,$4b08,
     $681b,$b29b,$2101,$4618,$f000,$f91a,$bf00,$3710,$46bd,$bd80,$43a8,$2000,$43a0,$2000,$4394,$2000,
     $439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b0f,$681b,
     $b29b,$2101,$4618,$f000,$f8fb,$20c8,$f000,$f8bc,$4b0a,$681b,$b29b,$2100,$4618,$f000,$f8f1,$2002,
     $f000,$f8b2,$4b05,$681b,$b29b,$2101,$4618,$f000,$f8e7,$20c8,$f000,$f8a8,$bf00,$bd80,$43a8,$2000,
     $b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$af00,$e002,$2064,$f000,$f898,$4b05,$681b,$b29b,$4618,
     $f000,$f8ec,$4603,$2b01,$d0f3,$bf00,$bf00,$bd80,$4394,$2000,$b580,$af00,$2022,$f7ff,$ff9b,$20c7,
     $b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f8b4,$4b0b,$681b,$b29b,$2100,
     $4618,$f000,$f8ad,$79fb,$4618,$f000,$f8dd,$4b06,$681b,$b29b,$2101,$4618,$f000,$f8a2,$bf00,$3708,
     $46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,
     $71fb,$4b0e,$681b,$b29b,$2101,$4618,$f000,$f888,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f881,$79fb,
     $4618,$f000,$f8b1,$4b06,$681b,$b29b,$2101,$4618,$f000,$f876,$bf00,$3708,$46bd,$bd80,$43a0,$2000,
     $439c,$2000,$b580,$af00,$e002,$2064,$f7ff,$ff06,$b580,$af00,$2022,$f7ff,$ffa3,$20c7,$f7ff,$ffcc,
     $2020,$f7ff,$ff9d,$f7ff,$ff81,$bf00,$bd80,$b580,$af00,$2022,$f7ff,$ff8c,$200c,$f7ff,$b580,$af00,
     $2022,$f7ff,$ff8d,$200c,$f7ff,$ffb6,$2020,$f7ff,$ff87,$f7ff,$ff6b,$bf00,$bd80,$b580,$b084,$af00,
     $4603,$71fb,$f7ff,$ff57,$b580,$b082,$af00,$6078,$6878,$f000,$f883,$bf00,$3708,$46bd,$bd80,$0000,
     $b580,$b084,$af00,$60f8,$60b9,$607a,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$88fb,$4618,
     $f000,$f882,$88bb,$2b00,$d002,$88bb,$2b00,$d105,$88fb,$2100,$4618,$f000,$f893,$e005,$88fb,$2101,
     $4618,$f000,$f88d,$bf00,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$6078,$6878,$f7ff,$ff51,$bf00,
     $b580,$b082,$af00,$4603,$460a,$80fb,$4613,$717b,$88fa,$797b,$2b00,$bf14,$2301,$2300,$b2db,$4619,
     $4610,$f000,$f889,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$b580,$b082,
     $af00,$4603,$80fb,$88fb,$4618,$f000,$f891,$4603,$4618,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,
     $460a,$80fb,$4613,$80bb,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$010c,$2394,$2203,$2001,
     $f000,$f894,$bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$b580,$b082,
     $af00,$6078,$6878,$239a,$2200,$2100,$f000,$f87e,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,
     $71fb,$79fb,$60fb,$f107,$b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,$2100,$6878,$f000,$f82c,
     $2105,$6878,$f000,$f880,$bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,$4809,$f002,$f99e,$693b,
     $b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3044,$bf00,$bf00,
     $3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$b480,$b085,$af00,$6078,
     $460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,
     $4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,
     $687b,$fa01,$f303,$4013,$2b00,$bf14,$2301,$2300,$b2db,$4618,$370c,$46bd,$f85d,$7b04,$4770,$b480,
     $b085,$af00,$6078,$460b,$70fb,$687b,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,
     $697c,$683b,$687a,$68b9,$68f8,$47a0,$4603,$4618,$371c,$46bd,$bd90,$bf00,$4400,$2000,$b580,$b082,
     $af00,$6078,$6878,$239a,$b580,$b08a,$af00,$6078,$460b,$70fb,$6878,$f000,$f83d,$687b,$009a,$4b18,
     $4413,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$405a,$697b,$4013,$69fa,$613a,$60fb,$693b,
     $f503,$5380,$461a,$68fb,$6013,$bf00,$bf00,$490d,$78fa,$687b,$00db,$440b,$605a,$687b,$009a,$4b08,
     $4413,$627b,$f44f,$7380,$623b,$6a7b,$f503,$5340,$461a,$6a3b,$6013,$bf00,$bf00,$3728,$46bd,$bd80,
     $8004,$4003,$8000,$4002,$b580,$b082,$af00,$6078,$2100,$6878,$b480,$b083,$af00,$6078,$bf00,$370c,
     $46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
