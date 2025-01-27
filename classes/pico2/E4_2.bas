rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_4in2.c
rem * | Author      :   Waveshare team
rem * | Function    :   4.2inch e-paper
rem * | Info        :
rem *----------------
rem * |	This version:   V3.1
rem * | Date        :   2019-11-14
rem * | Info        :
rem * -----------------------------------------------------------------------------
rem * V3.1(2019-11-14):
rem * 1.Add 4 grayscale drive and display program
rem *	 Add EPD_4IN2_4Gray_lut_vcom[]
rem *	 Add EPD_4IN2_4Gray_lut_ww[]
rem *	 Add EPD_4IN2_4Gray_lut_bw[]
rem *	 Add EPD_4IN2_4Gray_lut_wb
rem *	 Add EPD_4IN2_4Gray_lut_bb
rem *	 Add EPD_4IN2_Partial_SetLut()
rem *	 Add EPD_4IN2_4Gray_lut()
rem *	 Add EPD_4IN2_Init_4Gray()
rem *	 Add EPD_4IN2_4GrayDisplay(....)
rem * 2.Add partial refresh display
rem * 	 Add EPD_4IN2_Partial_lut_vcom1[]
rem * 	 Add EPD_4IN2_Partial_lut_ww1[]
rem * 	 Add EPD_4IN2_Partial_lut_bw1[]
rem * 	 Add EPD_4IN2_Partial_lut_wb1[]
rem * 	 Add EPD_4IN2_Partial_lut_bb1[]
rem * 	 Add EPD_4IN2_Partial_SetLut()
rem * 	 Add EPD_4IN2_PartialDisplay(...)
rem * 	 Poor display, no display function by default
rem *
rem * V3.0(2019-06-13):
rem * 1.Change:
rem *    lut_vcomDC[]  => EPD_4IN2_lut_vcomDC[]
rem *    lut_ww[] => EPD_4IN2_lut_ww[]
rem *    lut_bw[] => EPD_4IN2_lut_bw[]
rem *    lut_wb[] => EPD_4IN2_lut_wb[]
rem *    lut_bb[] => EPD_4IN2_lut_bb[]
rem *    EPD_Reset() => EPD_4IN2_Reset()
rem *    EPD_SendCommand() => EPD_4IN2_SendCommand()
rem *    EPD_SendData() => EPD_4IN2_SendData()
rem *    EPD_WaitUntilIdle() => EPD_4IN2_ReadBusy()
rem *    EPD_SetFullReg() => EPD_4IN2_SetFullReg()
rem *    EPD_SetPartReg() => EPD_4IN2_SetPartReg()
rem *    EPD_TurnOnDisplay() => EPD_4IN2_TurnOnDisplay()
rem *    EPD_Init() => EPD_4IN2_Init()
rem *    EPD_Clear() => EPD_4IN2_Clear()
rem *    EPD_Display() => EPD_4IN2_Display()
rem *    EPD_Sleep() => EPD_4IN2_Sleep()
rem * 2.remove commands define:
rem *    #define PANEL_SETTING                               0x00
rem *    #define POWER_SETTING                               0x01
rem *    #define POWER_OFF                                   0x02
rem *    #define POWER_OFF_SEQUENCE_SETTING                  0x03
rem *    #define POWER_ON                                    0x04
rem *    #define POWER_ON_MEASURE                            0x05
rem *    #define BOOSTER_SOFT_START                          0x06
rem *    #define DEEP_SLEEP                                  0x07
rem *    #define DATA_START_TRANSMISSION_1                   0x10
rem *    #define DATA_STOP                                   0x11
rem *    #define DISPLAY_REFRESH                             0x12
rem *    #define DATA_START_TRANSMISSION_2                   0x13
rem *    #define VCOM_LUT                                    0x20
rem *    #define W2W_LUT                                     0x21
rem *    #define B2W_LUT                                     0x22
rem *    #define W2B_LUT                                     0x23
rem *    #define B2B_LUT                                     0x24
rem *    #define PLL_CONTROL                                 0x30
rem *    #define TEMPERATURE_SENSOR_CALIBRATION              0x40
rem *    #define TEMPERATURE_SENSOR_SELECTION                0x41
rem *    #define TEMPERATURE_SENSOR_WRITE                    0x42
rem *    #define TEMPERATURE_SENSOR_READ                     0x43
rem *    #define VCOM_AND_DATA_INTERVAL_SETTING              0x50
rem *    #define LOW_POWER_DETECTION                         0x51
rem *    #define TCON_SETTING                                0x60
rem *    #define RESOLUTION_SETTING                          0x61
rem *    #define GET_STATUS                                  0x71
rem *    #define AUTO_MEASURE_VCOM                           0x80
rem *    #define READ_VCOM_VALUE                             0x81
rem *    #define VCM_DC_SETTING                              0x82
rem *    #define PARTIAL_WINDOW                              0x90
rem *    #define PARTIAL_IN                                  0x91
rem *    #define PARTIAL_OUT                                 0x92
rem *    #define PROGRAM_MODE                                0xA0
rem *    #define ACTIVE_PROGRAM                              0xA1
rem *    #define READ_OTP_DATA                               0xA2
rem *    #define POWER_SAVING                                0xE3
rem * V2.0(2018-10-30):
rem * 1.Remove:ImageBuff[EPD_HEIGHT * EPD_WIDTH / 8]
rem * 2.Change:EPD_Display(UBYTE *Image)
rem *   Need to pass parameters: pointer to cached data
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

method EPD_4IN2_INIT_FAST
  goto C_EPD_4IN2_INIT_FAST
method EPD_4IN2_INIT_PARTIAL
  goto C_EPD_4IN2_INIT_PARTIAL
method EPD_4IN2_CLEAR
  goto C_EPD_4IN2_CLEAR
method EPD_4IN2_DISPLAY
  goto C_EPD_4IN2_DISPLAY
method EPD_4IN2_SLEEP
  goto C_EPD_4IN2_SLEEP
method EPD_4IN2_PARTIALDISPLAY
  goto C_EPD_4IN2_PARTIALDISPLAY
method EPD_4IN2_INIT_4GRAY
  goto C_EPD_4IN2_INIT_4GRAY
method EPD_4IN2_4GRAYDISPLAY
  goto C_EPD_4IN2_4GRAYDISPLAY

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
  DIM C_RAM(3784)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+1256,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2004,C_RAM+15012
  POKE32 DATAADDRESS(C_FUNCTIONS)+2148,C_RAM+15040
  POKE32 DATAADDRESS(C_FUNCTIONS)+2152,C_RAM+15056
  POKE32 DATAADDRESS(C_FUNCTIONS)+2156,C_RAM+15072
  POKE32 DATAADDRESS(C_FUNCTIONS)+2160,C_RAM+15088
  POKE32 DATAADDRESS(C_FUNCTIONS)+2164,C_RAM+15104
  POKE32 DATAADDRESS(C_FUNCTIONS)+2168,C_RAM+15120
  POKE32 DATAADDRESS(C_FUNCTIONS)+2312,C_RAM+15040
  POKE32 DATAADDRESS(C_FUNCTIONS)+2396,C_RAM+15056
  POKE32 DATAADDRESS(C_FUNCTIONS)+2400,C_RAM+15088
  POKE32 DATAADDRESS(C_FUNCTIONS)+2484,C_RAM+15056
  POKE32 DATAADDRESS(C_FUNCTIONS)+2488,C_RAM+15088
  POKE32 DATAADDRESS(C_FUNCTIONS)+2552,C_RAM+15072
  POKE32 DATAADDRESS(C_FUNCTIONS)+3896,C_RAM+15012
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_4IN2_INIT_FAST
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f881,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_INIT_PARTIAL
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8c9,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f911,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f953,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f99f,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_PARTIALDISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9ad,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_INIT_4GRAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$faa9,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_4GRAYDISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$faf3,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fbeb,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fbf5,$b002,$bd00,$46c0

REM 4148 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fc40,$2001,$f000,$fc85,$2003,$f000,$fcae,$2000,$f000,$fcab,$202b,$f000,$fca8,
     $202b,$f000,$fca5,$2006,$f000,$fc76,$2017,$f000,$fc9f,$2017,$f000,$fc9c,$2017,$f000,$fc99,$2004,
     $f000,$fc6a,$f000,$fcc0,$2000,$f000,$fc65,$20bf,$f000,$fc8e,$2030,$f000,$fc5f,$203c,$f000,$fc88,
     $2061,$f000,$fc59,$2001,$f000,$fc82,$2090,$f000,$fc7f,$2001,$f000,$fc7c,$202c,$f000,$fc79,$2082,
     $f000,$fc4a,$2012,$f000,$fc73,$2050,$f000,$fc44,$2097,$f000,$fc6d,$f000,$fcb7,$bf00,$bd80,$b580,
     $af00,$f7ff,$fd42,$2001,$f7ff,$fd81,$b580,$af00,$f000,$fbea,$2001,$f000,$fc2f,$2003,$f000,$fc58,
     $2000,$f000,$fc55,$202b,$f000,$fc52,$202b,$f000,$fc4f,$2006,$f000,$fc20,$2017,$f000,$fc49,$2017,
     $f000,$fc46,$2017,$f000,$fc43,$2004,$f000,$fc14,$f000,$fc6a,$2000,$f000,$fc0f,$20bf,$f000,$fc38,
     $2030,$f000,$fc09,$203c,$f000,$fc32,$2061,$f000,$fc03,$2001,$f000,$fc2c,$2090,$f000,$fc29,$2001,
     $f000,$fc26,$202c,$f000,$fc23,$2082,$f000,$fbf4,$2012,$f000,$fc1d,$2050,$f000,$fbee,$2007,$f000,
     $fc17,$f000,$fcd9,$bf00,$bd80,$b580,$af00,$f7ff,$fd91,$2001,$f7ff,$fdd0,$b580,$b084,$af00,$2332,
     $80fb,$f44f,$7396,$80bb,$2010,$f000,$fbd5,$2300,$81fb,$e00f,$2300,$81bb,$e005,$20ff,$f000,$fbf8,
     $89bb,$3301,$81bb,$89ba,$88fb,$429a,$d3f5,$89fb,$3301,$81fb,$89fa,$88bb,$429a,$d3eb,$2013,$f000,
     $fbbb,$2300,$817b,$e00f,$2300,$813b,$e005,$20ff,$f000,$fbde,$893b,$3301,$813b,$893a,$88fb,$429a,
     $d3f5,$897b,$3301,$817b,$897a,$88bb,$429a,$d3eb,$2012,$f000,$fba1,$2001,$f000,$fd06,$f000,$fd16,
     $bf00,$3710,$46bd,$bd80,$b580,$b086,$af00,$6078,$2332,$81fb,$f44f,$7396,$b580,$b086,$af00,$6078,
     $2332,$81fb,$f44f,$7396,$81bb,$2010,$f000,$fb84,$2300,$82fb,$e00f,$2300,$82bb,$e005,$2000,$f000,
     $fba7,$8abb,$3301,$82bb,$8aba,$89fb,$429a,$d3f5,$8afb,$3301,$82fb,$8afa,$89bb,$429a,$d3eb,$2013,
     $f000,$fb6a,$2300,$827b,$e019,$2300,$823b,$e00f,$8a3a,$8a7b,$89f9,$fb01,$f303,$4413,$461a,$687b,
     $4413,$781b,$4618,$f000,$fb83,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3eb,$8a7b,$3301,$827b,$8a7a,
     $89bb,$429a,$d3e1,$2012,$f000,$fb46,$200a,$f000,$fcab,$f000,$fcbb,$bf00,$3718,$46bd,$bd80,$0000,
     $b590,$b087,$af00,$4604,$4608,$4611,$b580,$af00,$2050,$f000,$fb31,$20f7,$f000,$fb5a,$2002,$f000,
     $fb2b,$f000,$fb81,$2007,$f000,$fb26,$20a5,$f000,$fb4f,$bf00,$bd80,$0000,$b580,$af00,$4b0f,$681b,
     $b29b,$2101,$b590,$b087,$af00,$4604,$4608,$4611,$461a,$4623,$80fb,$4603,$80bb,$460b,$807b,$4613,
     $803b,$2332,$81fb,$f44f,$7396,$81bb,$88fb,$f003,$0307,$b29b,$2b00,$d007,$88fb,$08db,$b29b,$3301,
     $b29b,$00db,$b29b,$e000,$88fb,$80fb,$887b,$f003,$0307,$b29b,$2b00,$d007,$887b,$08db,$b29b,$3301,
     $b29b,$00db,$b29b,$e000,$887b,$807b,$2091,$f000,$fae3,$2090,$f000,$fae0,$88fb,$0a1b,$b29b,$b2db,
     $4618,$f000,$fb05,$88fb,$b2db,$4618,$f000,$fb00,$887b,$0a1b,$b29b,$b2db,$4618,$f000,$faf9,$887b,
     $b2db,$3b01,$b2db,$4618,$f000,$faf2,$88bb,$0a1b,$b29b,$b2db,$4618,$f000,$faeb,$88bb,$b2db,$4618,
     $f000,$fae6,$883b,$0a1b,$b29b,$b2db,$4618,$f000,$fadf,$883b,$b2db,$3b01,$b2db,$4618,$f000,$fad8,
     $2028,$f000,$fad5,$2010,$f000,$faa6,$2300,$82fb,$e023,$2300,$82bb,$e013,$88ba,$8afb,$4413,$89fa,
     $fb02,$f303,$88fa,$08d2,$b292,$441a,$8abb,$4413,$4a3d,$5cd3,$4618,$f000,$fabb,$8abb,$3301,$82bb,
     $8aba,$8879,$88fb,$1acb,$2b00,$da00,$3307,$10db,$429a,$dbe1,$8afb,$3301,$82fb,$8afa,$8839,$88bb,
     $1acb,$429a,$dbd5,$2013,$f000,$fa76,$2300,$827b,$e047,$2300,$823b,$e037,$88ba,$8a7b,$4413,$89fa,
     $fb02,$f303,$88fa,$08d2,$b292,$441a,$8a3b,$4413,$461a,$6abb,$4413,$781b,$43db,$b2db,$4618,$f000,
     $fa87,$88ba,$8a7b,$4413,$89fa,$fb02,$f303,$88fa,$08d2,$b292,$441a,$8a3b,$4413,$461a,$6abb,$4413,
     $781a,$88b9,$8a7b,$440b,$89f9,$fb01,$f303,$88f9,$08c9,$b289,$4419,$8a3b,$440b,$43d2,$b2d1,$4a12,
     $54d1,$8a3b,$3301,$823b,$8a3a,$8879,$88fb,$1acb,$2b00,$da00,$3307,$10db,$429a,$dbbd,$8a7b,$3301,
     $827b,$8a7a,$8839,$88bb,$1acb,$429a,$dbb1,$2012,$f000,$fa22,$200a,$f000,$fb87,$f000,$fb97,$bf00,
     $371c,$46bd,$bd90,$bf00,$08fc,$2000,$b580,$b088,$af00,$6078,$2010,$f7ff,$b580,$af00,$f000,$f9c4,
     $2001,$f000,$fa09,$2003,$f000,$fa32,$2000,$f000,$fa2f,$202b,$f000,$fa2c,$202b,$f000,$fa29,$2013,
     $f000,$fa26,$2006,$f000,$f9f7,$2017,$f000,$fa20,$2017,$f000,$fa1d,$2017,$f000,$fa1a,$2004,$f000,
     $f9eb,$f000,$fa41,$2000,$f000,$f9e6,$203f,$f000,$fa0f,$2030,$f000,$f9e0,$203c,$f000,$fa09,$2061,
     $f000,$f9da,$2001,$f000,$fa03,$2090,$f000,$fa00,$2001,$f000,$f9fd,$202c,$f000,$f9fa,$2082,$f000,
     $f9cb,$2012,$f000,$f9f4,$2050,$f000,$f9c5,$2097,$f000,$f9ee,$bf00,$bd80,$b580,$b084,$af00,$2332,
     $80fb,$f44f,$7396,$80bb,$b580,$b088,$af00,$6078,$2010,$f000,$f9b1,$2300,$613b,$e06e,$2300,$61fb,
     $e065,$2300,$73bb,$2300,$61bb,$e056,$693b,$2232,$fb03,$f202,$69fb,$4413,$005a,$69bb,$4413,$687a,
     $4413,$781b,$73fb,$2300,$617b,$e040,$7bfb,$f023,$033f,$737b,$7b7b,$2bc0,$d104,$7bbb,$f043,$0301,
     $73bb,$e009,$7b7b,$2b00,$d006,$7b7b,$2b80,$d103,$7bbb,$f043,$0301,$73bb,$7bbb,$005b,$73bb,$7bfb,
     $009b,$73fb,$7bfb,$f023,$033f,$737b,$7b7b,$2bc0,$d104,$7bbb,$f043,$0301,$73bb,$e009,$7b7b,$2b00,
     $d006,$7b7b,$2b80,$d103,$7bbb,$f043,$0301,$73bb,$69bb,$2b01,$d102,$697b,$2b01,$d002,$7bbb,$005b,
     $73bb,$7bfb,$009b,$73fb,$697b,$3301,$617b,$697b,$2b01,$d9bb,$69bb,$3301,$61bb,$69bb,$2b01,$d9a5,
     $7bbb,$4618,$f000,$f974,$69fb,$3301,$61fb,$69fb,$2b31,$d996,$693b,$3301,$613b,$693b,$f5b3,$7f96,
     $d38c,$2013,$f000,$f938,$2300,$613b,$e06e,$2300,$61fb,$e065,$2300,$73bb,$2300,$61bb,$e056,$693b,
     $2232,$fb03,$f202,$69fb,$4413,$005a,$69bb,$4413,$687a,$4413,$781b,$73fb,$2300,$617b,$e040,$7bfb,
     $f023,$033f,$737b,$7b7b,$2bc0,$d104,$7bbb,$f043,$0301,$73bb,$e009,$7b7b,$2b00,$d006,$7b7b,$2b80,
     $d003,$7bbb,$f043,$0301,$73bb,$7bbb,$005b,$73bb,$7bfb,$009b,$73fb,$7bfb,$f023,$033f,$737b,$7b7b,
     $2bc0,$d104,$7bbb,$f043,$0301,$73bb,$e009,$7b7b,$2b00,$d006,$7b7b,$2b80,$d003,$7bbb,$f043,$0301,
     $73bb,$69bb,$2b01,$d102,$697b,$2b01,$d002,$7bbb,$005b,$73bb,$7bfb,$009b,$73fb,$697b,$3301,$617b,
     $697b,$2b01,$d9bb,$69bb,$3301,$61bb,$69bb,$2b01,$d9a5,$7bbb,$4618,$f000,$f8fb,$69fb,$3301,$61fb,
     $69fb,$2b31,$d996,$693b,$3301,$613b,$693b,$f5b3,$7f96,$d38c,$f000,$fa4e,$f000,$fa38,$bf00,$3720,
     $46bd,$bd80,$b580,$af00,$2050,$f7ff,$fa95,$20f7,$f7ff,$fab8,$b480,$af00,$b403,$4906,$600d,$604e,
     $608f,$ea5f,$0008,$60c8,$bc03,$bf00,$46bd,$f85d,$7b04,$4770,$4400,$2000,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4a1c,$687b,$6013,$4a1b,$68fb,$6013,$4a1b,
     $683b,$6013,$4a1a,$68bb,$6013,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$4618,
     $f000,$fa92,$4b10,$681b,$b29b,$2101,$4618,$f000,$fa8b,$4b0f,$681b,$b29b,$2101,$4618,$f000,$fa84,
     $4b0a,$681b,$b29b,$2100,$4618,$f000,$fa7d,$4b08,$681b,$b29b,$2101,$4618,$f000,$faa0,$bf00,$3710,
     $46bd,$bd80,$43a8,$2000,$43a0,$2000,$4394,$2000,$439c,$2000,$4398,$2000,$43a4,$2000,$b580,$af00,
     $2302,$2201,$2103,$2000,$b580,$af00,$4b1e,$681b,$b29b,$2100,$4618,$f000,$fa81,$200a,$f000,$f9a4,
     $4b19,$681b,$b29b,$2101,$4618,$f000,$fa77,$200a,$f000,$f99a,$4b14,$681b,$b29b,$2100,$4618,$f000,
     $fa6d,$200a,$f000,$f990,$4b0f,$681b,$b29b,$2101,$4618,$f000,$fa63,$200a,$f000,$f986,$4b0a,$681b,
     $b29b,$2100,$4618,$f000,$fa59,$200a,$f000,$f97c,$4b05,$681b,$b29b,$2101,$4618,$f000,$fa4f,$200a,
     $f000,$f972,$bf00,$bd80,$43a8,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,
     $71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$fa36,$4b0b,$681b,$b29b,$2100,$4618,$f000,$fa2f,$79fb,
     $4618,$f000,$fa49,$4b06,$681b,$b29b,$2101,$4618,$f000,$fa24,$bf00,$3708,$46bd,$bd80,$43a0,$2000,
     $439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,
     $2101,$4618,$f000,$fa0a,$4b0b,$681b,$b29b,$2100,$4618,$f000,$fa03,$79fb,$4618,$f000,$fa1d,$4b06,
     $681b,$b29b,$2101,$4618,$f000,$f9f8,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$af00,
     $2071,$f7ff,$ffaf,$e005,$b580,$af00,$2071,$f7ff,$ffa3,$e005,$2071,$f7ff,$ff9f,$2064,$f000,$f904,
     $4b05,$681b,$b29b,$4618,$f000,$fa10,$4603,$2b00,$d0f0,$bf00,$bf00,$bd80,$4394,$2000,$b580,$af00,
     $2012,$f7ff,$ff95,$2064,$b580,$b082,$af00,$2020,$f7ff,$ff82,$2300,$607b,$e009,$4a2f,$687b,$4413,
     $781b,$4618,$f7ff,$ffa4,$687b,$3301,$607b,$687b,$2b23,$d9f2,$2021,$f7ff,$ff6f,$2300,$607b,$e009,
     $4a26,$687b,$4413,$781b,$4618,$f7ff,$ff91,$687b,$3301,$607b,$687b,$2b23,$d9f2,$2022,$f7ff,$ff5c,
     $2300,$607b,$e009,$4a1e,$687b,$4413,$781b,$4618,$f7ff,$ff7e,$687b,$3301,$607b,$687b,$2b23,$d9f2,
     $2023,$f7ff,$ff49,$2300,$607b,$e009,$4a15,$687b,$4413,$781b,$4618,$f7ff,$ff6b,$687b,$3301,$607b,
     $687b,$2b23,$d9f2,$2024,$f7ff,$ff36,$2300,$607b,$e009,$4a0d,$687b,$4413,$781b,$4618,$f7ff,$ff58,
     $687b,$3301,$607b,$687b,$2b23,$d9f2,$bf00,$bf00,$3708,$46bd,$bd80,$bf00,$b994,$1000,$b9c0,$1000,
     $b9ec,$1000,$ba18,$1000,$ba44,$1000,$b580,$b082,$af00,$2020,$f7ff,$fea4,$b580,$b082,$af00,$2020,
     $f7ff,$ff0a,$2300,$607b,$e009,$4a2f,$687b,$4413,$781b,$4618,$f7ff,$ff2c,$687b,$3301,$607b,$687b,
     $2b2b,$d9f2,$2021,$f7ff,$fef7,$2300,$607b,$e009,$4a26,$687b,$4413,$781b,$4618,$f7ff,$ff19,$687b,
     $3301,$607b,$687b,$2b29,$d9f2,$2022,$f7ff,$fee4,$2300,$607b,$e009,$4a1e,$687b,$4413,$781b,$4618,
     $f7ff,$ff06,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2023,$f7ff,$fed1,$2300,$607b,$e009,$4a15,$687b,
     $4413,$781b,$4618,$f7ff,$fef3,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2024,$f7ff,$febe,$2300,$607b,
     $e009,$4a0d,$687b,$4413,$781b,$4618,$f7ff,$fee0,$687b,$3301,$607b,$687b,$2b29,$d9f2,$bf00,$bf00,
     $3708,$46bd,$bd80,$bf00,$ba70,$1000,$baac,$1000,$bad8,$1000,$bb14,$1000,$bb40,$1000,$b580,$b082,
     $af00,$2020,$f7ff,$ff16,$b580,$b082,$af00,$6078,$6878,$f000,$f921,$bf00,$3708,$46bd,$bd80,$0000,
     $b580,$b084,$af00,$60f8,$60b9,$607a,$b580,$af00,$2012,$f7ff,$fe81,$2064,$f7ff,$ffe6,$f7ff,$fed4,
     $bf00,$bd80,$b580,$b082,$af00,$2020,$f7ff,$ff88,$2300,$607b,$b580,$b082,$af00,$2020,$f7ff,$fe6c,
     $2300,$607b,$e009,$4a38,$687b,$4413,$781b,$4618,$f7ff,$fe8e,$687b,$3301,$607b,$687b,$2b29,$d9f2,
     $2021,$f7ff,$fe59,$2300,$607b,$e009,$4a2f,$687b,$4413,$781b,$4618,$f7ff,$fe7b,$687b,$3301,$607b,
     $687b,$2b29,$d9f2,$2022,$f7ff,$fe46,$2300,$607b,$e009,$4a27,$687b,$4413,$781b,$4618,$f7ff,$fe68,
     $687b,$3301,$607b,$687b,$2b29,$d9f2,$2023,$f7ff,$fe33,$2300,$607b,$e009,$4a1e,$687b,$4413,$781b,
     $4618,$f7ff,$fe55,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2024,$f7ff,$fe20,$2300,$607b,$e009,$4a16,
     $687b,$4413,$781b,$4618,$f7ff,$fe42,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2025,$f7ff,$fe0d,$2300,
     $607b,$e009,$4a09,$687b,$4413,$781b,$4618,$f7ff,$fe2f,$687b,$3301,$607b,$687b,$2b29,$d9f2,$bf00,
     $bf00,$3708,$46bd,$bd80,$bb6c,$1000,$bb98,$1000,$bbc4,$1000,$bbf0,$1000,$bc1c,$1000,$b580,$af00,
     $f7ff,$fde0,$2001,$f7ff,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$88fb,$4618,$f000,$f882,
     $88bb,$2b00,$d002,$88bb,$2b00,$d105,$88fb,$2100,$4618,$f000,$f893,$e005,$88fb,$2101,$4618,$f000,
     $f88d,$bf00,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$6078,$6878,$f7ff,$ff51,$bf00,$b580,$b082,
     $af00,$4603,$460a,$80fb,$4613,$717b,$88fa,$797b,$2b00,$bf14,$2301,$2300,$b2db,$4619,$4610,$f000,
     $f889,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$b580,$b084,$af00,$4603,
     $71fb,$79fb,$60fb,$f107,$010c,$2394,$2203,$2001,$f000,$f88c,$bf00,$3710,$46bd,$bd80,$b480,$b083,
     $af00,$6078,$f04f,$4350,$685a,$2101,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$f000,$f895,$4603,
     $4618,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$b580,$b082,$af00,$6078,
     $6878,$239a,$2200,$2100,$f000,$f860,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,$71fb,$79fb,
     $60fb,$f107,$b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,$2100,$6878,$f000,$f82c,$2105,$6878,
     $f000,$f880,$bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,$4809,$f002,$f99e,$693b,$b480,$b085,
     $af00,$6078,$460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3044,$bf00,$bf00,$3714,$46bd,
     $f85d,$7b04,$4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$b480,$b085,$af00,$6078,$460b,$70fb,
     $687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b480,
     $b085,$af00,$6078,$460b,$70fb,$687b,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,
     $697c,$683b,$687a,$68b9,$68f8,$47a0,$4603,$4618,$371c,$46bd,$bd90,$bf00,$4400,$2000,$b580,$b082,
     $af00,$6078,$6878,$239a,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,
     $2b00,$bf14,$2301,$2300,$b2db,$4618,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,
     $70fb,$687b,$b580,$b08a,$af00,$6078,$460b,$70fb,$6878,$f000,$f83d,$687b,$009a,$4b18,$4413,$61fb,
     $2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$405a,$697b,$4013,$69fa,$613a,$60fb,$693b,$f503,$5380,
     $461a,$68fb,$6013,$bf00,$bf00,$490d,$78fa,$687b,$00db,$440b,$605a,$687b,$009a,$4b08,$4413,$627b,
     $f44f,$7380,$623b,$6a7b,$f503,$5340,$461a,$6a3b,$6013,$bf00,$bf00,$3728,$46bd,$bd80,$8004,$4003,
     $8000,$4002,$b580,$b082,$af00,$6078,$2100,$6878,$b480,$b083,$af00,$6078,$bf00,$370c,$46bd,$f85d,
     $7b04,$4770,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
