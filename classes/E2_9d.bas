rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_2in9d.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.9inch e-paper d
rem * | Info        :
rem *----------------
rem * |	This version:   V2.0
rem * | Date        :   2019-06-12
rem * | Info        :
rem * -----------------------------------------------------------------------------
rem * V3.0(2019-06-12):
rem * 1.Change:
rem *    lut_vcomDC[]  => EPD_2IN9D_lut_vcomDC[]
rem *    lut_ww[] => EPD_2IN9D_lut_ww[]
rem *    lut_bw[] => EPD_2IN9D_lut_bw[]
rem *    lut_wb[] => EPD_2IN9D_lut_wb[]
rem *    lut_bb[] => EPD_2IN9D_lut_bb[]
rem *    lut_vcom1[] => EPD_2IN9D_lut_vcom1[]
rem *    lut_ww1[] => EPD_2IN9D_lut_ww1[]
rem *    lut_bw1[] => EPD_2IN9D_lut_bw1[]
rem *    lut_wb1[] => EPD_2IN9D_lut_wb1[]
rem *    lut_bb1[] => EPD_2IN9D_lut_bb1[]
rem *    EPD_Reset() => EPD_2IN9D_Reset()
rem *    EPD_SendCommand() => EPD_2IN9D_SendCommand()
rem *    EPD_SendData() => EPD_2IN9D_SendData()
rem *    EPD_WaitUntilIdle() => EPD_2IN9D_ReadBusy()
rem *    EPD_SetFullReg() => EPD_2IN9D_SetFullReg()
rem *    EPD_SetPartReg() => EPD_2IN9D_SetPartReg()
rem *    EPD_TurnOnDisplay() => EPD_2IN9D_TurnOnDisplay()
rem *    EPD_Init() => EPD_2IN9D_Init()
rem *    EPD_Clear() => EPD_2IN9D_Clear()
rem *    EPD_Display() => EPD_2IN9D_Display()
rem *    EPD_Sleep() => EPD_2IN9D_Sleep()
rem *
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

method EPD_2IN9D_INIT
  goto C_EPD_2IN9D_INIT
method EPD_2IN9D_CLEAR
  goto C_EPD_2IN9D_CLEAR
method EPD_2IN9D_DISPLAY
  goto C_EPD_2IN9D_DISPLAY
method EPD_2IN9D_DISPLAYPART
  goto C_EPD_2IN9D_DISPLAYPART
method EPD_2IN9D_SLEEP
  goto C_EPD_2IN9D_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+948,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1092,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1096,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1100,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1104,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1108,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1112,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1200,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1288,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1292,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1380,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1384,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1472,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2648,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN9D_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f857,$b002,$bd00,$46c0
LABEL C_EPD_2IN9D_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f89b,$b002,$bd00,$46c0
LABEL C_EPD_2IN9D_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8fb,$b002,$bd00,$46c0
LABEL C_EPD_2IN9D_DISPLAYPART
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f96f,$b002,$bd00,$46c0
LABEL C_EPD_2IN9D_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9cd,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9dd,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9e5,$b002,$bd00,$46c0

REM 3028 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fa30,$2001,$f000,$fa59,$2003,$f000,$fa84,$2000,$f000,$fa81,$202b,$f000,$fa7e,
     $202b,$f000,$fa7b,$2003,$f000,$fa78,$2006,$f000,$fa47,$2017,$f000,$fa72,$2017,$f000,$fa6f,$2017,
     $f000,$fa6c,$2004,$f000,$fa3b,$f000,$fa95,$2000,$f000,$fa36,$20bf,$f000,$fa61,$200e,$f000,$fa5e,
     $2030,$f000,$fa2d,$203a,$f000,$fa58,$2061,$f000,$fa27,$2080,$f000,$fa52,$2001,$f000,$fa4f,$2028,
     $f000,$fa4c,$2082,$f000,$fa1b,$2028,$f000,$fa46,$46c0,$46bd,$bd80,$b580,$b084,$af00,$1dbb,$2210,
     $801a,$1d3b,$b580,$b084,$af00,$1dbb,$2210,$801a,$1d3b,$2294,$0052,$801a,$2010,$f000,$fa01,$230e,
     $18fb,$2200,$801a,$e01a,$230c,$18fb,$2200,$801a,$e008,$2000,$f000,$fa22,$210c,$187b,$881a,$187b,
     $3201,$801a,$230c,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210e,$187b,$881a,$187b,$3201,$801a,$230e,
     $18fa,$1d3b,$8812,$881b,$429a,$d3dd,$2013,$f000,$f9d7,$230a,$18fb,$2200,$801a,$e01a,$2308,$18fb,
     $2200,$801a,$e008,$20ff,$f000,$f9f8,$2108,$187b,$881a,$187b,$3201,$801a,$2308,$18fa,$1dbb,$8812,
     $881b,$429a,$d3ef,$210a,$187b,$881a,$187b,$3201,$801a,$230a,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,
     $f000,$fa36,$f000,$fab2,$46c0,$46bd,$b004,$bd80,$b590,$b087,$af00,$6078,$230e,$18fb,$2210,$801a,
     $b590,$b087,$af00,$6078,$230e,$18fb,$2210,$801a,$230c,$18fb,$2294,$0052,$801a,$2010,$f000,$f990,
     $2316,$18fb,$2200,$801a,$e01b,$2314,$18fb,$2200,$801a,$e008,$2000,$f000,$f9b1,$2114,$187b,$881a,
     $187b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3ee,$2116,$187b,$881a,$187b,$3201,
     $801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3db,$2013,$f000,$f964,$2312,$18fb,$2200,$801a,
     $e029,$2310,$18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,$18fb,$881b,$210e,$1879,$8809,$434b,
     $18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f976,$193b,$881a,$193b,$3201,$801a,$2310,$18fa,$230e,
     $18fb,$8812,$881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,$801a,$2312,$18fa,$230c,$18fb,$8812,
     $881b,$429a,$d3cd,$f000,$f9b3,$f000,$fa2f,$46c0,$46bd,$b007,$bd90,$b590,$b085,$af00,$6078,$f7ff,
     $fe43,$2091,$b590,$b085,$af00,$6078,$f000,$fa32,$2091,$f000,$f915,$2090,$f000,$f912,$2000,$f000,
     $f93d,$207f,$f000,$f93a,$2000,$f000,$f937,$2000,$f000,$f934,$2001,$f000,$f931,$2027,$f000,$f92e,
     $2028,$f000,$f92b,$230a,$18fb,$2210,$801a,$2013,$f000,$f8f6,$230e,$18fb,$2200,$801a,$e029,$230c,
     $18fb,$2200,$801a,$e016,$240c,$193b,$881a,$230e,$18fb,$881b,$210a,$1879,$8809,$434b,$18d3,$001a,
     $687b,$189b,$781b,$0018,$f000,$f908,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,
     $881b,$429a,$d3e0,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fb,$881a,$2394,$005b,$429a,$d3ce,
     $f000,$f9c4,$46c0,$46bd,$b005,$bd90,$b580,$af00,$2050,$f7ff,$fcf2,$20f7,$f7ff,$fd17,$b580,$af00,
     $2050,$f000,$f8ad,$20f7,$f000,$f8d8,$2002,$f000,$f8a7,$f000,$f901,$2007,$f000,$f8a2,$20a5,$f000,
     $f8cd,$46c0,$46bd,$bd80,$0000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$b580,$af00,$b403,$4905,
     $600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43ec,$2000,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,
     $683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,
     $f000,$f9fc,$4b10,$681b,$b29b,$2101,$0018,$f000,$f9f5,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f9ee,
     $4b0a,$681b,$b29b,$2100,$0018,$f000,$f9e7,$4b08,$681b,$b29b,$2101,$0018,$f000,$fa10,$46c0,$46bd,
     $b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,
     $2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f9f1,$20c8,$f000,$fa0e,
     $4b0b,$681b,$b29b,$2100,$0018,$f000,$f9e7,$2002,$f000,$fa04,$4b06,$681b,$b29b,$2101,$0018,$f000,
     $f9dd,$20c8,$f000,$f9fa,$46c0,$46bd,$bd80,$46c0,$4368,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f9c1,$4b0c,$681b,$b29b,
     $2100,$0018,$f000,$f9ba,$1dfb,$781b,$0018,$f000,$f9e9,$4b06,$681b,$b29b,$2101,$0018,$f000,$f9ae,
     $46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,$f993,$4b0c,$681b,$b29b,$2100,$0018,
     $f000,$f98c,$1dfb,$781b,$0018,$f000,$f9bb,$4b06,$681b,$b29b,$2101,$0018,$f000,$f980,$46c0,$46bd,
     $b002,$bd80,$4360,$2000,$435c,$2000,$b590,$b083,$af00,$2071,$f7ff,$ffaa,$b590,$b083,$af00,$2071,
     $f7ff,$ff9e,$4b0e,$681b,$b29b,$1dfc,$0018,$f000,$f9b5,$0003,$7023,$1dfb,$781b,$2201,$4013,$425a,
     $4153,$b2da,$1dfb,$701a,$1dfb,$781b,$2b00,$d1e6,$20c8,$f000,$f973,$46c0,$46bd,$b003,$bd90,$46c0,
     $4354,$2000,$b580,$b082,$af00,$2050,$f7ff,$ff84,$b580,$b082,$af00,$2050,$f7ff,$ff72,$20b7,$f7ff,
     $ff9d,$2020,$f7ff,$ff6c,$2300,$607b,$e009,$4a2f,$687b,$18d3,$781b,$0018,$f7ff,$ff90,$687b,$3301,
     $607b,$687b,$2b2b,$d9f2,$2021,$f7ff,$ff59,$2300,$607b,$e009,$4a26,$687b,$18d3,$781b,$0018,$f7ff,
     $ff7d,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2022,$f7ff,$ff46,$2300,$607b,$e009,$4a1e,$687b,$18d3,
     $781b,$0018,$f7ff,$ff6a,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2023,$f7ff,$ff33,$2300,$607b,$e009,
     $4a15,$687b,$18d3,$781b,$0018,$f7ff,$ff57,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2024,$f7ff,$ff20,
     $2300,$607b,$e009,$4a0d,$687b,$18d3,$781b,$0018,$f7ff,$ff44,$687b,$3301,$607b,$687b,$2b29,$d9f2,
     $46c0,$46c0,$46bd,$b002,$bd80,$46c0,$e2c8,$1000,$e2f4,$1000,$e320,$1000,$e34c,$1000,$e378,$1000,
     $b580,$b082,$af00,$2082,$f7ff,$ff0c,$b580,$af00,$2012,$f7ff,$fef5,$200a,$f000,$f8e0,$f7ff,$ff4c,
     $46c0,$46bd,$bd80,$b580,$af00,$f7ff,$fe5d,$2001,$f7ff,$fe80,$b580,$b082,$af00,$2082,$f7ff,$fee0,
     $2000,$f7ff,$ff0b,$2050,$f7ff,$feda,$20b7,$f7ff,$ff05,$2020,$f7ff,$fed4,$2300,$607b,$e009,$4a2f,
     $687b,$18d3,$781b,$0018,$f7ff,$fef8,$687b,$3301,$607b,$687b,$2b2b,$d9f2,$2021,$f7ff,$fec1,$2300,
     $607b,$e009,$4a26,$687b,$18d3,$781b,$0018,$f7ff,$fee5,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2022,
     $f7ff,$feae,$2300,$607b,$e009,$4a1e,$687b,$18d3,$781b,$0018,$f7ff,$fed2,$687b,$3301,$607b,$687b,
     $2b29,$d9f2,$2023,$f7ff,$fe9b,$2300,$607b,$e009,$4a15,$687b,$18d3,$781b,$0018,$f7ff,$febf,$687b,
     $3301,$607b,$687b,$2b29,$d9f2,$2024,$f7ff,$fe88,$2300,$607b,$e009,$4a0d,$687b,$18d3,$781b,$0018,
     $f7ff,$feac,$687b,$3301,$607b,$687b,$2b29,$d9f2,$46c0,$46c0,$46bd,$b002,$bd80,$46c0,$e3a4,$1000,
     $e3d0,$1000,$e3fc,$1000,$e428,$1000,$e454,$1000,$b580,$af00,$2012,$f7ff,$fe8f,$200a,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f88a,$1d3b,$881b,$2b00,$d003,
     $1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f89e,$e006,$1dbb,$881b,$2101,$0018,$f000,
     $f897,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,
     $f000,$f89a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b082,
     $af00,$6078,$687b,$0018,$f000,$f8aa,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,
     $607a,$603b,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,
     $f000,$f8a4,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8ab,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,
     $629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,$f8a1,$46c0,$46bd,$b002,
     $bd80,$0000,$b580,$af00,$4b04,$681b,$2202,$4013,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8be,$e003,$68fb,$0018,$f000,
     $f8cd,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8c2,
     $e003,$68fb,$0018,$f000,$f8d1,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,
     $b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f80c,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $af00,$0002,$1dfb,$701a,$1dfb,$781b,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,
     $683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,
     $af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,
     $1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b088,
     $af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f881,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,
     $61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,
     $68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,
     $c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,
     $701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,
     $b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
