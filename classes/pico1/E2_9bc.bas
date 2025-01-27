rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_2in9bc.c
rem * | Author      :   Waveshare team
rem * | Function    :   2.9inch e-paper b&c
rem * | Info        :
rem *----------------
rem * |	This version:   V3.0
rem * | Date        :   2019-06-12
rem * | Info        :
rem * -----------------------------------------------------------------------------
rem * V3.0(2019-06-12):
rem * 1.Change:
rem *    EPD_Reset() => EPD_2IN9BC_Reset()
rem *    EPD_SendCommand() => EPD_2IN9BC_SendCommand()
rem *    EPD_SendData() => EPD_2IN9BC_SendData()
rem *    EPD_WaitUntilIdle() => EPD_2IN9BC_ReadBusy()
rem *    EPD_Init() => EPD_2IN9BC_Init()
rem *    EPD_Clear() => EPD_2IN9BC_Clear()
rem *    EPD_Display() => EPD_2IN9BC_Display()
rem *    EPD_Sleep() => EPD_2IN9BC_Sleep()
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
rem *    #define PLL_CONTROL                                 0x30
rem *    #define TEMPERATURE_SENSOR_COMMAND                  0x40
rem *    #define TEMPERATURE_SENSOR_CALIBRATION              0x41
rem *    #define TEMPERATURE_SENSOR_WRITE                    0x42
rem *    #define TEMPERATURE_SENSOR_READ                     0x43
rem *    #define VCOM_AND_DATA_INTERVAL_SETTING              0x50
rem *    #define LOW_POWER_DETECTION                         0x51
rem *    #define TCON_SETTING                                0x60
rem *    #define TCON_RESOLUTION                             0x61
rem *    #define GET_STATUS                                  0x71
rem *    #define AUTO_MEASURE_VCOM                           0x80
rem *    #define VCOM_VALUE                                  0x81
rem *    #define VCM_DC_SETTING_REGISTER                     0x82
rem *    #define PARTIAL_WINDOW                              0x90
rem *    #define PARTIAL_IN                                  0x91
rem *    #define PARTIAL_OUT                                 0x92
rem *    #define PROGRAM_MODE                                0xA0
rem *    #define ACTIVE_PROGRAM                              0xA1
rem *    #define READ_OTP_DATA                               0xA2
rem *    #define POWER_SAVING                                0xE3
rem * -----------------------------------------------------------------------------
rem * V2.0(2018-11-06):
rem * 1.Remove:ImageBuff[EPD_HEIGHT * EPD_WIDTH / 8]
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

method EPD_2IN9BC_INIT
  goto C_EPD_2IN9BC_INIT
method EPD_2IN9BC_CLEAR
  goto C_EPD_2IN9BC_CLEAR
method EPD_2IN9BC_DISPLAY
  goto C_EPD_2IN9BC_DISPLAY
method EPD_2IN9BC_SLEEP
  goto C_EPD_2IN9BC_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+724,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+868,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+872,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+876,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+880,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+884,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+888,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+976,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+1064,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1068,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1156,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1160,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1212,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1824,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN9BC_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f849,$b002,$bd00,$46c0
LABEL C_EPD_2IN9BC_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f879,$b002,$bd00,$46c0
LABEL C_EPD_2IN9BC_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8d9,$b002,$bd00,$46c0
LABEL C_EPD_2IN9BC_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f963,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f96d,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f975,$b002,$bd00,$46c0

REM 2208 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f9c0,$2006,$f000,$f9e9,$2017,$f000,$fa14,$2017,$f000,$fa11,$2017,$f000,$fa0e,
     $2004,$f000,$f9dd,$f000,$fa37,$2000,$f000,$f9d8,$208f,$f000,$fa03,$2050,$f000,$f9d2,$2077,$f000,
     $f9fd,$2061,$f000,$f9cc,$2080,$f000,$f9f7,$2001,$f000,$f9f4,$2028,$f000,$f9f1,$2082,$f000,$f9c0,
     $200a,$f000,$f9eb,$46c0,$46bd,$bd80,$b580,$b084,$af00,$1dbb,$2210,$801a,$1d3b,$2294,$b580,$b084,
     $af00,$1dbb,$2210,$801a,$1d3b,$2294,$0052,$801a,$2010,$f000,$f9a5,$230e,$18fb,$2200,$801a,$e01a,
     $230c,$18fb,$2200,$801a,$e008,$20ff,$f000,$f9c6,$210c,$187b,$881a,$187b,$3201,$801a,$230c,$18fa,
     $1dbb,$8812,$881b,$429a,$d3ef,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$1d3b,$8812,$881b,
     $429a,$d3dd,$2013,$f000,$f97b,$230a,$18fb,$2200,$801a,$e01a,$2308,$18fb,$2200,$801a,$e008,$20ff,
     $f000,$f99c,$2108,$187b,$881a,$187b,$3201,$801a,$2308,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210a,
     $187b,$881a,$187b,$3201,$801a,$230a,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$2012,$f000,$f951,$f000,
     $f9ab,$46c0,$46bd,$b004,$bd80,$b590,$b087,$af00,$6078,$6039,$230e,$18fb,$b590,$b087,$af00,$6078,
     $6039,$230e,$18fb,$2210,$801a,$230c,$18fb,$2294,$0052,$801a,$2010,$f000,$f933,$2316,$18fb,$2200,
     $801a,$e029,$2314,$18fb,$2200,$801a,$e016,$2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,
     $434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f945,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,
     $230e,$18fb,$8812,$881b,$429a,$d3e0,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,
     $8812,$881b,$429a,$d3cd,$2092,$f000,$f8f9,$2013,$f000,$f8f6,$2312,$18fb,$2200,$801a,$e029,$2310,
     $18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,
     $683b,$189b,$781b,$0018,$f000,$f908,$193b,$881a,$193b,$3201,$801a,$2310,$18fa,$230e,$18fb,$8812,
     $881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,$801a,$2312,$18fa,$230c,$18fb,$8812,$881b,$429a,
     $d3cd,$2092,$f000,$f8bc,$2012,$f000,$f8b9,$f000,$f913,$46c0,$46bd,$b007,$bd90,$b580,$af00,$2002,
     $f7ff,$fe69,$f7ff,$feb7,$b580,$af00,$2002,$f000,$f8a7,$f000,$f901,$2007,$f000,$f8a2,$20a5,$f000,
     $f8cd,$46c0,$46bd,$bd80,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f7fa,$b580,$af00,$b403,$4905,
     $600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43b8,$2000,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,
     $683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,
     $f000,$f8d4,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8cd,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f8c6,
     $4b0a,$681b,$b29b,$2100,$0018,$f000,$f8bf,$4b08,$681b,$b29b,$2101,$0018,$f000,$f8e8,$46c0,$46bd,
     $b004,$bd80,$4380,$2000,$4378,$2000,$436c,$2000,$4374,$2000,$4370,$2000,$437c,$2000,$b580,$af00,
     $2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8c9,$20c8,$f000,$f8e6,
     $4b0b,$681b,$b29b,$2100,$0018,$f000,$f8bf,$2002,$f000,$f8dc,$4b06,$681b,$b29b,$2101,$0018,$f000,
     $f8b5,$20c8,$f000,$f8d2,$46c0,$46bd,$bd80,$46c0,$4380,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f899,$4b0c,$681b,$b29b,
     $2100,$0018,$f000,$f892,$1dfb,$781b,$0018,$f000,$f8c1,$4b06,$681b,$b29b,$2101,$0018,$f000,$f886,
     $46c0,$46bd,$b002,$bd80,$4378,$2000,$4374,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,$f86b,$4b0c,$681b,$b29b,$2100,$0018,
     $f000,$f864,$1dfb,$781b,$0018,$f000,$f893,$4b06,$681b,$b29b,$2101,$0018,$f000,$f858,$46c0,$46bd,
     $b002,$bd80,$4378,$2000,$4374,$2000,$b580,$af00,$e002,$2064,$f7fa,$fd5d,$b580,$af00,$e002,$2064,
     $f000,$f864,$4b05,$681b,$b29b,$0018,$f000,$f88e,$1e03,$d0f4,$46c0,$46c0,$46bd,$bd80,$436c,$2000,
     $b580,$af00,$f7ff,$ff72,$2006,$f7ff,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,
     $881b,$0018,$f000,$f88a,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,
     $f000,$f89a,$e006,$1dbb,$881b,$2101,$0018,$f000,$f893,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$6078,$687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,
     $881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f896,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1dbb,$881b,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f8a6,$46c0,$46bd,
     $b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$b580,$b084,$af00,$0002,$1dfb,$701a,
     $1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a0,$46c0,$46bd,$b004,$bd80,$b580,$b082,
     $af00,$6078,$23d0,$061b,$685b,$2101,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,
     $f8a7,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b082,
     $af00,$6078,$687b,$2100,$0018,$f000,$f815,$687b,$2100,$0018,$f000,$f834,$687b,$2105,$0018,$f000,
     $f8a1,$46c0,$46bd,$b002,$bd80,$0000,$b40f,$b580,$b082,$af00,$4b0b,$0018,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8c0,
     $e003,$68fb,$0018,$f000,$f8cf,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,
     $68fb,$0018,$f000,$f8c4,$e003,$68fb,$0018,$f000,$f8d3,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,
     $6078,$23d0,$061b,$687a,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f80c,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b590,$b087,$af00,$60f8,$60b9,$607a,
     $603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,
     $43b8,$2000,$b580,$b082,$af00,$6078,$6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685b,$2101,
     $687a,$4091,$000a,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,
     $061b,$687a,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f883,$687b,$009b,$4a13,
     $4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,
     $693b,$2280,$0152,$4694,$4463,$68fa,$601a,$46c0,$46c0,$4907,$1cfb,$781a,$687b,$00db,$18cb,$3304,
     $601a,$46c0,$46bd,$b008,$bd80,$46c0,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$687b,$2100,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,
     $46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a

REM 0 bytes
LABEL C_RODATA
