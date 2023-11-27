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
  POKE32 DATAADDRESS(C_FUNCTIONS)+1636,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1728,C_RAM+16
  POKE32 DATAADDRESS(C_FUNCTIONS)+1872,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1876,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1880,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1884,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1888,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1892,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+2140,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2240,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2328,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2332,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2420,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2424,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3896,C_RAM+16
  REM rodata vectors
  REM ram function vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+124,DATAADDRESS(C_FUNCTIONS)+1908
  POKE32 DATAADDRESS(C_FUNCTIONS)+256,DATAADDRESS(C_FUNCTIONS)+2828
  POKE32 DATAADDRESS(C_FUNCTIONS)+1640,DATAADDRESS(C_FUNCTIONS)+3036
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN9_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f881,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_GRAY4_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8b9,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8ed,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f919,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_DISPLAY_BASE
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f939,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_4GRAYDISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f975,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_DISPLAY_PARTIAL
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fae3,$b002,$bd00,$46c0
LABEL C_EPD_2IN9_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fb5b,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fb63,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fb6b,$b002,$bd00,$46c0

REM 4276 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fc06,$2064,$f000,$fc2f,$f000,$fc41,$2012,$f000,$fc5c,$f000,$fc3c,$2001,$f000,
     $fc57,$2027,$f000,$fc82,$2001,$f000,$fc7f,$2000,$f000,$fc7c,$2011,$f000,$fc4b,$2003,$f000,$fc76,
     $2328,$33ff,$227f,$2100,$2000,$f000,$fc9d,$2021,$f000,$fc3e,$2000,$f000,$fc69,$2080,$f000,$fc66,
     $2100,$2000,$f000,$fce0,$f000,$fc14,$4b03,$0018,$f000,$fd08,$46c0,$46bd,$bd80,$46c0,$05b0,$2000,
     $b580,$af00,$f7ff,$fe3c,$2064,$f7fb,$b580,$af00,$f000,$fbc0,$2064,$f000,$fbe9,$f000,$fbfb,$2012,
     $f000,$fc16,$f000,$fbf6,$2001,$f000,$fc11,$2027,$f000,$fc3c,$2001,$f000,$fc39,$2000,$f000,$fc36,
     $2011,$f000,$fc05,$2003,$f000,$fc30,$2328,$33ff,$2280,$2100,$2008,$f000,$fc57,$203c,$f000,$fbf8,
     $2004,$f000,$fc23,$2100,$2001,$f000,$fc9d,$f000,$fbd1,$4b03,$0018,$f000,$fcc5,$46c0,$46bd,$bd80,
     $0650,$2000,$b580,$b082,$af00,$2024,$f7ff,$fe24,$b580,$b082,$af00,$2024,$f000,$fbda,$1dbb,$2200,
     $801a,$e007,$20ff,$f000,$fc01,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881a,$2394,$015b,$429a,$d3f1,
     $2026,$f000,$fbc5,$1dbb,$2200,$801a,$e007,$20ff,$f000,$fbec,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,
     $881a,$2394,$015b,$429a,$d3f1,$f000,$fd1f,$46c0,$46bd,$b002,$bd80,$b590,$b085,$af00,$6078,$2024,
     $f7ff,$fdf0,$b590,$b085,$af00,$6078,$2024,$f000,$fb9f,$230e,$18fb,$2200,$801a,$e00d,$240e,$193b,
     $881b,$687a,$18d3,$781b,$0018,$f000,$fbbf,$193b,$881a,$193b,$3201,$801a,$230e,$18fb,$881a,$2394,
     $015b,$429a,$d3ea,$f000,$fcf1,$46c0,$46bd,$b005,$bd90,$b590,$b085,$af00,$6078,$2024,$f7ff,$fdc9,
     $b590,$b085,$af00,$6078,$2024,$f000,$fb71,$230e,$18fb,$2200,$801a,$e00d,$240e,$193b,$881b,$687a,
     $18d3,$781b,$0018,$f000,$fb91,$193b,$881a,$193b,$3201,$801a,$240e,$193b,$881a,$2394,$015b,$429a,
     $d3ea,$2026,$f000,$fb54,$193b,$2200,$801a,$e00d,$240e,$193b,$881b,$687a,$18d3,$781b,$0018,$f000,
     $fb75,$193b,$881a,$193b,$3201,$801a,$230e,$18fb,$881a,$2394,$015b,$429a,$d3ea,$f000,$fca7,$46c0,
     $46bd,$b005,$bd90,$b590,$b087,$af00,$6078,$2024,$f7ff,$fd86,$b590,$b087,$af00,$6078,$2024,$f000,
     $fb27,$2300,$617b,$e0a8,$230a,$18fb,$2200,$701a,$2300,$613b,$e094,$697b,$005a,$693b,$18d3,$687a,
     $18d2,$230b,$18fb,$7812,$701a,$2300,$60fb,$e080,$2009,$183b,$220b,$18ba,$7812,$213f,$438a,$701a,
     $183b,$781b,$2bc0,$d105,$220a,$18bb,$18ba,$7812,$701a,$e01e,$2309,$18fb,$781b,$2b00,$d107,$220a,
     $18bb,$18ba,$7812,$2101,$430a,$701a,$e011,$2309,$18fb,$781b,$2b80,$d107,$220a,$18bb,$18ba,$7812,
     $2101,$430a,$701a,$e004,$220a,$18bb,$18ba,$7812,$701a,$200a,$183a,$183b,$781b,$18db,$7013,$210b,
     $187b,$187a,$7812,$0092,$701a,$2409,$193b,$187a,$7812,$213f,$438a,$701a,$193b,$781b,$2bc0,$d104,
     $183b,$183a,$7812,$701a,$e01e,$2309,$18fb,$781b,$2b00,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,
     $701a,$e011,$2309,$18fb,$781b,$2b80,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e004,$220a,
     $18bb,$18ba,$7812,$701a,$693b,$2b01,$d102,$68fb,$2b01,$d005,$230a,$18fa,$18fb,$781b,$18db,$7013,
     $220b,$18bb,$18ba,$7812,$0092,$701a,$68fb,$3301,$60fb,$68fb,$2b01,$d800,$e77a,$693b,$3301,$613b,
     $693b,$2b01,$d800,$e766,$230a,$18fb,$781b,$0018,$f000,$faac,$697b,$3301,$617b,$697a,$2394,$015b,
     $429a,$d200,$e750,$2026,$f000,$fa72,$2300,$617b,$e0a8,$230a,$18fb,$2200,$701a,$2300,$613b,$e094,
     $697b,$005a,$693b,$18d3,$687a,$18d2,$230b,$18fb,$7812,$701a,$2300,$60fb,$e080,$2009,$183b,$220b,
     $18ba,$7812,$213f,$438a,$701a,$183b,$781b,$2bc0,$d105,$220a,$18bb,$18ba,$7812,$701a,$e01e,$2309,
     $18fb,$781b,$2b00,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e011,$2309,$18fb,$781b,$2b80,
     $d105,$220a,$18bb,$18ba,$7812,$701a,$e006,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$200a,$183a,
     $183b,$781b,$18db,$7013,$210b,$187b,$187a,$7812,$0092,$701a,$2409,$193b,$187a,$7812,$213f,$438a,
     $701a,$193b,$781b,$2bc0,$d104,$183b,$183a,$7812,$701a,$e01e,$2309,$18fb,$781b,$2b00,$d107,$220a,
     $18bb,$18ba,$7812,$2101,$430a,$701a,$e011,$2309,$18fb,$781b,$2b80,$d105,$220a,$18bb,$18ba,$7812,
     $701a,$e006,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$693b,$2b01,$d102,$68fb,$2b01,$d005,$230a,
     $18fa,$18fb,$781b,$18db,$7013,$220b,$18bb,$18ba,$7812,$0092,$701a,$68fb,$3301,$60fb,$68fb,$2b01,
     $d800,$e77a,$693b,$3301,$613b,$693b,$2b01,$d800,$e766,$230a,$18fb,$781b,$0018,$f000,$f9f7,$697b,
     $3301,$617b,$697a,$2394,$015b,$429a,$d200,$e750,$f000,$fb2c,$46c0,$46bd,$b007,$bd90,$0000,$b590,
     $b085,$af00,$6078,$4b3b,$681b,$b29b,$b590,$b085,$af00,$6078,$4b3b,$681b,$b29b,$2100,$0018,$f000,
     $fb7d,$2001,$f000,$f972,$4b36,$681b,$b29b,$2101,$0018,$f000,$fb73,$2002,$f000,$f968,$4b32,$0018,
     $f000,$fb8c,$2037,$f000,$f993,$2000,$f000,$f9be,$2000,$f000,$f9bb,$2000,$f000,$f9b8,$2000,$f000,
     $f9b5,$2000,$f000,$f9b2,$2040,$f000,$f9af,$2000,$f000,$f9ac,$2000,$f000,$f9a9,$2000,$f000,$f9a6,
     $2000,$f000,$f9a3,$203c,$f000,$f972,$2080,$f000,$f99d,$2022,$f000,$f96c,$20c0,$f000,$f997,$2020,
     $f000,$f966,$f000,$f946,$2328,$33ff,$227f,$2100,$2000,$f000,$f9b9,$2100,$2000,$f000,$fa05,$2024,
     $f000,$f956,$230e,$18fb,$2200,$801a,$e00d,$240e,$193b,$881b,$687a,$18d3,$781b,$0018,$f000,$f976,
     $193b,$881a,$193b,$3201,$801a,$230e,$18fb,$881a,$2394,$015b,$429a,$d3ea,$f000,$fb5c,$46c0,$46bd,
     $b005,$bd90,$4368,$2000,$0510,$2000,$b580,$af00,$2010,$f7ff,$fb93,$2001,$b580,$af00,$2010,$f000,
     $f927,$2001,$f000,$f952,$2064,$f000,$f8ef,$46c0,$46bd,$bd80,$b580,$af00,$4b10,$681b,$b29b,$2101,
     $0018,$f7fa,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,
     $43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,
     $687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,
     $601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$fb1a,$4b10,$681b,$b29b,$2101,$0018,$f000,$fb13,$4b0f,
     $681b,$b29b,$2101,$0018,$f000,$fb0c,$4b0a,$681b,$b29b,$2100,$0018,$f000,$fb05,$4b08,$681b,$b29b,
     $2101,$0018,$f000,$fa9a,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,
     $4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$6680,$0000,$0000,$0000,$0040,$0000,
     $6610,$0000,$0000,$0000,$0020,$0000,$6680,$0000,$0000,$0000,$0040,$0000,$6610,$0000,$0000,$0000,
     $0020,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0814,$0000,$0000,$0a01,$000a,$0a0a,$0100,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0814,$0100,$0000,$0001,$0000,$0000,$0100,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$4444,$4444,$4444,$0000,$2200,$4117,$3200,$0036,$b580,$af00,$4b10,$681b,$b29b,$2101,
     $0018,$f000,$fa2b,$200a,$f000,$f820,$4b0b,$681b,$b29b,$2100,$0018,$f000,$fa21,$2002,$f000,$f816,
     $4b06,$681b,$b29b,$2101,$0018,$f000,$fa17,$200a,$f000,$f80c,$46c0,$46bd,$bd80,$46c0,$4368,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$fa94,$46c0,$46bd,
     $b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$af00,$4b09,$681b,$b29b,$0018,
     $f000,$fa96,$1e03,$d003,$2032,$f7ff,$ffdf,$e7f3,$46c0,$2032,$f7ff,$ffda,$46c0,$46bd,$bd80,$46c0,
     $4354,$2000,$b590,$b085,$af00,$6078,$2032,$f7ff,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,
     $b29b,$2100,$0018,$f000,$f9c9,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f9c2,$1dfb,$781b,$0018,$f000,
     $fa7f,$4b06,$681b,$b29b,$2101,$0018,$f000,$f9b6,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,
     $0018,$f000,$f99b,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f994,$1dfb,$781b,$0018,$f000,$fa51,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f988,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,
     $4b09,$681b,$b29b,$0018,$b5b0,$b082,$af00,$0005,$000c,$0010,$0019,$1dbb,$1c2a,$801a,$1d3b,$1c22,
     $801a,$1cbb,$1c02,$801a,$003b,$1c0a,$801a,$2044,$f7ff,$ff8e,$1dbb,$881b,$08db,$b29b,$b2db,$0018,
     $f7ff,$ffb4,$1cbb,$881b,$08db,$b29b,$b2db,$0018,$f7ff,$ffac,$2045,$f7ff,$ff7b,$1d3b,$881b,$b2db,
     $0018,$f7ff,$ffa3,$1d3b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff9b,$003b,$881b,$b2db,$0018,$f7ff,
     $ff95,$003b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff8d,$46c0,$46bd,$b002,$bdb0,$b580,$b082,$af00,
     $0002,$1dbb,$801a,$1d3b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$204e,$f7ff,$ff48,
     $1dbb,$881b,$b2db,$0018,$f7ff,$ff70,$204f,$f7ff,$ff3f,$1d3b,$881b,$b2db,$0018,$f7ff,$ff67,$1d3b,
     $881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff5f,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$f7ff,$fe7c,
     $2064,$f7fb,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f914,$203f,$f7ff,$ff1b,$687b,$3399,$781b,
     $0018,$f7ff,$ff43,$2003,$f7ff,$ff12,$687b,$339a,$781b,$0018,$f7ff,$ff3a,$2004,$f7ff,$ff09,$687b,
     $339b,$781b,$0018,$f7ff,$ff31,$687b,$339c,$781b,$0018,$f7ff,$ff2b,$687b,$339d,$781b,$0018,$f7ff,
     $ff25,$202c,$f7ff,$fef4,$687b,$339e,$781b,$0018,$f7ff,$ff1c,$46c0,$46bd,$b002,$bd80,$b580,$af00,
     $2022,$f7ff,$ff32,$20c7,$f7ff,$ff57,$6000,$0000,$0000,$0000,$0000,$0000,$6020,$0010,$0000,$0000,
     $0000,$0000,$6028,$0014,$0000,$0000,$0000,$0000,$602a,$0015,$0000,$0000,$0000,$0000,$9000,$0000,
     $0000,$0000,$0000,$0000,$0200,$0500,$0014,$1e00,$001e,$0000,$0100,$0200,$0500,$0014,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$2224,$2222,
     $3223,$0000,$2200,$4117,$32ae,$1028,$b580,$af00,$2022,$f7ff,$fe8d,$20c7,$f7ff,$feb8,$2020,$f7ff,
     $fe87,$f7ff,$fe67,$46c0,$46bd,$bd80,$b580,$af00,$2022,$f7ff,$ff22,$200f,$f7ff,$ff47,$4000,$0000,
     $0000,$0000,$0000,$0000,$8080,$0000,$0000,$0000,$0000,$0000,$4040,$0000,$0000,$0000,$0000,$0000,
     $8000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$000a,$0000,$0000,$0102,
     $0000,$0000,$0000,$0001,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$2222,$2222,$2222,$0000,$2200,$4117,$32b0,$0036,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,
     $f000,$f8ca,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$b590,$b085,
     $af00,$6078,$2032,$f7ff,$fe03,$230f,$18fb,$2200,$701a,$e00d,$240f,$193b,$781b,$687a,$18d3,$781b,
     $0018,$f7ff,$fe23,$193b,$781a,$193b,$3201,$701a,$230f,$18fb,$781b,$2b98,$d9ec,$f7ff,$fdcb,$46c0,
     $46bd,$b005,$bd90,$b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$b580,$af00,$2022,$f7ff,$fdd9,$200f,
     $f7ff,$fe04,$2020,$f7ff,$fdd3,$f7ff,$fdb3,$46c0,$46bd,$bd80,$b5b0,$b082,$af00,$0005,$000c,$0010,
     $0019,$1dbb,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f890,
     $1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f8a4,$e006,$1dbb,
     $881b,$2101,$0018,$f000,$f89d,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,
     $f7ff,$ff09,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f8aa,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,
     $0018,$f000,$f8b1,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,
     $b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f876,
     $46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f88e,
     $e003,$68fb,$0018,$f000,$f89d,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,
     $b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,
     $000a,$619a,$687b,$2105,$0018,$f000,$f88f,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,
     $2202,$4013,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,
     $2b00,$d004,$68fb,$0018,$f000,$f8ac,$e003,$68fb,$0018,$f000,$f8bb,$46c0,$46bd,$b004,$bd80,$b580,
     $b082,$af00,$0002,$1dbb,$801a,$1d7b,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,
     $683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,
     $af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,
     $1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,
     $f859,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,
     $4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,
     $00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,
     $23d0,$061b,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,
     $b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
