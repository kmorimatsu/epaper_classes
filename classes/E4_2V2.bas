USEVAR C_RAM
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+2688,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2832,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2836,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2840,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2844,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2848,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+2852,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+2940,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2996,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+3084,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+3088,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3176,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+3180,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+4528,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_4IN2_V2_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f852,$bd00,$46c0
LABEL C_EPD_4IN2_V2_INIT_FAST
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f882,$bd00,$46c0
LABEL C_EPD_4IN2_V2_INIT_4GRAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8d8,$bd00,$46c0
LABEL C_EPD_4IN2_V2_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f916,$bd00,$46c0
LABEL C_EPD_4IN2_V2_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f97a,$bd00,$46c0
LABEL C_EPD_4IN2_V2_DISPLAY_FAST
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fa00,$bd00,$46c0
LABEL C_EPD_4IN2_V2_DISPLAY_4GRAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fa86,$bd00,$46c0
LABEL C_EPD_4IN2_V2_PARTIALDISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fc16,$bd00,$46c0
LABEL C_EPD_4IN2_V2_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd2e,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd3c,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd4a,$bd00,$46c0

REM 4856 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fd96,$f000,$fdc0,$2012,$f000,$fdd9,$f000,$fdbb,$2021,$f000,$fdd4,$2040,$f000,
     $fdff,$2000,$f000,$fdfc,$203c,$f000,$fdcb,$2005,$f000,$fdf6,$2011,$f000,$fdc5,$2003,$f000,$fdf0,
     $232c,$33ff,$2290,$32ff,$2100,$2000,$f000,$fe16,$2100,$2000,$f000,$fe62,$f000,$fd98,$46c0,$46bd,
     $bd80,$b580,$b082,$af00,$0002,$1dfb,$701a,$f7ff,$b580,$b082,$af00,$0002,$1dfb,$701a,$f000,$fd5a,
     $f000,$fd84,$2012,$f000,$fd9d,$f000,$fd7f,$2021,$f000,$fd98,$2040,$f000,$fdc3,$2000,$f000,$fdc0,
     $203c,$f000,$fd8f,$2005,$f000,$fdba,$1dfb,$781b,$2b00,$d106,$201a,$f000,$fd85,$206e,$f000,$fdb0,
     $e009,$1dfb,$781b,$2b01,$d105,$201a,$f000,$fd7a,$205a,$f000,$fda5,$2022,$f000,$fd74,$2091,$f000,
     $fd9f,$2020,$f000,$fd6e,$f000,$fd50,$2011,$f000,$fd69,$2003,$f000,$fd94,$232c,$33ff,$2290,$32ff,
     $2100,$2000,$f000,$fdba,$2100,$2000,$f000,$fe06,$f000,$fd3c,$46c0,$46bd,$b002,$bd80,$b580,$af00,
     $f7ff,$fdcb,$2012,$f7ff,$fdee,$f7ff,$b580,$af00,$f000,$fd00,$2012,$f000,$fd45,$f000,$fd27,$2021,
     $f000,$fd40,$2000,$f000,$fd6b,$2000,$f000,$fd68,$203c,$f000,$fd37,$2003,$f000,$fd62,$200c,$f000,
     $fd31,$208b,$f000,$fd5c,$209c,$f000,$fd59,$20a4,$f000,$fd56,$200f,$f000,$fd53,$f000,$fdfd,$2011,
     $f000,$fd20,$2003,$f000,$fd4b,$232c,$33ff,$2290,$32ff,$2100,$2000,$f000,$fd71,$2100,$2000,$f000,
     $fdbd,$46c0,$46bd,$bd80,$b580,$b084,$af00,$1dbb,$2232,$801a,$1d3b,$2296,$b580,$b084,$af00,$1dbb,
     $2232,$801a,$1d3b,$2296,$0052,$801a,$2024,$f000,$fcf9,$230e,$18fb,$2200,$801a,$e01a,$230c,$18fb,
     $2200,$801a,$e008,$20ff,$f000,$fd1a,$210c,$187b,$881a,$187b,$3201,$801a,$230c,$18fa,$1dbb,$8812,
     $881b,$429a,$d3ef,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,
     $2026,$f000,$fccf,$230a,$18fb,$2200,$801a,$e01a,$2308,$18fb,$2200,$801a,$e008,$20ff,$f000,$fcf0,
     $2108,$187b,$881a,$187b,$3201,$801a,$2308,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210a,$187b,$881a,
     $187b,$3201,$801a,$230a,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$f000,$fdf4,$46c0,$46bd,$b004,$bd80,
     $b590,$b087,$af00,$6078,$230e,$18fb,$2232,$801a,$b590,$b087,$af00,$6078,$230e,$18fb,$2232,$801a,
     $230c,$18fb,$2296,$0052,$801a,$2024,$f000,$fc8a,$2316,$18fb,$2200,$801a,$e029,$2314,$18fb,$2200,
     $801a,$e016,$2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,
     $781b,$0018,$f000,$fc9c,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,
     $d3e0,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$2026,
     $f000,$fc50,$2312,$18fb,$2200,$801a,$e029,$2310,$18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,
     $18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$fc62,$193b,$881a,
     $193b,$3201,$801a,$2310,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,
     $801a,$2312,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$f000,$fd65,$46c0,$46bd,$b007,$bd90,$b590,
     $b087,$af00,$6078,$230e,$18fb,$2232,$b590,$b087,$af00,$6078,$230e,$18fb,$2232,$801a,$230c,$18fb,
     $2296,$0052,$801a,$2024,$f000,$fbfc,$2316,$18fb,$2200,$801a,$e029,$2314,$18fb,$2200,$801a,$e016,
     $2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,
     $f000,$fc0e,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2116,
     $187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$2026,$f000,$fbc2,
     $2312,$18fb,$2200,$801a,$e029,$2310,$18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,$18fb,$881b,
     $210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$fbd4,$193b,$881a,$193b,$3201,
     $801a,$2310,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,$801a,$2312,
     $18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$f000,$fcef,$46c0,$46bd,$b007,$bd90,$b590,$b089,$af00,
     $6078,$2024,$f7ff,$fc3e,$b590,$b089,$af00,$6078,$2024,$f000,$fb77,$2300,$613b,$e0b6,$2300,$61fb,
     $e0ac,$230e,$18fb,$2200,$701a,$2300,$61bb,$e098,$693b,$2232,$435a,$69fb,$18d3,$005a,$69bb,$18d3,
     $687a,$18d2,$230f,$18fb,$7812,$701a,$2300,$617b,$e080,$200d,$183b,$220f,$18ba,$7812,$213f,$438a,
     $701a,$183b,$781b,$2bc0,$d107,$220e,$18bb,$18ba,$7812,$2101,$430a,$701a,$e01c,$230d,$18fb,$781b,
     $2b00,$d105,$220e,$18bb,$18ba,$7812,$701a,$e011,$230d,$18fb,$781b,$2b80,$d105,$220e,$18bb,$18ba,
     $7812,$701a,$e006,$220e,$18bb,$18ba,$7812,$2101,$430a,$701a,$200e,$183a,$183b,$781b,$18db,$7013,
     $210f,$187b,$187a,$7812,$0092,$701a,$240d,$193b,$187a,$7812,$213f,$438a,$701a,$193b,$781b,$2bc0,
     $d106,$183b,$183a,$7812,$2101,$430a,$701a,$e01c,$230d,$18fb,$781b,$2b00,$d105,$220e,$18bb,$18ba,
     $7812,$701a,$e011,$230d,$18fb,$781b,$2b80,$d105,$220e,$18bb,$18ba,$7812,$701a,$e006,$220e,$18bb,
     $18ba,$7812,$2101,$430a,$701a,$69bb,$2b01,$d102,$697b,$2b01,$d005,$230e,$18fa,$18fb,$781b,$18db,
     $7013,$220f,$18bb,$18ba,$7812,$0092,$701a,$697b,$3301,$617b,$697b,$2b01,$d800,$e77a,$69bb,$3301,
     $61bb,$69bb,$2b01,$d800,$e762,$230e,$18fb,$781b,$0018,$f000,$faf5,$69fb,$3301,$61fb,$69fb,$2b31,
     $d800,$e74e,$693b,$3301,$613b,$693a,$2396,$005b,$429a,$d200,$e742,$2026,$f000,$fab4,$2300,$613b,
     $e0b6,$2300,$61fb,$e0ac,$230e,$18fb,$2200,$701a,$2300,$61bb,$e098,$693b,$2232,$435a,$69fb,$18d3,
     $005a,$69bb,$18d3,$687a,$18d2,$230f,$18fb,$7812,$701a,$2300,$617b,$e080,$200d,$183b,$220f,$18ba,
     $7812,$213f,$438a,$701a,$183b,$781b,$2bc0,$d107,$220e,$18bb,$18ba,$7812,$2101,$430a,$701a,$e01c,
     $230d,$18fb,$781b,$2b00,$d105,$220e,$18bb,$18ba,$7812,$701a,$e011,$230d,$18fb,$781b,$2b80,$d107,
     $220e,$18bb,$18ba,$7812,$2101,$430a,$701a,$e004,$220e,$18bb,$18ba,$7812,$701a,$200e,$183a,$183b,
     $781b,$18db,$7013,$210f,$187b,$187a,$7812,$0092,$701a,$240d,$193b,$187a,$7812,$213f,$438a,$701a,
     $193b,$781b,$2bc0,$d106,$183b,$183a,$7812,$2101,$430a,$701a,$e01c,$230d,$18fb,$781b,$2b00,$d105,
     $220e,$18bb,$18ba,$7812,$701a,$e011,$230d,$18fb,$781b,$2b80,$d107,$220e,$18bb,$18ba,$7812,$2101,
     $430a,$701a,$e004,$220e,$18bb,$18ba,$7812,$701a,$69bb,$2b01,$d102,$697b,$2b01,$d005,$230e,$18fa,
     $18fb,$781b,$18db,$7013,$220f,$18bb,$18ba,$7812,$0092,$701a,$697b,$3301,$617b,$697b,$2b01,$d800,
     $e77a,$69bb,$3301,$61bb,$69bb,$2b01,$d800,$e762,$230e,$18fb,$781b,$0018,$f000,$fa32,$69fb,$3301,
     $61fb,$69fb,$2b31,$d800,$e74e,$693b,$3301,$613b,$693a,$2396,$005b,$429a,$d200,$e742,$f000,$fb70,
     $46c0,$46bd,$b009,$bd90,$b5f0,$b087,$af00,$60f8,$000c,$0010,$0019,$250a,$b5f0,$b087,$af00,$60f8,
     $000c,$0010,$0019,$250a,$197b,$1c22,$801a,$2308,$18fb,$1c02,$801a,$1dbb,$1c0a,$801a,$197b,$881b,
     $2207,$401a,$1dbb,$881b,$2107,$400b,$18d3,$2b08,$d10b,$197b,$881b,$2207,$4013,$b29a,$1dbb,$881b,
     $2107,$400b,$b29b,$429a,$d814,$200a,$183b,$881b,$2207,$401a,$1dbb,$881b,$2107,$400b,$18d3,$2b00,
     $d008,$1dbb,$881a,$183b,$881b,$1ad3,$001a,$2307,$4013,$d10b,$220a,$18bb,$18ba,$8812,$08d2,$801a,
     $1dbb,$1dba,$8812,$08d2,$801a,$e019,$220a,$18bb,$18ba,$8812,$08d2,$801a,$1dbb,$881b,$2207,$4013,
     $b29b,$2b00,$d104,$1dbb,$881b,$08db,$b29b,$e005,$1dbb,$881b,$08db,$b29b,$3301,$b29b,$1dba,$8013,
     $2014,$183b,$1db9,$260a,$19ba,$8809,$8812,$1a8a,$801a,$2428,$2208,$18bb,$191b,$2508,$1979,$881a,
     $880b,$1ad3,$b29a,$2312,$18fb,$1839,$8809,$434a,$801a,$1dbb,$1dba,$8812,$3a01,$801a,$2208,$18bb,
     $191b,$18b9,$190a,$8812,$3a01,$801a,$203c,$f000,$f959,$2080,$f000,$f984,$2021,$f000,$f953,$2000,
     $f000,$f97e,$2000,$f000,$f97b,$203c,$f000,$f94a,$2080,$f000,$f975,$2044,$f000,$f944,$19bb,$881b,
     $b2db,$0018,$f000,$f96c,$1dbb,$881b,$b2db,$0018,$f000,$f966,$2045,$f000,$f935,$197b,$881b,$b2db,
     $0018,$f000,$f95d,$197b,$881b,$0a1b,$b29b,$b2db,$2201,$4013,$b2db,$0018,$f000,$f952,$2208,$18bb,
     $191b,$881b,$b2db,$0018,$f000,$f94a,$2208,$18bb,$191b,$881b,$0a1b,$b29b,$b2db,$2201,$4013,$b2db,
     $0018,$f000,$f93d,$204e,$f000,$f90c,$19bb,$881b,$b2db,$0018,$f000,$f934,$204f,$f000,$f903,$197b,
     $881b,$b2db,$0018,$f000,$f92b,$197b,$881b,$0a1b,$b29b,$b2db,$2201,$4013,$b2db,$0018,$f000,$f920,
     $2024,$f000,$f8ef,$2316,$18fb,$2200,$801a,$e00d,$2416,$193b,$881b,$68fa,$18d3,$781b,$0018,$f000,
     $f90f,$193b,$881a,$193b,$3201,$801a,$2316,$18fa,$2312,$18fb,$8812,$881b,$429a,$d3e9,$f000,$fa68,
     $46c0,$46bd,$b007,$bdf0,$b580,$af00,$2010,$f7ff,$f998,$2001,$f7ff,$f9bd,$b580,$af00,$2010,$f000,
     $f8c1,$2001,$f000,$f8ec,$20c8,$f000,$fa69,$46c0,$46bd,$bd80,$0000,$b580,$af00,$4b10,$681b,$b29b,
     $2101,$0018,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,
     $43ec,$2000,$b590,$b087,$af00,$60f8,$60b9,$607a,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,
     $687a,$601a,$4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,
     $601a,$4b13,$681b,$b29b,$2101,$0018,$f000,$fa3c,$4b10,$681b,$b29b,$2101,$0018,$f000,$fa35,$4b0f,
     $681b,$b29b,$2101,$0018,$f000,$fa2e,$4b0a,$681b,$b29b,$2100,$0018,$f000,$fa27,$4b08,$681b,$b29b,
     $2101,$0018,$f000,$fa50,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,
     $4358,$2000,$4364,$2000,$b580,$af00,$2302,$2201,$2103,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,
     $0018,$f000,$fa31,$2064,$f000,$f9ea,$4b0b,$681b,$b29b,$2100,$0018,$f000,$fa27,$2002,$f000,$f9e0,
     $4b06,$681b,$b29b,$2101,$0018,$f000,$fa1d,$2064,$f000,$f9d6,$46c0,$46bd,$bd80,$46c0,$4368,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$b580,$af00,$e002,$200a,$f000,$f9c4,$4b06,$681b,$b29b,$0018,
     $f000,$fa22,$0003,$2b01,$d0f3,$46c0,$46c0,$46bd,$bd80,$46c0,$4354,$2000,$b580,$af00,$2022,$f7ff,
     $ff95,$20f7,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f9e5,$4b0c,
     $681b,$b29b,$2100,$0018,$f000,$f9de,$1dfb,$781b,$0018,$f000,$fa11,$4b06,$681b,$b29b,$2101,$0018,
     $f000,$f9d2,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,$f9b7,$4b0c,$681b,$b29b,
     $2100,$0018,$f000,$f9b0,$1dfb,$781b,$0018,$f000,$f9e3,$4b06,$681b,$b29b,$2101,$0018,$f000,$f9a4,
     $46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$af00,$e002,$200a,$f7f8,$fb61,$b5b0,$b082,
     $af00,$0005,$000c,$0010,$0019,$1dbb,$1c2a,$801a,$1d3b,$1c22,$801a,$1cbb,$1c02,$801a,$003b,$1c0a,
     $801a,$2044,$f7ff,$ff8e,$1dbb,$881b,$08db,$b29b,$b2db,$0018,$f7ff,$ffb4,$1cbb,$881b,$08db,$b29b,
     $b2db,$0018,$f7ff,$ffac,$2045,$f7ff,$ff7b,$1d3b,$881b,$b2db,$0018,$f7ff,$ffa3,$1d3b,$881b,$0a1b,
     $b29b,$b2db,$0018,$f7ff,$ff9b,$003b,$881b,$b2db,$0018,$f7ff,$ff95,$003b,$881b,$0a1b,$b29b,$b2db,
     $0018,$f7ff,$ff8d,$46c0,$46bd,$b002,$bdb0,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$b580,$b082,
     $af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$204e,$f7ff,$ff48,$1dbb,$881b,$b2db,$0018,$f7ff,$ff70,
     $204f,$f7ff,$ff3f,$1d3b,$881b,$b2db,$0018,$f7ff,$ff67,$1d3b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,
     $ff5f,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$2032,$f7ff,$fee4,$1dfb,$b580,$b082,$af00,$2032,
     $f7ff,$ff20,$1dfb,$2200,$701a,$e00b,$1dfb,$781b,$4a2f,$5cd3,$0018,$f7ff,$ff43,$1dfb,$781a,$1dfb,
     $3201,$701a,$1dfb,$781b,$2be2,$d9ef,$203f,$f7ff,$ff09,$1dfb,$781b,$1dfa,$1c59,$7011,$001a,$4b24,
     $5c9b,$0018,$f7ff,$ff2c,$2003,$f7ff,$fefb,$1dfb,$781b,$1dfa,$1c59,$7011,$001a,$4b1d,$5c9b,$0018,
     $f7ff,$ff1e,$2004,$f7ff,$feed,$1dfb,$781b,$1dfa,$1c59,$7011,$001a,$4b16,$5c9b,$0018,$f7ff,$ff10,
     $1dfb,$781b,$1dfa,$1c59,$7011,$001a,$4b10,$5c9b,$0018,$f7ff,$ff05,$1dfb,$781b,$1dfa,$1c59,$7011,
     $001a,$4b0b,$5c9b,$0018,$f7ff,$fefa,$202c,$f7ff,$fec9,$1dfb,$781b,$1dfa,$1c59,$7011,$001a,$4b04,
     $5c9b,$0018,$f7ff,$feec,$46c0,$46bd,$b002,$bd80,$e604,$1000,$b580,$af00,$f7ff,$fe52,$f7ff,$fec6,
     $b580,$af00,$2022,$f7ff,$fead,$20f7,$f7ff,$fed8,$2020,$f7ff,$fea7,$f7ff,$fe89,$46c0,$46bd,$bd80,
     $b580,$af00,$2022,$f7ff,$ff85,$20c7,$f7ff,$ffaa,$b580,$af00,$2022,$f7ff,$fe95,$20c7,$f7ff,$fec0,
     $2020,$f7ff,$fe8f,$f7ff,$fe71,$46c0,$46bd,$bd80,$b580,$af00,$2022,$f7ff,$ff75,$20ff,$f7ff,$ff9a,
     $b580,$af00,$2022,$f7ff,$fe7d,$20cf,$f7ff,$fea8,$2020,$f7ff,$fe77,$f7ff,$fe59,$46c0,$46bd,$bd80,
     $b5b0,$b082,$af00,$0005,$000c,$0010,$0019,$1dbb,$b580,$af00,$2022,$f7ff,$fe65,$20ff,$f7ff,$fe90,
     $2020,$f7ff,$fe5f,$f7ff,$fe41,$46c0,$46bd,$bd80,$b580,$af00,$2022,$f7ff,$ff65,$20cf,$f7ff,$ff8a,
     $b580,$b082,$af00,$6078,$687b,$0018,$f000,$f890,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,
     $60f8,$60b9,$607a,$603b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,
     $f000,$f88c,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f8a0,
     $e006,$1dbb,$881b,$2101,$0018,$f000,$f899,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,
     $687b,$0018,$f7ff,$ff09,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,
     $781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f89c,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1dbb,$881b,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f8a9,$0003,
     $0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$b580,$b084,$af00,$0002,
     $1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f8a6,$46c0,$46bd,$b004,$bd80,
     $b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,
     $f000,$f890,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$b580,$b082,
     $af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,
     $687b,$2105,$0018,$f000,$f88b,$46c0,$46bd,$b002,$bd80,$0000,$b580,$af00,$4b04,$681b,$2202,$4013,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,
     $68fb,$0018,$f000,$f8a8,$e003,$68fb,$0018,$f000,$f8b7,$46c0,$46bd,$b004,$bd80,$b580,$b082,$af00,
     $0002,$1dbb,$801a,$1d7b,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,
     $1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f8ac,$e003,$68fb,$0018,$f000,$f8bb,$46c0,$46bd,$b004,
     $bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,
     $40da,$0013,$2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,
     $061b,$687a,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,
     $697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,$6878,$239a,
     $b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f881,$687b,$009b,$4a12,$4694,$4463,
     $61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,
     $0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,
     $b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,
     $000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,
     $46c0,$46bd,$b002,$bd80,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$b580,$b082,$af00,$6078,
     $46c0,$46bd,$b002,$bd80,$0000,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a

REM 0 bytes
LABEL C_RODATA
