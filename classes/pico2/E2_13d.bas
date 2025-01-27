rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_2in13d.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.13inch e-paper d
rem * | Info        :
rem *----------------
rem * |	This version:   V3.0
rem * | Date        :   2019-06-12
rem * | Info        :
rem * -----------------------------------------------------------------------------
rem * V3.0(2019-06-12):
rem * 1.Change:
rem *    lut_vcomDC[]  => EPD_2IN13D_lut_vcomDC[]
rem *    lut_ww[] => EPD_2IN13D_lut_ww[]
rem *    lut_bw[] => EPD_2IN13D_lut_bw[]
rem *    lut_wb[] => EPD_2IN13D_lut_wb[]
rem *    lut_bb[] => EPD_2IN13D_lut_bb[]
rem *    lut_vcom1[] => EPD_2IN13D_lut_vcom1[]
rem *    lut_ww1[] => EPD_2IN13D_lut_ww1[]
rem *    lut_bw1[] => EPD_2IN13D_lut_bw1[]
rem *    lut_wb1[] => EPD_2IN13D_lut_wb1[]
rem *    lut_bb1[] => EPD_2IN13D_lut_bb1[]
rem *    EPD_Reset() => EPD_2IN13D_Reset()
rem *    EPD_SendCommand() => EPD_2IN13D_SendCommand()
rem *    EPD_SendData() => EPD_2IN13D_SendData()
rem *    EPD_WaitUntilIdle() => EPD_2IN13D_ReadBusy()
rem *    EPD_SetFullReg() => EPD_2IN13D_SetFullReg()
rem *    EPD_SetPartReg() => EPD_2IN13D_SetPartReg()
rem *    EPD_TurnOnDisplay() => EPD_2IN13D_TurnOnDisplay()
rem *    EPD_Init() => EPD_2IN13D_Init()
rem *    EPD_Clear() => EPD_2IN13D_Clear()
rem *    EPD_Display() => EPD_2IN13D_Display()
rem *    EPD_Sleep() => EPD_2IN13D_Sleep()
rem * V2.0(2018-11-13):
rem * 1.Remove:ImageBuff[EPD_2IN13D_HEIGHT * EPD_2IN13D_WIDTH / 8]
rem * 2.Change:EPD_Display(UBYTE *Image)
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

method EPD_2IN13D_INIT
  goto C_EPD_2IN13D_INIT
method EPD_2IN13D_CLEAR
  goto C_EPD_2IN13D_CLEAR
method EPD_2IN13D_DISPLAY
  goto C_EPD_2IN13D_DISPLAY
method EPD_2IN13D_DISPLAYPART
  goto C_EPD_2IN13D_DISPLAYPART
method EPD_2IN13D_SLEEP
  goto C_EPD_2IN13D_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+808,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+952,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+956,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+960,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+964,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+968,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+972,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1056,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1140,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1144,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1228,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1232,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1316,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2420,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN13D_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f857,$b002,$bd00,$46c0
LABEL C_EPD_2IN13D_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f89b,$b002,$bd00,$46c0
LABEL C_EPD_2IN13D_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8d7,$b002,$bd00,$46c0
LABEL C_EPD_2IN13D_DISPLAYPART
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f91f,$b002,$bd00,$46c0
LABEL C_EPD_2IN13D_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f989,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f995,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f99f,$b002,$bd00,$46c0

REM 2672 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f9ea,$2001,$f000,$fa11,$2003,$f000,$fa3a,$2000,$f000,$fa37,$202b,$f000,$fa34,
     $202b,$f000,$fa31,$2003,$f000,$fa2e,$2006,$f000,$f9ff,$2017,$f000,$fa28,$2017,$f000,$fa25,$2017,
     $f000,$fa22,$2004,$f000,$f9f3,$f000,$fa49,$2000,$f000,$f9ee,$20bf,$f000,$fa17,$200e,$f000,$fa14,
     $2030,$f000,$f9e5,$203a,$f000,$fa0e,$2061,$f000,$f9df,$2068,$f000,$fa08,$2000,$f000,$fa05,$20d4,
     $f000,$fa02,$2082,$f000,$f9d3,$2028,$f000,$f9fc,$bf00,$bd80,$b580,$b084,$af00,$230d,$80fb,$23d4,
     $80bb,$2010,$b580,$b084,$af00,$230d,$80fb,$23d4,$80bb,$2010,$f000,$f9bc,$2300,$81fb,$e00f,$2300,
     $81bb,$e005,$2000,$f000,$f9df,$89bb,$3301,$81bb,$89ba,$88fb,$429a,$d3f5,$89fb,$3301,$81fb,$89fa,
     $88bb,$429a,$d3eb,$2013,$f000,$f9a2,$2300,$817b,$e00f,$2300,$813b,$e005,$20ff,$f000,$f9c5,$893b,
     $3301,$813b,$893a,$88fb,$429a,$d3f5,$897b,$3301,$817b,$897a,$88bb,$429a,$d3eb,$f000,$fa0b,$f000,
     $fa87,$bf00,$3710,$46bd,$bd80,$b580,$b086,$af00,$6078,$230d,$81fb,$23d4,$b580,$b086,$af00,$6078,
     $230d,$81fb,$23d4,$81bb,$2010,$f000,$f971,$2300,$82fb,$e00f,$2300,$82bb,$e005,$2000,$f000,$f994,
     $8abb,$3301,$82bb,$8aba,$89fb,$429a,$d3f5,$8afb,$3301,$82fb,$8afa,$89bb,$429a,$d3eb,$2013,$f000,
     $f957,$2300,$827b,$e019,$2300,$823b,$e00f,$8a3a,$8a7b,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,
     $781b,$4618,$f000,$f970,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3eb,$8a7b,$3301,$827b,$8a7a,$89bb,
     $429a,$d3e1,$f000,$f9b6,$f000,$fa32,$bf00,$3718,$46bd,$bd80,$b580,$b086,$af00,$6078,$2091,$f7ff,
     $fdac,$2090,$b580,$b086,$af00,$6078,$2091,$f000,$f91f,$2090,$f000,$f91c,$2000,$f000,$f945,$2067,
     $f000,$f942,$2000,$f000,$f93f,$2000,$f000,$f93c,$2000,$f000,$f939,$20d3,$f000,$f936,$2028,$f000,
     $f933,$230d,$81fb,$2010,$f000,$f902,$2300,$82fb,$e01b,$2300,$82bb,$e011,$8aba,$8afb,$89f9,$fb01,
     $f303,$4413,$461a,$687b,$4413,$781b,$43db,$b2db,$4618,$f000,$f919,$8abb,$3301,$82bb,$8aba,$89fb,
     $429a,$d3e9,$8afb,$3301,$82fb,$8afb,$2bd3,$d9e0,$2013,$f000,$f8dd,$2300,$827b,$e019,$2300,$823b,
     $e00f,$8a3a,$8a7b,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$f8f6,$8a3b,$3301,
     $823b,$8a3a,$89fb,$429a,$d3eb,$8a7b,$3301,$827b,$8a7b,$2bd3,$d9e2,$f000,$f9cf,$f000,$f9b9,$bf00,
     $3718,$46bd,$bd80,$b580,$af00,$2050,$f7ff,$fd3d,$20f7,$f7ff,$b580,$af00,$2050,$f000,$f8a9,$20f7,
     $f000,$f8d2,$2002,$f000,$f8a3,$2007,$f000,$f8a0,$20a5,$f000,$f8c9,$bf00,$bd80,$0000,$b580,$af00,
     $4b0f,$681b,$b29b,$2101,$b480,$af00,$b403,$4906,$600d,$604e,$608f,$ea5f,$0008,$60c8,$bc03,$bf00,
     $46bd,$f85d,$7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,
     $60b9,$607a,$603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,$683b,$6013,$4a1a,$68bb,$6013,$4b1a,
     $2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,$f000,$f9f4,$4b10,$681b,$b29b,$2101,
     $4618,$f000,$f9ed,$4b0f,$681b,$b29b,$2101,$4618,$f000,$f9e6,$4b0a,$681b,$b29b,$2100,$4618,$f000,
     $f9df,$4b08,$681b,$b29b,$2101,$4618,$f000,$fa02,$bf00,$3710,$46bd,$bd80,$43a8,$2000,$43a0,$2000,
     $4394,$2000,$439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,
     $4b0f,$681b,$b29b,$2101,$4618,$f000,$f9e3,$20c8,$f000,$f9fe,$4b0a,$681b,$b29b,$2100,$4618,$f000,
     $f9d9,$2002,$f000,$f9f4,$4b05,$681b,$b29b,$2101,$4618,$f000,$f9cf,$20c8,$f000,$f9ea,$bf00,$bd80,
     $43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,
     $2100,$4618,$f000,$f9b6,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f9af,$79fb,$4618,$f000,$f9db,$4b06,
     $681b,$b29b,$2101,$4618,$f000,$f9a4,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,
     $af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,$2101,$4618,$f000,$f98a,
     $4b0b,$681b,$b29b,$2100,$4618,$f000,$f983,$79fb,$4618,$f000,$f9af,$4b06,$681b,$b29b,$2101,$4618,
     $f000,$f978,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$b082,$af00,$2071,$f7ff,$ffae,
     $b580,$b082,$af00,$2071,$f7ff,$ffa2,$4b0d,$681b,$b29b,$4618,$f000,$f9a8,$4603,$71fb,$79fb,$f003,
     $0301,$2b00,$bf0c,$2301,$2300,$b2db,$71fb,$79fb,$2b00,$d1e8,$20c8,$f000,$f96b,$bf00,$3708,$46bd,
     $bd80,$bf00,$4394,$2000,$b580,$b082,$af00,$2050,$f7ff,$ff8a,$b580,$b082,$af00,$2050,$f7ff,$ff78,
     $20b7,$f7ff,$ffa1,$2020,$f7ff,$ff72,$2300,$607b,$e009,$4a2f,$687b,$4413,$781b,$4618,$f7ff,$ff94,
     $687b,$3301,$607b,$687b,$2b2b,$d9f2,$2021,$f7ff,$ff5f,$2300,$607b,$e009,$4a26,$687b,$4413,$781b,
     $4618,$f7ff,$ff81,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2022,$f7ff,$ff4c,$2300,$607b,$e009,$4a1e,
     $687b,$4413,$781b,$4618,$f7ff,$ff6e,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2023,$f7ff,$ff39,$2300,
     $607b,$e009,$4a15,$687b,$4413,$781b,$4618,$f7ff,$ff5b,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2024,
     $f7ff,$ff26,$2300,$607b,$e009,$4a0d,$687b,$4413,$781b,$4618,$f7ff,$ff48,$687b,$3301,$607b,$687b,
     $2b29,$d9f2,$bf00,$bf00,$3708,$46bd,$bd80,$bf00,$b21c,$1000,$b248,$1000,$b274,$1000,$b2a0,$1000,
     $b2cc,$1000,$b580,$b082,$af00,$2082,$f7ff,$ff12,$b580,$af00,$2012,$f7ff,$fefb,$2064,$f000,$f8d8,
     $f7ff,$ff4e,$bf00,$bd80,$b580,$af00,$f7ff,$fe66,$2001,$f7ff,$fe87,$2003,$b580,$b082,$af00,$2082,
     $f7ff,$fee6,$2000,$f7ff,$ff0f,$2050,$f7ff,$fee0,$20b7,$f7ff,$ff09,$2020,$f7ff,$feda,$2300,$607b,
     $e009,$4a2f,$687b,$4413,$781b,$4618,$f7ff,$fefc,$687b,$3301,$607b,$687b,$2b2b,$d9f2,$2021,$f7ff,
     $fec7,$2300,$607b,$e009,$4a26,$687b,$4413,$781b,$4618,$f7ff,$fee9,$687b,$3301,$607b,$687b,$2b29,
     $d9f2,$2022,$f7ff,$feb4,$2300,$607b,$e009,$4a1e,$687b,$4413,$781b,$4618,$f7ff,$fed6,$687b,$3301,
     $607b,$687b,$2b29,$d9f2,$2023,$f7ff,$fea1,$2300,$607b,$e009,$4a15,$687b,$4413,$781b,$4618,$f7ff,
     $fec3,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2024,$f7ff,$fe8e,$2300,$607b,$e009,$4a0d,$687b,$4413,
     $781b,$4618,$f7ff,$feb0,$687b,$3301,$607b,$687b,$2b29,$d9f2,$bf00,$bf00,$3708,$46bd,$bd80,$bf00,
     $b2f8,$1000,$b324,$1000,$b350,$1000,$b37c,$1000,$b3a8,$1000,$b580,$af00,$2012,$f7ff,$fe95,$2064,
     $b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$88fb,$4618,$f000,$f87e,$88bb,$2b00,$d002,$88bb,
     $2b00,$d105,$88fb,$2100,$4618,$f000,$f88f,$e005,$88fb,$2101,$4618,$f000,$f889,$bf00,$bf00,$3708,
     $46bd,$bd80,$b580,$b082,$af00,$6078,$6878,$f7ff,$ff51,$bf00,$b580,$b082,$af00,$4603,$460a,$80fb,
     $4613,$717b,$88fa,$797b,$2b00,$bf14,$2301,$2300,$b2db,$4619,$4610,$f000,$f885,$bf00,$3708,$46bd,
     $bd80,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$b580,$b082,$af00,$6078,$6878,$f000,$f88f,$bf00,
     $3708,$46bd,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$4603,$71fb,$79fb,
     $60fb,$f107,$010c,$2394,$2203,$2001,$f000,$f88c,$bf00,$3710,$46bd,$bd80,$b480,$b083,$af00,$6078,
     $f04f,$4350,$685a,$2101,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,$f895,$4603,$4618,$3708,
     $46bd,$bd80,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b082,$af00,$6078,$2100,$6878,
     $f000,$f814,$2100,$6878,$f000,$f82c,$2105,$6878,$f000,$f896,$bf00,$3708,$46bd,$bd80,$b40f,$b580,
     $b082,$af00,$4809,$f002,$f99e,$693b,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,
     $68fb,$7afa,$ec42,$3044,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,
     $80fb,$4613,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3040,
     $bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$b580,$b082,
     $af00,$6078,$6878,$239a,$2200,$2100,$f000,$f80c,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,
     $71fb,$79fb,$60fb,$f107,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,
     $687a,$68b9,$68f8,$47a0,$4603,$4618,$371c,$46bd,$bd90,$bf00,$4400,$2000,$b580,$b082,$af00,$6078,
     $6878,$239a,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,$2b00,$bf14,
     $2301,$2300,$b2db,$4618,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,
     $b580,$b08a,$af00,$6078,$460b,$70fb,$6878,$f000,$f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,
     $23c0,$617b,$69fb,$681a,$69bb,$405a,$697b,$4013,$69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,
     $6013,$bf00,$bf00,$490d,$78fa,$687b,$00db,$440b,$605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,
     $623b,$6a7b,$f503,$5340,$461a,$6a3b,$6013,$bf00,$bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,
     $b580,$b082,$af00,$6078,$2100,$6878,$b480,$b083,$af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,
     $b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
