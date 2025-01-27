rem 
rem 	This file was copied from Waveshare C library and modified by Katsumi. 
rem 
rem /*****************************************************************************
rem * | File      	:   EPD_4in2_V2.h
rem * | Author      :   Waveshare team
rem * | Function    :   4.2inch e-paper V2
rem * | Info        :
rem *----------------
rem * |	This version:   V1.0
rem * | Date        :   2023-09-12
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

method EPD_4IN2_V2_INIT
  goto C_EPD_4IN2_V2_INIT
method EPD_4IN2_V2_INIT_FAST
  goto C_EPD_4IN2_V2_INIT_FAST
method EPD_4IN2_V2_INIT_4GRAY
  goto C_EPD_4IN2_V2_INIT_4GRAY
method EPD_4IN2_V2_CLEAR
  goto C_EPD_4IN2_V2_CLEAR
method EPD_4IN2_V2_DISPLAY
  goto C_EPD_4IN2_V2_DISPLAY
method EPD_4IN2_V2_DISPLAY_FAST
  goto C_EPD_4IN2_V2_DISPLAY_FAST
method EPD_4IN2_V2_DISPLAY_4GRAY
  goto C_EPD_4IN2_V2_DISPLAY_4GRAY
method EPD_4IN2_V2_PARTIALDISPLAY
  goto C_EPD_4IN2_V2_PARTIALDISPLAY
method EPD_4IN2_V2_SLEEP
  goto C_EPD_4IN2_V2_SLEEP

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
  POKE32 DATAADDRESS(C_FUNCTIONS)+1980,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2124,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2128,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2132,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2136,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2140,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+2144,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+2228,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2280,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2364,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2368,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2452,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2456,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3664,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_4IN2_V2_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f88f,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_V2_INIT_FAST
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f8b9,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_V2_INIT_4GRAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f905,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_V2_CLEAR
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f93b,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_V2_DISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f977,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_V2_DISPLAY_FAST
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$f9c7,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_V2_DISPLAY_4GRAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fa17,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_V2_PARTIALDISPLAY
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fb0d,$b002,$bd00,$46c0
LABEL C_EPD_4IN2_V2_SLEEP
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fbd9,$b002,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fbdf,$b002,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $b082,$69f0,$9000,$6a30,$9001,$68f0,$6931,$6972,$69b3,$f000,$fbe9,$b002,$bd00,$46c0

REM 3856 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fc34,$f000,$fc5c,$2012,$f000,$fc73,$f000,$fc57,$2021,$f000,$fc6e,$2040,$f000,
     $fc97,$2000,$f000,$fc94,$203c,$f000,$fc65,$2005,$f000,$fc8e,$2011,$f000,$fc5f,$2003,$f000,$fc88,
     $f240,$132b,$f240,$128f,$2100,$2000,$f000,$fcac,$2100,$2000,$f000,$fcee,$f000,$fc34,$bf00,$bd80,
     $b580,$b082,$af00,$4603,$71fb,$f7ff,$fe49,$f7ff,$b580,$b082,$af00,$4603,$71fb,$f000,$fbf9,$f000,
     $fc21,$2012,$f000,$fc38,$f000,$fc1c,$2021,$f000,$fc33,$2040,$f000,$fc5c,$2000,$f000,$fc59,$203c,
     $f000,$fc2a,$2005,$f000,$fc53,$79fb,$2b00,$d106,$201a,$f000,$fc21,$206e,$f000,$fc4a,$e008,$79fb,
     $2b01,$d105,$201a,$f000,$fc17,$205a,$f000,$fc40,$2022,$f000,$fc11,$2091,$f000,$fc3a,$2020,$f000,
     $fc0b,$f000,$fbef,$2011,$f000,$fc06,$2003,$f000,$fc2f,$f240,$132b,$f240,$128f,$2100,$2000,$f000,
     $fc53,$2100,$2000,$f000,$fc95,$f000,$fbdb,$bf00,$3708,$46bd,$bd80,$b580,$af00,$f7ff,$fdf9,$2012,
     $f7ff,$fe1a,$b580,$af00,$f000,$fba2,$2012,$f000,$fbe3,$f000,$fbc7,$2021,$f000,$fbde,$2000,$f000,
     $fc07,$2000,$f000,$fc04,$203c,$f000,$fbd5,$2003,$f000,$fbfe,$200c,$f000,$fbcf,$208b,$f000,$fbf8,
     $209c,$f000,$fbf5,$20a4,$f000,$fbf2,$200f,$f000,$fbef,$f000,$fc89,$2011,$f000,$fbbe,$2003,$f000,
     $fbe7,$f240,$132b,$f240,$128f,$2100,$2000,$f000,$fc0b,$2100,$2000,$f000,$fc4d,$bf00,$bd80,$b580,
     $b084,$af00,$2332,$80fb,$f44f,$7396,$b580,$b084,$af00,$2332,$80fb,$f44f,$7396,$80bb,$2024,$f000,
     $fb9b,$2300,$81fb,$e00f,$2300,$81bb,$e005,$20ff,$f000,$fbbe,$89bb,$3301,$81bb,$89ba,$88fb,$429a,
     $d3f5,$89fb,$3301,$81fb,$89fa,$88bb,$429a,$d3eb,$2026,$f000,$fb81,$2300,$817b,$e00f,$2300,$813b,
     $e005,$20ff,$f000,$fba4,$893b,$3301,$813b,$893a,$88fb,$429a,$d3f5,$897b,$3301,$817b,$897a,$88bb,
     $429a,$d3eb,$f000,$fc94,$bf00,$3710,$46bd,$bd80,$b580,$b086,$af00,$6078,$2332,$81fb,$f44f,$7396,
     $b580,$b086,$af00,$6078,$2332,$81fb,$f44f,$7396,$81bb,$2024,$f000,$fb50,$2300,$82fb,$e019,$2300,
     $82bb,$e00f,$8aba,$8afb,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$fb69,$8abb,
     $3301,$82bb,$8aba,$89fb,$429a,$d3eb,$8afb,$3301,$82fb,$8afa,$89bb,$429a,$d3e1,$2026,$f000,$fb2c,
     $2300,$827b,$e019,$2300,$823b,$e00f,$8a3a,$8a7b,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,
     $4618,$f000,$fb45,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3eb,$8a7b,$3301,$827b,$8a7a,$89bb,$429a,
     $d3e1,$f000,$fc35,$bf00,$3718,$46bd,$bd80,$b580,$b086,$af00,$6078,$2332,$81fb,$f44f,$b580,$b086,
     $af00,$6078,$2332,$81fb,$f44f,$7396,$81bb,$2024,$f000,$faf2,$2300,$82fb,$e019,$2300,$82bb,$e00f,
     $8aba,$8afb,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,$fb0b,$8abb,$3301,$82bb,
     $8aba,$89fb,$429a,$d3eb,$8afb,$3301,$82fb,$8afa,$89bb,$429a,$d3e1,$2026,$f000,$face,$2300,$827b,
     $e019,$2300,$823b,$e00f,$8a3a,$8a7b,$89f9,$fb01,$f303,$4413,$461a,$687b,$4413,$781b,$4618,$f000,
     $fae7,$8a3b,$3301,$823b,$8a3a,$89fb,$429a,$d3eb,$8a7b,$3301,$827b,$8a7a,$89bb,$429a,$d3e1,$f000,
     $fbed,$bf00,$3718,$46bd,$bd80,$b580,$b088,$af00,$6078,$2024,$f7ff,$fced,$b580,$b088,$af00,$6078,
     $2024,$f000,$fa99,$2300,$613b,$e06e,$2300,$61fb,$e065,$2300,$73bb,$2300,$61bb,$e056,$693b,$2232,
     $fb03,$f202,$69fb,$4413,$005a,$69bb,$4413,$687a,$4413,$781b,$73fb,$2300,$617b,$e040,$7bfb,$f023,
     $033f,$737b,$7b7b,$2bc0,$d104,$7bbb,$f043,$0301,$73bb,$e009,$7b7b,$2b00,$d006,$7b7b,$2b80,$d003,
     $7bbb,$f043,$0301,$73bb,$7bbb,$005b,$73bb,$7bfb,$009b,$73fb,$7bfb,$f023,$033f,$737b,$7b7b,$2bc0,
     $d104,$7bbb,$f043,$0301,$73bb,$e009,$7b7b,$2b00,$d006,$7b7b,$2b80,$d003,$7bbb,$f043,$0301,$73bb,
     $69bb,$2b01,$d102,$697b,$2b01,$d002,$7bbb,$005b,$73bb,$7bfb,$009b,$73fb,$697b,$3301,$617b,$697b,
     $2b01,$d9bb,$69bb,$3301,$61bb,$69bb,$2b01,$d9a5,$7bbb,$4618,$f000,$fa5c,$69fb,$3301,$61fb,$69fb,
     $2b31,$d996,$693b,$3301,$613b,$693b,$f5b3,$7f96,$d38c,$2026,$f000,$fa20,$2300,$613b,$e06e,$2300,
     $61fb,$e065,$2300,$73bb,$2300,$61bb,$e056,$693b,$2232,$fb03,$f202,$69fb,$4413,$005a,$69bb,$4413,
     $687a,$4413,$781b,$73fb,$2300,$617b,$e040,$7bfb,$f023,$033f,$737b,$7b7b,$2bc0,$d104,$7bbb,$f043,
     $0301,$73bb,$e009,$7b7b,$2b00,$d006,$7b7b,$2b80,$d103,$7bbb,$f043,$0301,$73bb,$7bbb,$005b,$73bb,
     $7bfb,$009b,$73fb,$7bfb,$f023,$033f,$737b,$7b7b,$2bc0,$d104,$7bbb,$f043,$0301,$73bb,$e009,$7b7b,
     $2b00,$d006,$7b7b,$2b80,$d103,$7bbb,$f043,$0301,$73bb,$69bb,$2b01,$d102,$697b,$2b01,$d002,$7bbb,
     $005b,$73bb,$7bfb,$009b,$73fb,$697b,$3301,$617b,$697b,$2b01,$d9bb,$69bb,$3301,$61bb,$69bb,$2b01,
     $d9a5,$7bbb,$4618,$f000,$f9e3,$69fb,$3301,$61fb,$69fb,$2b31,$d996,$693b,$3301,$613b,$693b,$f5b3,
     $7f96,$d38c,$f000,$fb00,$bf00,$3720,$46bd,$bd80,$b580,$b086,$af00,$60f8,$4608,$4611,$461a,$4603,
     $b580,$b086,$af00,$60f8,$4608,$4611,$461a,$4603,$817b,$460b,$813b,$4613,$80fb,$897b,$f003,$0207,
     $88fb,$f003,$0307,$4413,$2b08,$d109,$897b,$f003,$0307,$b29a,$88fb,$f003,$0307,$b29b,$429a,$d80f,
     $897b,$f003,$0207,$88fb,$f003,$0307,$4413,$2b00,$d006,$88fa,$897b,$1ad3,$f003,$0307,$2b00,$d106,
     $897b,$08db,$817b,$88fb,$08db,$80fb,$e012,$897b,$08db,$817b,$88fb,$f003,$0307,$b29b,$2b00,$d103,
     $88fb,$08db,$b29b,$e004,$88fb,$08db,$b29b,$3301,$b29b,$80fb,$88fa,$897b,$1ad3,$82bb,$8c3a,$893b,
     $1ad3,$b29b,$8aba,$fb12,$f303,$827b,$88fb,$3b01,$80fb,$8c3b,$3b01,$843b,$203c,$f000,$f93d,$2080,
     $f000,$f966,$2021,$f000,$f937,$2000,$f000,$f960,$2000,$f000,$f95d,$203c,$f000,$f92e,$2080,$f000,
     $f957,$2044,$f000,$f928,$897b,$b2db,$4618,$f000,$f94f,$88fb,$b2db,$4618,$f000,$f94a,$2045,$f000,
     $f91b,$893b,$b2db,$4618,$f000,$f942,$893b,$0a1b,$b29b,$b2db,$f003,$0301,$b2db,$4618,$f000,$f938,
     $8c3b,$b2db,$4618,$f000,$f933,$8c3b,$0a1b,$b29b,$b2db,$f003,$0301,$b2db,$4618,$f000,$f929,$204e,
     $f000,$f8fa,$897b,$b2db,$4618,$f000,$f921,$204f,$f000,$f8f2,$893b,$b2db,$4618,$f000,$f919,$893b,
     $0a1b,$b29b,$b2db,$f003,$0301,$b2db,$4618,$f000,$f90f,$2024,$f000,$f8e0,$2300,$82fb,$e009,$8afb,
     $68fa,$4413,$781b,$4618,$f000,$f902,$8afb,$3301,$82fb,$8afa,$8a7b,$429a,$d3f1,$f000,$fa3b,$bf00,
     $3718,$46bd,$bd80,$b580,$af00,$2010,$f7ff,$fb20,$2001,$f7ff,$b580,$af00,$2010,$f000,$f8bd,$2001,
     $f000,$f8e6,$20c8,$f000,$fa3b,$bf00,$bd80,$b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$b480,$af00,
     $b403,$4906,$600d,$604e,$608f,$ea5f,$0008,$60c8,$bc03,$bf00,$46bd,$f85d,$7b04,$4770,$4400,$2000,
     $b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4a1c,$687b,$6013,
     $4a1b,$68fb,$6013,$4a1b,$683b,$6013,$4a1a,$68bb,$6013,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,
     $681b,$b29b,$2101,$4618,$f000,$fa0c,$4b10,$681b,$b29b,$2101,$4618,$f000,$fa05,$4b0f,$681b,$b29b,
     $2101,$4618,$f000,$f9fe,$4b0a,$681b,$b29b,$2100,$4618,$f000,$f9f7,$4b08,$681b,$b29b,$2101,$4618,
     $f000,$fa1a,$bf00,$3710,$46bd,$bd80,$43a8,$2000,$43a0,$2000,$4394,$2000,$439c,$2000,$4398,$2000,
     $43a4,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b0f,$681b,$b29b,$2101,$4618,$f000,
     $f9fb,$2064,$f000,$f9bc,$4b0a,$681b,$b29b,$2100,$4618,$f000,$f9f1,$2002,$f000,$f9b2,$4b05,$681b,
     $b29b,$2101,$4618,$f000,$f9e7,$2064,$f000,$f9a8,$bf00,$bd80,$43a8,$2000,$b580,$b082,$af00,$4603,
     $71fb,$4b0e,$b580,$af00,$e002,$200a,$f000,$f998,$4b05,$681b,$b29b,$4618,$f000,$f9ec,$4603,$2b01,
     $d0f3,$bf00,$bf00,$bd80,$4394,$2000,$b580,$af00,$2022,$f7ff,$ff9b,$20f7,$b580,$b082,$af00,$4603,
     $71fb,$4b0e,$681b,$b29b,$2100,$4618,$f000,$f9b4,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f9ad,$79fb,
     $4618,$f000,$f9dd,$4b06,$681b,$b29b,$2101,$4618,$f000,$f9a2,$bf00,$3708,$46bd,$bd80,$43a0,$2000,
     $439c,$2000,$b580,$b082,$af00,$4603,$71fb,$4b0e,$b580,$b082,$af00,$4603,$71fb,$4b0e,$681b,$b29b,
     $2101,$4618,$f000,$f988,$4b0b,$681b,$b29b,$2100,$4618,$f000,$f981,$79fb,$4618,$f000,$f9b1,$4b06,
     $681b,$b29b,$2101,$4618,$f000,$f976,$bf00,$3708,$46bd,$bd80,$43a0,$2000,$439c,$2000,$b580,$af00,
     $e002,$200a,$f7f9,$fe4c,$b590,$b083,$af00,$4604,$4608,$4611,$461a,$4623,$80fb,$4603,$80bb,$460b,
     $807b,$4613,$803b,$2044,$f7ff,$ff96,$88fb,$08db,$b29b,$b2db,$4618,$f7ff,$ffbb,$887b,$08db,$b29b,
     $b2db,$4618,$f7ff,$ffb4,$2045,$f7ff,$ff85,$88bb,$b2db,$4618,$f7ff,$ffac,$88bb,$0a1b,$b29b,$b2db,
     $4618,$f7ff,$ffa5,$883b,$b2db,$4618,$f7ff,$ffa0,$883b,$0a1b,$b29b,$b2db,$4618,$f7ff,$ff99,$bf00,
     $370c,$46bd,$bd90,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$b580,$b082,$af00,$4603,$460a,$80fb,
     $4613,$80bb,$204e,$f7ff,$ff57,$88fb,$b2db,$4618,$f7ff,$ff7e,$204f,$f7ff,$ff4f,$88bb,$b2db,$4618,
     $f7ff,$ff76,$88bb,$0a1b,$b29b,$b2db,$4618,$f7ff,$ff6f,$bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,
     $2032,$f7ff,$fefc,$2300,$b580,$b082,$af00,$2032,$f7ff,$ff32,$2300,$71fb,$e008,$79fb,$4a28,$5cd3,
     $4618,$f7ff,$ff55,$79fb,$3301,$71fb,$79fb,$2be2,$d9f3,$203f,$f7ff,$ff20,$79fb,$1c5a,$71fa,$461a,
     $4b1f,$5c9b,$4618,$f7ff,$ff43,$2003,$f7ff,$ff14,$79fb,$1c5a,$71fa,$461a,$4b19,$5c9b,$4618,$f7ff,
     $ff37,$2004,$f7ff,$ff08,$79fb,$1c5a,$71fa,$461a,$4b13,$5c9b,$4618,$f7ff,$ff2b,$79fb,$1c5a,$71fa,
     $461a,$4b0f,$5c9b,$4618,$f7ff,$ff22,$79fb,$1c5a,$71fa,$461a,$4b0a,$5c9b,$4618,$f7ff,$ff19,$202c,
     $f7ff,$feea,$79fb,$1c5a,$71fa,$461a,$4b04,$5c9b,$4618,$f7ff,$ff0d,$bf00,$3708,$46bd,$bd80,$bf00,
     $bc48,$1000,$b580,$af00,$f7ff,$fe7c,$f7ff,$feea,$b580,$af00,$2022,$f7ff,$fecf,$20f7,$f7ff,$fef8,
     $2020,$f7ff,$fec9,$f7ff,$fead,$bf00,$bd80,$b580,$af00,$2022,$f7ff,$ff8c,$20c7,$f7ff,$b580,$af00,
     $2022,$f7ff,$feb9,$20c7,$f7ff,$fee2,$2020,$f7ff,$feb3,$f7ff,$fe97,$bf00,$bd80,$b580,$af00,$2022,
     $f7ff,$ff7d,$20ff,$f7ff,$b580,$af00,$2022,$f7ff,$fea3,$20cf,$f7ff,$fecc,$2020,$f7ff,$fe9d,$f7ff,
     $fe81,$bf00,$bd80,$b590,$b083,$af00,$4604,$4608,$4611,$461a,$b580,$af00,$2022,$f7ff,$fe8d,$20ff,
     $f7ff,$feb6,$2020,$f7ff,$fe87,$f7ff,$fe6b,$bf00,$bd80,$b580,$af00,$2022,$f7ff,$ff6e,$20cf,$f7ff,
     $b580,$b082,$af00,$6078,$6878,$f000,$f883,$bf00,$3708,$46bd,$bd80,$0000,$b580,$b084,$af00,$60f8,
     $60b9,$607a,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,$88fb,$4618,$f000,$f882,$88bb,$2b00,
     $d002,$88bb,$2b00,$d105,$88fb,$2100,$4618,$f000,$f893,$e005,$88fb,$2101,$4618,$f000,$f88d,$bf00,
     $bf00,$3708,$46bd,$bd80,$b580,$b082,$af00,$6078,$6878,$f7ff,$ff51,$bf00,$b580,$b082,$af00,$4603,
     $460a,$80fb,$4613,$717b,$88fa,$797b,$2b00,$bf14,$2301,$2300,$b2db,$4619,$4610,$f000,$f889,$bf00,
     $3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$80fb,$88fb,$4618,$b580,$b082,$af00,$4603,$80fb,$88fb,
     $4618,$f000,$f891,$4603,$4618,$3708,$46bd,$bd80,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$80bb,
     $b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,$010c,$2394,$2203,$2001,$f000,$f894,$bf00,$3710,
     $46bd,$bd80,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$b580,$b082,$af00,$6078,$6878,$239a,
     $2200,$2100,$f000,$f87e,$bf00,$3708,$46bd,$bd80,$b580,$b084,$af00,$4603,$71fb,$79fb,$60fb,$f107,
     $b580,$b082,$af00,$6078,$2100,$6878,$f000,$f814,$2100,$6878,$f000,$f82c,$2105,$6878,$f000,$f880,
     $bf00,$3708,$46bd,$bd80,$b40f,$b580,$b082,$af00,$4809,$f002,$f99e,$693b,$b480,$b085,$af00,$6078,
     $460b,$70fb,$687b,$60fb,$78fb,$72fb,$68fb,$7afa,$ec42,$3044,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,
     $4770,$b580,$b082,$af00,$4603,$460a,$80fb,$4613,$b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb,
     $78fb,$72fb,$68fb,$7afa,$ec42,$3040,$bf00,$bf00,$3714,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,
     $6078,$460b,$70fb,$687b,$b480,$b083,$af00,$6078,$f04f,$4350,$685a,$2101,$687b,$fa01,$f303,$4013,
     $2b00,$bf14,$2301,$2300,$b2db,$4618,$370c,$46bd,$f85d,$7b04,$4770,$b480,$b085,$af00,$6078,$460b,
     $70fb,$687b,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$697c,$683b,$687a,$68b9,
     $68f8,$47a0,$4603,$4618,$371c,$46bd,$bd90,$bf00,$4400,$2000,$b580,$b082,$af00,$6078,$6878,$239a,
     $b580,$b08a,$af00,$6078,$460b,$70fb,$6878,$f000,$f83d,$687b,$009a,$4b18,$4413,$61fb,$2340,$61bb,
     $23c0,$617b,$69fb,$681a,$69bb,$405a,$697b,$4013,$69fa,$613a,$60fb,$693b,$f503,$5380,$461a,$68fb,
     $6013,$bf00,$bf00,$490d,$78fa,$687b,$00db,$440b,$605a,$687b,$009a,$4b08,$4413,$627b,$f44f,$7380,
     $623b,$6a7b,$f503,$5340,$461a,$6a3b,$6013,$bf00,$bf00,$3728,$46bd,$bd80,$8004,$4003,$8000,$4002,
     $b580,$b082,$af00,$6078,$2100,$6878,$b480,$b083,$af00,$6078,$bf00,$370c,$46bd,$f85d,$7b04,$4770,
     $b480,$b085,$af00,$6078,$460b,$70fb,$687b,$60fb

REM 0 bytes
LABEL C_RODATA
