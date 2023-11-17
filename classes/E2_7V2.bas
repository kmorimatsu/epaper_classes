USEVAR C_RAM
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+2796,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2928,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2932,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2936,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2940,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2944,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+2948,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+3024,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+3064,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+3140,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+3144,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3220,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+3224,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+4116,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+540,DATAADDRESS(C_FUNCTIONS)+3228
  POKE32 DATAADDRESS(C_FUNCTIONS)+3432,DATAADDRESS(C_FUNCTIONS)+3228
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN7_V2_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f862,$bd00,$46c0
LABEL C_EPD_2IN7_V2_INIT_FAST
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f888,$bd00,$46c0
LABEL C_EPD_2IN7_V2_INIT_4GRAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8d2,$bd00,$46c0
LABEL C_EPD_2IN7_V2_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f95a,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f988,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY_FAST
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f9ce,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY_BASE
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fa14,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY_BASE_COLOR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fa94,$bd00,$46c0
LABEL C_EPD_2IN7_V2_DISPLAY_PARTIAL
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fafe,$bd00,$46c0
LABEL C_EPD_2IN7_V2_4GRAYDISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fc02,$bd00,$46c0
LABEL C_EPD_2IN7_V2_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd6e,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd72,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd7a,$bd00,$46c0

REM 4360 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fdc0,$f000,$fde4,$2012,$f000,$fdf5,$f000,$fddf,$2045,$f000,$fdf0,$2000,$f000,
     $fe15,$2000,$f000,$fe12,$2007,$f000,$fe0f,$2001,$f000,$fe0c,$204f,$f000,$fde1,$2000,$f000,$fe06,
     $2000,$f000,$fe03,$2011,$f000,$fdd8,$2003,$f000,$fdfd,$46c0,$46bd,$bd80,$b580,$af00,$b580,$af00,
     $f000,$fd92,$f000,$fdb6,$2012,$f000,$fdc7,$f000,$fdb1,$2018,$f000,$fdc2,$2080,$f000,$fde7,$2022,
     $f000,$fdbc,$20b1,$f000,$fde1,$2020,$f000,$fdb6,$f000,$fda0,$201a,$f000,$fdb1,$2064,$f000,$fdd6,
     $2000,$f000,$fdd3,$2045,$f000,$fda8,$2000,$f000,$fdcd,$2000,$f000,$fdca,$2007,$f000,$fdc7,$2001,
     $f000,$fdc4,$204f,$f000,$fd99,$2000,$f000,$fdbe,$2000,$f000,$fdbb,$2011,$f000,$fd90,$2003,$f000,
     $fdb5,$2022,$f000,$fd8a,$2091,$f000,$fdaf,$2020,$f000,$fd84,$f000,$fd6e,$46c0,$46bd,$bd80,$0000,
     $b580,$af00,$f000,$fd40,$f000,$fd64,$2012,$f000,$fd75,$f000,$fd5f,$2074,$f000,$fd70,$2054,$f000,
     $fd95,$207e,$f000,$fd6a,$203b,$f000,$fd8f,$2001,$f000,$fd64,$2007,$f000,$fd89,$2001,$f000,$fd86,
     $2000,$f000,$fd83,$2011,$f000,$fd58,$2003,$f000,$fd7d,$2044,$f000,$fd52,$2000,$f000,$fd77,$2015,
     $f000,$fd74,$2045,$f000,$fd49,$2000,$f000,$fd6e,$2000,$f000,$fd6b,$2007,$f000,$fd68,$2001,$f000,
     $fd65,$203c,$f000,$fd3a,$2000,$f000,$fd5f,$202c,$f000,$fd34,$4b21,$229e,$5c9b,$0018,$f000,$fd56,
     $203f,$f000,$fd2b,$4b1d,$2299,$5c9b,$0018,$f000,$fd4d,$2003,$f000,$fd22,$4b18,$229a,$5c9b,$0018,
     $f000,$fd44,$2004,$f000,$fd19,$4b14,$229b,$5c9b,$0018,$f000,$fd3b,$4b11,$229c,$5c9b,$0018,$f000,
     $fd35,$4b0e,$229d,$5c9b,$0018,$f000,$fd2f,$f000,$fd9f,$204e,$f000,$fd02,$2000,$f000,$fd27,$204f,
     $f000,$fcfc,$2000,$f000,$fd21,$2000,$f000,$fd1e,$f000,$fce0,$46c0,$46bd,$bd80,$46c0,$0470,$2000,
     $b580,$b082,$af00,$1cbb,$2216,$801a,$003b,$2284,$0052,$801a,$2024,$f000,$fce1,$1dbb,$2200,$801a,
     $e016,$1d3b,$2200,$801a,$e007,$20ff,$f000,$fcfe,$1d3b,$881a,$1d3b,$3201,$801a,$1d3a,$1cbb,$8812,
     $881b,$429a,$d3f1,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,$003b,$8812,$881b,$429a,$d3e2,$f000,$fd76,
     $46c0,$46bd,$b002,$bd80,$b590,$b085,$b590,$b085,$af00,$6078,$230a,$18fb,$2216,$801a,$2308,$18fb,
     $2284,$0052,$801a,$2024,$f000,$fca8,$230e,$18fb,$2200,$801a,$e029,$230c,$18fb,$2200,$801a,$e016,
     $240c,$193b,$881a,$230e,$18fb,$881b,$210a,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,
     $f000,$fcb4,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,$881b,$429a,$d3e0,$210e,
     $187b,$881a,$187b,$3201,$801a,$230e,$18fa,$2308,$18fb,$8812,$881b,$429a,$d3cd,$f000,$fd27,$46c0,
     $46bd,$b005,$bd90,$b590,$b590,$b085,$af00,$6078,$230a,$18fb,$2216,$801a,$2308,$18fb,$2284,$0052,
     $801a,$2024,$f000,$fc5a,$230e,$18fb,$2200,$801a,$e029,$230c,$18fb,$2200,$801a,$e016,$240c,$193b,
     $881a,$230e,$18fb,$881b,$210a,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$fc66,
     $193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,$881b,$429a,$d3e0,$210e,$187b,$881a,
     $187b,$3201,$801a,$230e,$18fa,$2308,$18fb,$8812,$881b,$429a,$d3cd,$f000,$fceb,$46c0,$46bd,$b005,
     $bd90,$b590,$b590,$b087,$af00,$6078,$230e,$18fb,$2216,$801a,$230c,$18fb,$2284,$0052,$801a,$2024,
     $f000,$fc0c,$2316,$18fb,$2200,$801a,$e029,$2314,$18fb,$2200,$801a,$e016,$2414,$193b,$881a,$2316,
     $18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$fc18,$193b,$881a,
     $193b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2116,$187b,$881a,$187b,$3201,
     $801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$2026,$f000,$fbd2,$2312,$18fb,$2200,$801a,
     $e029,$2310,$18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,$18fb,$881b,$210e,$1879,$8809,$434b,
     $18d3,$001a,$687b,$189b,$781b,$0018,$f000,$fbde,$193b,$881a,$193b,$3201,$801a,$2310,$18fa,$230e,
     $18fb,$8812,$881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,$801a,$2312,$18fa,$230c,$18fb,$8812,
     $881b,$429a,$d3cd,$f000,$fc51,$46c0,$46bd,$b007,$bd90,$b580,$b580,$b086,$af00,$0002,$1dfb,$701a,
     $230e,$18fb,$2216,$801a,$230c,$18fb,$2284,$0052,$801a,$2024,$f000,$fb82,$2316,$18fb,$2200,$801a,
     $e01d,$2314,$18fb,$2200,$801a,$e00a,$1dfb,$781b,$0018,$f000,$fb9b,$2114,$187b,$881a,$187b,$3201,
     $801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3ec,$2116,$187b,$881a,$187b,$3201,$801a,$2316,
     $18fa,$230c,$18fb,$8812,$881b,$429a,$d3d9,$2026,$f000,$fb54,$2312,$18fb,$2200,$801a,$e01d,$2310,
     $18fb,$2200,$801a,$e00a,$1dfb,$781b,$0018,$f000,$fb6d,$2110,$187b,$881a,$187b,$3201,$801a,$2310,
     $18fa,$230e,$18fb,$8812,$881b,$429a,$d3ec,$2112,$187b,$881a,$187b,$3201,$801a,$2312,$18fa,$230c,
     $18fb,$8812,$881b,$429a,$d3d9,$46c0,$46c0,$46bd,$b006,$bd80,$b5f0,$b087,$b5f0,$b087,$af00,$60f8,
     $000c,$0010,$0019,$250a,$197b,$1c22,$801a,$2308,$18fb,$1c02,$801a,$1dbb,$1c0a,$801a,$197b,$881b,
     $2207,$401a,$1dbb,$881b,$2107,$400b,$18d3,$2b08,$d10b,$197b,$881b,$2207,$4013,$b29a,$1dbb,$881b,
     $2107,$400b,$b29b,$429a,$d814,$200a,$183b,$881b,$2207,$401a,$1dbb,$881b,$2107,$400b,$18d3,$2b00,
     $d008,$1dbb,$881a,$183b,$881b,$1ad3,$001a,$2307,$4013,$d10b,$220a,$18bb,$18ba,$8812,$08d2,$801a,
     $1dbb,$1dba,$8812,$08d2,$801a,$e019,$220a,$18bb,$18ba,$8812,$08d2,$801a,$1dbb,$881b,$2207,$4013,
     $b29b,$2b00,$d104,$1dbb,$881b,$08db,$b29b,$e005,$1dbb,$881b,$08db,$b29b,$3301,$b29b,$1dba,$8013,
     $2014,$183b,$1db9,$260a,$19ba,$8809,$8812,$1a8a,$801a,$2428,$2208,$18bb,$191b,$2508,$1979,$881a,
     $880b,$1ad3,$b29a,$2312,$18fb,$1839,$8809,$434a,$801a,$1dbb,$1dba,$8812,$3a01,$801a,$2208,$18bb,
     $191b,$18b9,$190a,$8812,$3a01,$801a,$f000,$fa5c,$203c,$f000,$fa93,$2080,$f000,$fab8,$2044,$f000,
     $fa8d,$19bb,$881b,$b2db,$0018,$f000,$faaf,$1dbb,$881b,$b2db,$0018,$f000,$faa9,$2045,$f000,$fa7e,
     $197b,$881b,$b2db,$0018,$f000,$faa0,$197b,$881b,$0a1b,$b29b,$b2db,$2201,$4013,$b2db,$0018,$f000,
     $fa95,$2208,$18bb,$191b,$881b,$b2db,$0018,$f000,$fa8d,$2208,$18bb,$191b,$881b,$0a1b,$b29b,$b2db,
     $2201,$4013,$b2db,$0018,$f000,$fa80,$204e,$f000,$fa55,$19bb,$881b,$b2db,$0018,$f000,$fa77,$204f,
     $f000,$fa4c,$197b,$881b,$b2db,$0018,$f000,$fa6e,$197b,$881b,$0a1b,$b29b,$b2db,$2201,$4013,$b2db,
     $0018,$f000,$fa63,$2024,$f000,$fa38,$2316,$18fb,$2200,$801a,$e00d,$2416,$193b,$881b,$68fa,$18d3,
     $781b,$0018,$f000,$fa52,$193b,$881a,$193b,$3201,$801a,$2316,$18fa,$2312,$18fb,$8812,$881b,$429a,
     $d3e9,$f000,$faf7,$46c0,$46bd,$b007,$bdf0,$b590,$b590,$b087,$af00,$6078,$2024,$f000,$fa0f,$2300,
     $617b,$e0a8,$230a,$18fb,$2200,$701a,$2300,$613b,$e094,$697b,$005a,$693b,$18d3,$687a,$18d2,$230b,
     $18fb,$7812,$701a,$2300,$60fb,$e080,$2009,$183b,$220b,$18ba,$7812,$213f,$438a,$701a,$183b,$781b,
     $2bc0,$d105,$220a,$18bb,$18ba,$7812,$701a,$e01e,$2309,$18fb,$781b,$2b00,$d107,$220a,$18bb,$18ba,
     $7812,$2101,$430a,$701a,$e011,$2309,$18fb,$781b,$2b80,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,
     $701a,$e004,$220a,$18bb,$18ba,$7812,$701a,$200a,$183a,$183b,$781b,$18db,$7013,$210b,$187b,$187a,
     $7812,$0092,$701a,$2409,$193b,$187a,$7812,$213f,$438a,$701a,$193b,$781b,$2bc0,$d104,$183b,$183a,
     $7812,$701a,$e01e,$2309,$18fb,$781b,$2b00,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e011,
     $2309,$18fb,$781b,$2b80,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e004,$220a,$18bb,$18ba,
     $7812,$701a,$693b,$2b01,$d102,$68fb,$2b01,$d005,$230a,$18fa,$18fb,$781b,$18db,$7013,$220b,$18bb,
     $18ba,$7812,$0092,$701a,$68fb,$3301,$60fb,$68fb,$2b01,$d800,$e77a,$693b,$3301,$613b,$693b,$2b01,
     $d800,$e766,$230a,$18fb,$781b,$0018,$f000,$f98e,$697b,$3301,$617b,$697b,$4a5e,$4293,$d800,$e751,
     $2026,$f000,$f95b,$2300,$617b,$e0a8,$230a,$18fb,$2200,$701a,$2300,$613b,$e094,$697b,$005a,$693b,
     $18d3,$687a,$18d2,$230b,$18fb,$7812,$701a,$2300,$60fb,$e080,$2009,$183b,$220b,$18ba,$7812,$213f,
     $438a,$701a,$183b,$781b,$2bc0,$d105,$220a,$18bb,$18ba,$7812,$701a,$e01e,$2309,$18fb,$781b,$2b00,
     $d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e011,$2309,$18fb,$781b,$2b80,$d105,$220a,$18bb,
     $18ba,$7812,$701a,$e006,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$200a,$183a,$183b,$781b,$18db,
     $7013,$210b,$187b,$187a,$7812,$0092,$701a,$2409,$193b,$187a,$7812,$213f,$438a,$701a,$193b,$781b,
     $2bc0,$d104,$183b,$183a,$7812,$701a,$e01e,$2309,$18fb,$781b,$2b00,$d107,$220a,$18bb,$18ba,$7812,
     $2101,$430a,$701a,$e011,$2309,$18fb,$781b,$2b80,$d105,$220a,$18bb,$18ba,$7812,$701a,$e006,$220a,
     $18bb,$18ba,$7812,$2101,$430a,$701a,$693b,$2b01,$d102,$68fb,$2b01,$d005,$230a,$18fa,$18fb,$781b,
     $18db,$7013,$220b,$18bb,$18ba,$7812,$0092,$701a,$68fb,$3301,$60fb,$68fb,$2b01,$d800,$e77a,$693b,
     $3301,$613b,$693b,$2b01,$d800,$e766,$230a,$18fb,$781b,$0018,$f000,$f8da,$697b,$3301,$617b,$697b,
     $4a04,$4293,$d800,$e751,$f000,$f996,$46c0,$46bd,$b007,$bd90,$16af,$0000,$b580,$af00,$2010,$f000,
     $f89d,$2001,$f000,$f8c2,$46c0,$46bd,$bd80,$0000,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,
     $60c8,$bc03,$46c0,$46bd,$bd80,$0000,$43ec,$2000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,
     $687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,
     $601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$f966,$4b10,$681b,$b29b,$2101,$0018,$f000,$f95f,$4b0f,
     $681b,$b29b,$2101,$0018,$f000,$f958,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f951,$4b08,$681b,$b29b,
     $2101,$0018,$f000,$f974,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,
     $4358,$2000,$4364,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f95b,$2014,$f000,$f972,
     $4b0b,$681b,$b29b,$2100,$0018,$f000,$f951,$2002,$f000,$f968,$4b06,$681b,$b29b,$2101,$0018,$f000,
     $f947,$2014,$f000,$f95e,$46c0,$46bd,$bd80,$46c0,$4368,$2000,$b580,$af00,$4b07,$681b,$b29b,$0018,
     $f000,$f95e,$1e03,$d000,$e7f6,$46c0,$2014,$f000,$f949,$46c0,$46bd,$bd80,$4354,$2000,$b580,$b082,
     $af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f91d,$4b0c,$681b,$b29b,$2100,$0018,
     $f000,$f916,$1dfb,$781b,$0018,$f000,$f94b,$4b06,$681b,$b29b,$2101,$0018,$f000,$f90a,$46c0,$46bd,
     $b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,
     $0018,$f000,$f8f5,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8ee,$1dfb,$781b,$0018,$f000,$f923,$4b06,
     $681b,$b29b,$2101,$0018,$f000,$f8e2,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$4840,$0080,
     $0000,$0000,$0000,$0000,$4808,$0010,$0000,$0000,$0000,$0000,$4802,$0004,$0000,$0000,$0000,$0000,
     $4820,$0001,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$190a,$0300,$0008,$1400,
     $0001,$0114,$0300,$030a,$0800,$0019,$0100,$0000,$0000,$0100,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
     $0000,$0000,$0000,$0000,$0000,$0000,$2222,$2222,$b580,$b082,$af00,$2032,$f7ff,$ff60,$2300,$607b,
     $e009,$4a09,$687b,$18d3,$781b,$0018,$f7ff,$ff7e,$687b,$3301,$607b,$687b,$2b98,$d9f2,$46c0,$46c0,
     $46bd,$b002,$bd80,$46c0,$0470,$2000,$b580,$af00,$2022,$f7ff,$ff43,$20f7,$f7ff,$ff68,$2020,$f7ff,
     $ff3d,$f7ff,$ff27,$46c0,$46bd,$bd80,$b580,$af00,$b580,$af00,$2022,$f7ff,$ff31,$20c7,$f7ff,$ff56,
     $2020,$f7ff,$ff2b,$f7ff,$ff15,$46c0,$46bd,$bd80,$b580,$af00,$b580,$af00,$2022,$f7ff,$ff1f,$20ff,
     $f7ff,$ff44,$2020,$f7ff,$ff19,$f7ff,$ff03,$46c0,$46bd,$bd80,$b580,$af00,$b580,$af00,$2022,$f7ff,
     $ff0d,$20c7,$f7ff,$ff32,$2020,$f7ff,$ff07,$f7ff,$fef1,$46c0,$46bd,$bd80,$b580,$b082,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f86c,$1d3b,$881b,$2b00,$d003,
     $1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f87a,$e006,$1dbb,$881b,$2101,$0018,$f000,
     $f873,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,
     $701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f876,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f886,$46c0,$46bd,$b002,$bd80,$0000,$b580,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f885,$0003,$0018,$46bd,$b002,$bd80,
     $b580,$b082,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,
     $f000,$f882,$46c0,$46bd,$b004,$bd80,$b580,$b082,$b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,
     $4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,$f87d,$46c0,
     $46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,
     $1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f89a,$e003,$68fb,$0018,$f000,$f8a3,$46c0,$46bd,$b004,
     $bd80,$b580,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,
     $2b00,$d004,$68fb,$0018,$f000,$f898,$e003,$68fb,$0018,$f000,$f8a1,$46c0,$46bd,$b004,$bd80,$b580,
     $b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f81a,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,$1e5a,$4193,$b2db,$0018,
     $46bd,$b002,$bd80,$b580,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,
     $68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b088,$af00,$6078,
     $000a,$1cfb,$701a,$687b,$0018,$f000,$f863,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,
     $617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,
     $46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,
     $4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$b580,$b082,$af00,$6078,$46c0,$46bd,
     $b002,$bd80,$0000,$b580

REM 0 bytes
LABEL C_RODATA
