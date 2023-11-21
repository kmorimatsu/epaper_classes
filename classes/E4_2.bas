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
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(3784)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+1580,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2620,C_RAM+15012
  POKE32 DATAADDRESS(C_FUNCTIONS)+2764,C_RAM+15040
  POKE32 DATAADDRESS(C_FUNCTIONS)+2768,C_RAM+15056
  POKE32 DATAADDRESS(C_FUNCTIONS)+2772,C_RAM+15072
  POKE32 DATAADDRESS(C_FUNCTIONS)+2776,C_RAM+15088
  POKE32 DATAADDRESS(C_FUNCTIONS)+2780,C_RAM+15104
  POKE32 DATAADDRESS(C_FUNCTIONS)+2784,C_RAM+15120
  POKE32 DATAADDRESS(C_FUNCTIONS)+2932,C_RAM+15040
  POKE32 DATAADDRESS(C_FUNCTIONS)+3020,C_RAM+15056
  POKE32 DATAADDRESS(C_FUNCTIONS)+3024,C_RAM+15088
  POKE32 DATAADDRESS(C_FUNCTIONS)+3112,C_RAM+15056
  POKE32 DATAADDRESS(C_FUNCTIONS)+3116,C_RAM+15088
  POKE32 DATAADDRESS(C_FUNCTIONS)+3180,C_RAM+15072
  POKE32 DATAADDRESS(C_FUNCTIONS)+4596,C_RAM+15012
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_4IN2_INIT_FAST
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f84a,$bd00,$46c0
LABEL C_EPD_4IN2_INIT_PARTIAL
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f89a,$bd00,$46c0
LABEL C_EPD_4IN2_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8ea,$bd00,$46c0
LABEL C_EPD_4IN2_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f954,$bd00,$46c0
LABEL C_EPD_4IN2_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f9d2,$bd00,$46c0
LABEL C_EPD_4IN2_PARTIALDISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f9e8,$bd00,$46c0
LABEL C_EPD_4IN2_INIT_4GRAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fb38,$bd00,$46c0
LABEL C_EPD_4IN2_4GRAYDISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fb88,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd1a,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd28,$bd00,$46c0

REM 4976 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fd74,$2001,$f000,$fdbb,$2003,$f000,$fde6,$2000,$f000,$fde3,$202b,$f000,$fde0,
     $202b,$f000,$fddd,$2006,$f000,$fdac,$2017,$f000,$fdd7,$2017,$f000,$fdd4,$2017,$f000,$fdd1,$2004,
     $f000,$fda0,$f000,$fdfa,$2000,$f000,$fd9b,$20bf,$f000,$fdc6,$2030,$f000,$fd95,$203c,$f000,$fdc0,
     $2061,$f000,$fd8f,$2001,$f000,$fdba,$2090,$f000,$fdb7,$2001,$f000,$fdb4,$202c,$f000,$fdb1,$2082,
     $f000,$fd80,$2012,$f000,$fdab,$2050,$f000,$fd7a,$2097,$f000,$fda5,$f000,$fdf1,$46c0,$46bd,$bd80,
     $b580,$af00,$f7ff,$fd38,$2001,$f7ff,$fd79,$2003,$b580,$af00,$f000,$fd1c,$2001,$f000,$fd63,$2003,
     $f000,$fd8e,$2000,$f000,$fd8b,$202b,$f000,$fd88,$202b,$f000,$fd85,$2006,$f000,$fd54,$2017,$f000,
     $fd7f,$2017,$f000,$fd7c,$2017,$f000,$fd79,$2004,$f000,$fd48,$f000,$fda2,$2000,$f000,$fd43,$20bf,
     $f000,$fd6e,$2030,$f000,$fd3d,$203c,$f000,$fd68,$2061,$f000,$fd37,$2001,$f000,$fd62,$2090,$f000,
     $fd5f,$2001,$f000,$fd5c,$202c,$f000,$fd59,$2082,$f000,$fd28,$2012,$f000,$fd53,$2050,$f000,$fd22,
     $2007,$f000,$fd4d,$f000,$fe11,$46c0,$46bd,$bd80,$b580,$af00,$f7ff,$fd88,$2001,$f7ff,$fdc9,$2003,
     $b580,$b084,$af00,$1dbb,$2232,$801a,$1d3b,$2296,$0052,$801a,$2010,$f000,$fd05,$230e,$18fb,$2200,
     $801a,$e01a,$230c,$18fb,$2200,$801a,$e008,$20ff,$f000,$fd26,$210c,$187b,$881a,$187b,$3201,$801a,
     $230c,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$1d3b,
     $8812,$881b,$429a,$d3dd,$2013,$f000,$fcdb,$230a,$18fb,$2200,$801a,$e01a,$2308,$18fb,$2200,$801a,
     $e008,$20ff,$f000,$fcfc,$2108,$187b,$881a,$187b,$3201,$801a,$2308,$18fa,$1dbb,$8812,$881b,$429a,
     $d3ef,$210a,$187b,$881a,$187b,$3201,$801a,$230a,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$2012,$f000,
     $fcb1,$2001,$f000,$fe1a,$f000,$fe2c,$46c0,$46bd,$b004,$bd80,$b590,$b087,$af00,$6078,$230e,$18fb,
     $2232,$801a,$b590,$b087,$af00,$6078,$230e,$18fb,$2232,$801a,$230c,$18fb,$2296,$0052,$801a,$2010,
     $f000,$fc90,$2316,$18fb,$2200,$801a,$e01b,$2314,$18fb,$2200,$801a,$e008,$2000,$f000,$fcb1,$2114,
     $187b,$881a,$187b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3ee,$2116,$187b,$881a,
     $187b,$3201,$801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3db,$2013,$f000,$fc64,$2312,$18fb,
     $2200,$801a,$e029,$2310,$18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,$18fb,$881b,$210e,$1879,
     $8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$fc76,$193b,$881a,$193b,$3201,$801a,$2310,
     $18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,$801a,$2312,$18fa,$230c,
     $18fb,$8812,$881b,$429a,$d3cd,$2012,$f000,$fc2a,$200a,$f000,$fd93,$f000,$fda5,$46c0,$46bd,$b007,
     $bd90,$b5f0,$b087,$af00,$0005,$000c,$0010,$0019,$b580,$af00,$2050,$f000,$fc15,$20f7,$f000,$fc40,
     $2002,$f000,$fc0f,$f000,$fc69,$2007,$f000,$fc0a,$20a5,$f000,$fc35,$46c0,$46bd,$bd80,$b580,$af00,
     $4b10,$681b,$b29b,$2101,$0018,$f7f8,$b5f0,$b087,$af00,$0005,$000c,$0010,$0019,$1dbb,$1c2a,$801a,
     $1d3b,$1c22,$801a,$1cbb,$1c02,$801a,$003b,$1c0a,$801a,$230e,$18fb,$2232,$801a,$230c,$18fb,$2296,
     $0052,$801a,$1dbb,$881b,$2207,$4013,$b29b,$2b00,$d008,$1dbb,$881b,$08db,$b29b,$3301,$b29b,$00db,
     $b29b,$e001,$1dbb,$881b,$1dba,$8013,$1cbb,$881b,$2207,$4013,$b29b,$2b00,$d008,$1cbb,$881b,$08db,
     $b29b,$3301,$b29b,$00db,$b29b,$e001,$1cbb,$881b,$1cba,$8013,$2091,$f000,$fbb5,$2090,$f000,$fbb2,
     $1dbb,$881b,$0a1b,$b29b,$b2db,$0018,$f000,$fbd8,$1dbb,$881b,$b2db,$0018,$f000,$fbd2,$1cbb,$881b,
     $0a1b,$b29b,$b2db,$0018,$f000,$fbca,$1cbb,$881b,$b2db,$3b01,$b2db,$0018,$f000,$fbc2,$1d3b,$881b,
     $0a1b,$b29b,$b2db,$0018,$f000,$fbba,$1d3b,$881b,$b2db,$0018,$f000,$fbb4,$003b,$881b,$0a1b,$b29b,
     $b2db,$0018,$f000,$fbac,$003b,$881b,$b2db,$3b01,$b2db,$0018,$f000,$fba4,$2028,$f000,$fba1,$2010,
     $f000,$fb70,$2316,$18fb,$2200,$801a,$e034,$2314,$18fb,$2200,$801a,$e01c,$1d3b,$881a,$2316,$18fb,
     $881b,$18d3,$220e,$18ba,$8812,$4353,$1dba,$8812,$08d2,$b292,$189a,$2414,$193b,$881b,$18d3,$4a53,
     $5cd3,$0018,$f000,$fb7c,$193b,$881a,$193b,$3201,$801a,$2314,$18fb,$881a,$1cbb,$8819,$1dbb,$881b,
     $1acb,$d500,$3307,$10db,$429a,$dbd5,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fb,$881a,$003b,
     $8819,$1d3b,$881b,$1acb,$429a,$dbc0,$2013,$f000,$fb29,$2312,$18fb,$2200,$801a,$e060,$2310,$18fb,
     $2200,$801a,$e048,$1d3b,$881a,$2512,$197b,$881b,$18d3,$260e,$19ba,$8812,$4353,$1dba,$8812,$08d2,
     $b292,$189a,$2410,$193b,$881b,$18d3,$001a,$6b3b,$189b,$781b,$43db,$b2db,$0018,$f000,$fb31,$1d3b,
     $881a,$197b,$881b,$18d3,$19ba,$8812,$4353,$1dba,$8812,$08d2,$b292,$189a,$193b,$881b,$18d3,$001a,
     $6b3b,$189b,$781a,$1d3b,$8819,$197b,$881b,$18cb,$19b9,$8809,$434b,$1db9,$8809,$08c9,$b289,$1859,
     $193b,$881b,$18cb,$43d2,$b2d1,$4a18,$54d1,$193b,$881a,$193b,$3201,$801a,$2310,$18fb,$881a,$1cbb,
     $8819,$1dbb,$881b,$1acb,$d500,$3307,$10db,$429a,$dba9,$2112,$187b,$881a,$187b,$3201,$801a,$2312,
     $18fb,$881a,$003b,$8819,$1d3b,$881b,$1acb,$429a,$da00,$e793,$2012,$f000,$fab5,$200a,$f000,$fc1e,
     $f000,$fc30,$46c0,$46bd,$b007,$bdf0,$08bc,$2000,$b590,$b089,$af00,$6078,$2010,$f7ff,$b580,$af00,
     $f000,$fa56,$2001,$f000,$fa9d,$2003,$f000,$fac8,$2000,$f000,$fac5,$202b,$f000,$fac2,$202b,$f000,
     $fabf,$2013,$f000,$fabc,$2006,$f000,$fa8b,$2017,$f000,$fab6,$2017,$f000,$fab3,$2017,$f000,$fab0,
     $2004,$f000,$fa7f,$f000,$fad9,$2000,$f000,$fa7a,$203f,$f000,$faa5,$2030,$f000,$fa74,$203c,$f000,
     $fa9f,$2061,$f000,$fa6e,$2001,$f000,$fa99,$2090,$f000,$fa96,$2001,$f000,$fa93,$202c,$f000,$fa90,
     $2082,$f000,$fa5f,$2012,$f000,$fa8a,$2050,$f000,$fa59,$2097,$f000,$fa84,$46c0,$46bd,$bd80,$b580,
     $b084,$af00,$1dbb,$2232,$801a,$1d3b,$b590,$b089,$af00,$6078,$2010,$f000,$fa45,$2300,$613b,$e0b6,
     $2300,$61fb,$e0ac,$230e,$18fb,$2200,$701a,$2300,$61bb,$e098,$693b,$2232,$435a,$69fb,$18d3,$005a,
     $69bb,$18d3,$687a,$18d2,$230f,$18fb,$7812,$701a,$2300,$617b,$e080,$200d,$183b,$220f,$18ba,$7812,
     $213f,$438a,$701a,$183b,$781b,$2bc0,$d107,$220e,$18bb,$18ba,$7812,$2101,$430a,$701a,$e01c,$230d,
     $18fb,$781b,$2b00,$d105,$220e,$18bb,$18ba,$7812,$701a,$e011,$230d,$18fb,$781b,$2b80,$d107,$220e,
     $18bb,$18ba,$7812,$2101,$430a,$701a,$e004,$220e,$18bb,$18ba,$7812,$701a,$200e,$183a,$183b,$781b,
     $18db,$7013,$210f,$187b,$187a,$7812,$0092,$701a,$240d,$193b,$187a,$7812,$213f,$438a,$701a,$193b,
     $781b,$2bc0,$d106,$183b,$183a,$7812,$2101,$430a,$701a,$e01c,$230d,$18fb,$781b,$2b00,$d105,$220e,
     $18bb,$18ba,$7812,$701a,$e011,$230d,$18fb,$781b,$2b80,$d107,$220e,$18bb,$18ba,$7812,$2101,$430a,
     $701a,$e004,$220e,$18bb,$18ba,$7812,$701a,$69bb,$2b01,$d102,$697b,$2b01,$d005,$230e,$18fa,$18fb,
     $781b,$18db,$7013,$220f,$18bb,$18ba,$7812,$0092,$701a,$697b,$3301,$617b,$697b,$2b01,$d800,$e77a,
     $69bb,$3301,$61bb,$69bb,$2b01,$d800,$e762,$230e,$18fb,$781b,$0018,$f000,$f9c3,$69fb,$3301,$61fb,
     $69fb,$2b31,$d800,$e74e,$693b,$3301,$613b,$693a,$2396,$005b,$429a,$d200,$e742,$2013,$f000,$f982,
     $2300,$613b,$e0b6,$2300,$61fb,$e0ac,$230e,$18fb,$2200,$701a,$2300,$61bb,$e098,$693b,$2232,$435a,
     $69fb,$18d3,$005a,$69bb,$18d3,$687a,$18d2,$230f,$18fb,$7812,$701a,$2300,$617b,$e080,$200d,$183b,
     $220f,$18ba,$7812,$213f,$438a,$701a,$183b,$781b,$2bc0,$d107,$220e,$18bb,$18ba,$7812,$2101,$430a,
     $701a,$e01c,$230d,$18fb,$781b,$2b00,$d105,$220e,$18bb,$18ba,$7812,$701a,$e011,$230d,$18fb,$781b,
     $2b80,$d105,$220e,$18bb,$18ba,$7812,$701a,$e006,$220e,$18bb,$18ba,$7812,$2101,$430a,$701a,$200e,
     $183a,$183b,$781b,$18db,$7013,$210f,$187b,$187a,$7812,$0092,$701a,$240d,$193b,$187a,$7812,$213f,
     $438a,$701a,$193b,$781b,$2bc0,$d106,$183b,$183a,$7812,$2101,$430a,$701a,$e01c,$230d,$18fb,$781b,
     $2b00,$d105,$220e,$18bb,$18ba,$7812,$701a,$e011,$230d,$18fb,$781b,$2b80,$d105,$220e,$18bb,$18ba,
     $7812,$701a,$e006,$220e,$18bb,$18ba,$7812,$2101,$430a,$701a,$69bb,$2b01,$d102,$697b,$2b01,$d005,
     $230e,$18fa,$18fb,$781b,$18db,$7013,$220f,$18bb,$18ba,$7812,$0092,$701a,$697b,$3301,$617b,$697b,
     $2b01,$d800,$e77a,$69bb,$3301,$61bb,$69bb,$2b01,$d800,$e762,$230e,$18fb,$781b,$0018,$f000,$f900,
     $69fb,$3301,$61fb,$69fb,$2b31,$d800,$e74e,$693b,$3301,$613b,$693a,$2396,$005b,$429a,$d200,$e742,
     $f000,$fa54,$f000,$fa3e,$46c0,$46bd,$b009,$bd90,$b580,$af00,$2050,$f7ff,$f95d,$20f7,$f7ff,$f982,
     $b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43ec,$2000,
     $b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,
     $4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,
     $681b,$b29b,$2101,$0018,$f000,$fa9a,$4b10,$681b,$b29b,$2101,$0018,$f000,$fa93,$4b0f,$681b,$b29b,
     $2101,$0018,$f000,$fa8c,$4b0a,$681b,$b29b,$2100,$0018,$f000,$fa85,$4b08,$681b,$b29b,$2101,$0018,
     $f000,$faae,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,
     $4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b1f,$681b,$b29b,$2100,$0018,$f000,
     $fa8f,$200a,$f000,$f9aa,$4b1a,$681b,$b29b,$2101,$0018,$f000,$fa85,$200a,$f000,$f9a0,$4b15,$681b,
     $b29b,$2100,$0018,$f000,$fa7b,$200a,$f000,$f996,$4b10,$681b,$b29b,$2101,$0018,$f000,$fa71,$200a,
     $f000,$f98c,$4b0b,$681b,$b29b,$2100,$0018,$f000,$fa67,$200a,$f000,$f982,$4b06,$681b,$b29b,$2101,
     $0018,$f000,$fa5d,$200a,$f000,$f978,$46c0,$46bd,$bd80,$46c0,$4368,$2000,$b580,$b082,$af00,$0002,
     $1dfb,$701a,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$fa41,$4b0c,
     $681b,$b29b,$2100,$0018,$f000,$fa3a,$1dfb,$781b,$0018,$f000,$fa55,$4b06,$681b,$b29b,$2101,$0018,
     $f000,$fa2e,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,$fa13,$4b0c,$681b,$b29b,
     $2100,$0018,$f000,$fa0c,$1dfb,$781b,$0018,$f000,$fa27,$4b06,$681b,$b29b,$2101,$0018,$f000,$fa00,
     $46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,$2071,$f7ff,$ffab,$e005,$b580,$af00,
     $2071,$f7ff,$ff9f,$e005,$2071,$f7ff,$ff9b,$2064,$f000,$f904,$4b05,$681b,$b29b,$0018,$f000,$fa1c,
     $1e03,$d0f1,$46c0,$46c0,$46bd,$bd80,$4354,$2000,$b580,$af00,$2012,$f7ff,$ff91,$2064,$b580,$b082,
     $af00,$2020,$f7ff,$ff7e,$2300,$607b,$e009,$4a2f,$687b,$18d3,$781b,$0018,$f7ff,$ffa2,$687b,$3301,
     $607b,$687b,$2b23,$d9f2,$2021,$f7ff,$ff6b,$2300,$607b,$e009,$4a26,$687b,$18d3,$781b,$0018,$f7ff,
     $ff8f,$687b,$3301,$607b,$687b,$2b23,$d9f2,$2022,$f7ff,$ff58,$2300,$607b,$e009,$4a1e,$687b,$18d3,
     $781b,$0018,$f7ff,$ff7c,$687b,$3301,$607b,$687b,$2b23,$d9f2,$2023,$f7ff,$ff45,$2300,$607b,$e009,
     $4a15,$687b,$18d3,$781b,$0018,$f7ff,$ff69,$687b,$3301,$607b,$687b,$2b23,$d9f2,$2024,$f7ff,$ff32,
     $2300,$607b,$e009,$4a0d,$687b,$18d3,$781b,$0018,$f7ff,$ff56,$687b,$3301,$607b,$687b,$2b23,$d9f2,
     $46c0,$46c0,$46bd,$b002,$bd80,$46c0,$e350,$1000,$e37c,$1000,$e3a8,$1000,$e3d4,$1000,$e400,$1000,
     $b580,$b082,$af00,$2020,$f7ff,$fe9e,$b580,$b082,$af00,$2020,$f7ff,$ff06,$2300,$607b,$e009,$4a2f,
     $687b,$18d3,$781b,$0018,$f7ff,$ff2a,$687b,$3301,$607b,$687b,$2b2b,$d9f2,$2021,$f7ff,$fef3,$2300,
     $607b,$e009,$4a26,$687b,$18d3,$781b,$0018,$f7ff,$ff17,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2022,
     $f7ff,$fee0,$2300,$607b,$e009,$4a1e,$687b,$18d3,$781b,$0018,$f7ff,$ff04,$687b,$3301,$607b,$687b,
     $2b29,$d9f2,$2023,$f7ff,$fecd,$2300,$607b,$e009,$4a15,$687b,$18d3,$781b,$0018,$f7ff,$fef1,$687b,
     $3301,$607b,$687b,$2b29,$d9f2,$2024,$f7ff,$feba,$2300,$607b,$e009,$4a0d,$687b,$18d3,$781b,$0018,
     $f7ff,$fede,$687b,$3301,$607b,$687b,$2b29,$d9f2,$46c0,$46c0,$46bd,$b002,$bd80,$46c0,$e42c,$1000,
     $e468,$1000,$e494,$1000,$e4d0,$1000,$e4fc,$1000,$b580,$b082,$af00,$2020,$f7ff,$ff10,$b580,$b082,
     $af00,$6078,$687b,$0018,$f000,$f92e,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$60f8,$60b9,
     $607a,$603b,$b580,$af00,$2012,$f7ff,$fe7b,$2064,$f7ff,$ffe4,$f7ff,$fed2,$46c0,$46bd,$bd80,$0000,
     $b580,$b082,$af00,$2020,$f7ff,$ff82,$b580,$b082,$af00,$2020,$f7ff,$fe66,$2300,$607b,$e009,$4a38,
     $687b,$18d3,$781b,$0018,$f7ff,$fe8a,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2021,$f7ff,$fe53,$2300,
     $607b,$e009,$4a2f,$687b,$18d3,$781b,$0018,$f7ff,$fe77,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2022,
     $f7ff,$fe40,$2300,$607b,$e009,$4a27,$687b,$18d3,$781b,$0018,$f7ff,$fe64,$687b,$3301,$607b,$687b,
     $2b29,$d9f2,$2023,$f7ff,$fe2d,$2300,$607b,$e009,$4a1e,$687b,$18d3,$781b,$0018,$f7ff,$fe51,$687b,
     $3301,$607b,$687b,$2b29,$d9f2,$2024,$f7ff,$fe1a,$2300,$607b,$e009,$4a16,$687b,$18d3,$781b,$0018,
     $f7ff,$fe3e,$687b,$3301,$607b,$687b,$2b29,$d9f2,$2025,$f7ff,$fe07,$2300,$607b,$e009,$4a09,$687b,
     $18d3,$781b,$0018,$f7ff,$fe2b,$687b,$3301,$607b,$687b,$2b29,$d9f2,$46c0,$46c0,$46bd,$b002,$bd80,
     $e528,$1000,$e554,$1000,$e580,$1000,$e5ac,$1000,$e5d8,$1000,$b580,$af00,$f7ff,$fdd8,$2001,$f7ff,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f88c,$1d3b,$881b,
     $2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f8a0,$e006,$1dbb,$881b,$2101,
     $0018,$f000,$f899,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$687b,$0018,$f7ff,$ff09,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,
     $0019,$0010,$f000,$f89c,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,
     $b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a4,
     $46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8ab,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1d3b,$1c0a,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f876,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b082,$af00,$6078,$23d0,$061b,
     $2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,
     $f88b,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,$2202,$4013,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8a8,
     $e003,$68fb,$0018,$f000,$f8b7,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,
     $68fb,$0018,$f000,$f8ac,$e003,$68fb,$0018,$f000,$f8bb,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,
     $6078,$23d0,$061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,
     $68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,
     $6878,$239a,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,$1e5a,$4193,
     $b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b088,$af00,$6078,
     $000a,$1cfb,$701a,$687b,$0018,$f000,$f881,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,
     $617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,
     $46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,
     $4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,
     $46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
