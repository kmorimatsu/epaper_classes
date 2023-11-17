USEVAR C_RAM
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+2628,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+2760,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+2764,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2768,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+2772,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2776,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+2780,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+2856,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2860,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2936,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+2940,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+3172,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+3248,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+3748,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_3IN7_4GRAY_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f84a,$bd00,$46c0
LABEL C_EPD_3IN7_4GRAY_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8de,$bd00,$46c0
LABEL C_EPD_3IN7_4GRAY_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f984,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fb26,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fb5a,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fc00,$bd00,$46c0
LABEL C_EPD_3IN7_1GRAY_DISPLAY_PART
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fc3e,$bd00,$46c0
LABEL C_EPD_3IN7_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd1a,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd1e,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fd26,$bd00,$46c0

REM 4032 bytes
LABEL C_FUNCTIONS
EXEC $b580,$b084,$af00,$1dbb,$2223,$801a,$1d3b,$22f0,$0052,$801a,$2049,$f000,$fd63,$2000,$f000,$fd88,
     $204e,$f000,$fd5d,$2000,$f000,$fd82,$2000,$f000,$fd7f,$204f,$f000,$fd54,$2000,$f000,$fd79,$2000,
     $f000,$fd76,$2024,$f000,$fd4b,$230e,$18fb,$2200,$801a,$e01a,$230c,$18fb,$2200,$801a,$e008,$20ff,
     $f000,$fd66,$210c,$187b,$881a,$187b,$3201,$801a,$230c,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210e,
     $187b,$881a,$187b,$3201,$801a,$230e,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$204e,$f000,$fd21,$2000,
     $f000,$fd46,$2000,$f000,$fd43,$204f,$f000,$fd18,$2000,$f000,$fd3d,$2000,$f000,$fd3a,$2026,$f000,
     $fd0f,$230a,$18fb,$2200,$801a,$e01a,$2308,$18fb,$2200,$801a,$e008,$20ff,$f000,$fd2a,$2108,$187b,
     $881a,$187b,$3201,$801a,$2308,$18fa,$1dbb,$8812,$881b,$429a,$d3ef,$210a,$187b,$881a,$187b,$3201,
     $801a,$230a,$18fa,$1d3b,$8812,$881b,$429a,$d3dd,$2000,$f000,$fd35,$2022,$f000,$fce2,$20c7,$f000,
     $fd07,$2020,$f000,$fcdc,$f000,$fd84,$46c0,$46bd,$b004,$bd80,$b580,$b082,$b580,$af00,$f000,$fd94,
     $2012,$f000,$fccd,$2396,$005b,$0018,$f000,$fdb2,$2046,$f000,$fcc5,$20f7,$f000,$fcea,$f000,$fd6a,
     $2047,$f000,$fcbd,$20f7,$f000,$fce2,$f000,$fd62,$2001,$f000,$fcb5,$20df,$f000,$fcda,$2001,$f000,
     $fcd7,$2000,$f000,$fcd4,$2003,$f000,$fca9,$2000,$f000,$fcce,$2004,$f000,$fca3,$2041,$f000,$fcc8,
     $20a8,$f000,$fcc5,$2032,$f000,$fcc2,$2011,$f000,$fc97,$2003,$f000,$fcbc,$203c,$f000,$fc91,$2003,
     $f000,$fcb6,$200c,$f000,$fc8b,$20ae,$f000,$fcb0,$20c7,$f000,$fcad,$20c3,$f000,$fcaa,$20c0,$f000,
     $fca7,$20c0,$f000,$fca4,$2018,$f000,$fc79,$2080,$f000,$fc9e,$202c,$f000,$fc73,$2044,$f000,$fc98,
     $2037,$f000,$fc6d,$2000,$f000,$fc92,$2000,$f000,$fc8f,$2000,$f000,$fc8c,$2000,$f000,$fc89,$2000,
     $f000,$fc86,$2000,$f000,$fc83,$2000,$f000,$fc80,$2000,$f000,$fc7d,$2000,$f000,$fc7a,$2000,$f000,
     $fc77,$2044,$f000,$fc4c,$2000,$f000,$fc71,$2000,$f000,$fc6e,$2017,$f000,$fc6b,$2001,$f000,$fc68,
     $2045,$f000,$fc3d,$2000,$f000,$fc62,$2000,$f000,$fc5f,$20df,$f000,$fc5c,$2001,$f000,$fc59,$2022,
     $f000,$fc2e,$20cf,$f000,$fc53,$46c0,$46bd,$bd80,$b580,$af00,$b590,$b087,$af00,$6078,$2049,$f000,
     $fc1f,$2000,$f000,$fc44,$204e,$f000,$fc19,$2000,$f000,$fc3e,$2000,$f000,$fc3b,$204f,$f000,$fc10,
     $2000,$f000,$fc35,$2000,$f000,$fc32,$2024,$f000,$fc07,$2300,$617b,$e0a8,$230a,$18fb,$2200,$701a,
     $2300,$613b,$e094,$697b,$005a,$693b,$18d3,$687a,$18d2,$230b,$18fb,$7812,$701a,$2300,$60fb,$e080,
     $2009,$183b,$220b,$18ba,$7812,$213f,$438a,$701a,$183b,$781b,$2bc0,$d107,$220a,$18bb,$18ba,$7812,
     $2101,$430a,$701a,$e01c,$2309,$18fb,$781b,$2b00,$d105,$220a,$18bb,$18ba,$7812,$701a,$e011,$2309,
     $18fb,$781b,$2b80,$d105,$220a,$18bb,$18ba,$7812,$701a,$e006,$220a,$18bb,$18ba,$7812,$2101,$430a,
     $701a,$200a,$183a,$183b,$781b,$18db,$7013,$210b,$187b,$187a,$7812,$0092,$701a,$2409,$193b,$187a,
     $7812,$213f,$438a,$701a,$193b,$781b,$2bc0,$d106,$183b,$183a,$7812,$2101,$430a,$701a,$e01c,$2309,
     $18fb,$781b,$2b00,$d105,$220a,$18bb,$18ba,$7812,$701a,$e011,$2309,$18fb,$781b,$2b80,$d105,$220a,
     $18bb,$18ba,$7812,$701a,$e006,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$693b,$2b01,$d102,$68fb,
     $2b01,$d005,$230a,$18fa,$18fb,$781b,$18db,$7013,$220b,$18bb,$18ba,$7812,$0092,$701a,$68fb,$3301,
     $60fb,$68fb,$2b01,$d800,$e77a,$693b,$3301,$613b,$693b,$2b01,$d800,$e766,$230a,$18fb,$781b,$0018,
     $f000,$fb86,$697b,$3301,$617b,$697b,$4a6d,$4293,$d800,$e751,$204e,$f000,$fb53,$2000,$f000,$fb78,
     $2000,$f000,$fb75,$204f,$f000,$fb4a,$2000,$f000,$fb6f,$2000,$f000,$fb6c,$2026,$f000,$fb41,$2300,
     $617b,$e0a8,$230a,$18fb,$2200,$701a,$2300,$613b,$e094,$697b,$005a,$693b,$18d3,$687a,$18d2,$230b,
     $18fb,$7812,$701a,$2300,$60fb,$e080,$2009,$183b,$220b,$18ba,$7812,$213f,$438a,$701a,$183b,$781b,
     $2bc0,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e01c,$2309,$18fb,$781b,$2b00,$d105,$220a,
     $18bb,$18ba,$7812,$701a,$e011,$2309,$18fb,$781b,$2b80,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,
     $701a,$e004,$220a,$18bb,$18ba,$7812,$701a,$200a,$183a,$183b,$781b,$18db,$7013,$210b,$187b,$187a,
     $7812,$0092,$701a,$2409,$193b,$187a,$7812,$213f,$438a,$701a,$193b,$781b,$2bc0,$d106,$183b,$183a,
     $7812,$2101,$430a,$701a,$e01c,$2309,$18fb,$781b,$2b00,$d105,$220a,$18bb,$18ba,$7812,$701a,$e011,
     $2309,$18fb,$781b,$2b80,$d107,$220a,$18bb,$18ba,$7812,$2101,$430a,$701a,$e004,$220a,$18bb,$18ba,
     $7812,$701a,$693b,$2b01,$d102,$68fb,$2b01,$d005,$230a,$18fa,$18fb,$781b,$18db,$7013,$220b,$18bb,
     $18ba,$7812,$0092,$701a,$68fb,$3301,$60fb,$68fb,$2b01,$d800,$e77a,$693b,$3301,$613b,$693b,$2b01,
     $d800,$e766,$230a,$18fb,$781b,$0018,$f000,$fac0,$697b,$3301,$617b,$697b,$4a0a,$4293,$d800,$e751,
     $2000,$f000,$fadd,$2022,$f000,$fa8a,$20c7,$f000,$faaf,$2020,$f000,$fa84,$f000,$fb2c,$46c0,$46bd,
     $b007,$bd90,$419f,$0000,$b580,$b082,$af00,$1d3b,$4a1a,$801a,$204e,$f000,$fa73,$2000,$f000,$fa98,
     $2000,$f000,$fa95,$204f,$f000,$fa6a,$2000,$f000,$fa8f,$2000,$f000,$fa8c,$2024,$f000,$fa61,$1dbb,
     $2200,$801a,$e007,$20ff,$f000,$fa82,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,$1d3b,$8812,$881b,$429a,
     $d3f1,$2002,$f000,$fa9c,$2020,$f000,$fa49,$f000,$faf1,$46c0,$46bd,$b002,$bd80,$46c0,$41a0,$0000,
     $b580,$af00,$f000,$fb00,$2012,$f000,$fa39,$2396,$005b,$0018,$f000,$fb1e,$2046,$f000,$fa31,$20f7,
     $f000,$fa56,$f000,$fad6,$2047,$f000,$fa29,$20f7,$f000,$fa4e,$f000,$face,$2001,$f000,$fa21,$20df,
     $f000,$fa46,$2001,$f000,$fa43,$2000,$f000,$fa40,$2003,$f000,$fa15,$2000,$f000,$fa3a,$2004,$f000,
     $fa0f,$2041,$f000,$fa34,$20a8,$f000,$fa31,$2032,$f000,$fa2e,$2011,$f000,$fa03,$2003,$f000,$fa28,
     $203c,$f000,$f9fd,$2003,$f000,$fa22,$200c,$f000,$f9f7,$20ae,$f000,$fa1c,$20c7,$f000,$fa19,$20c3,
     $f000,$fa16,$20c0,$f000,$fa13,$20c0,$f000,$fa10,$2018,$f000,$f9e5,$2080,$f000,$fa0a,$202c,$f000,
     $f9df,$2044,$f000,$fa04,$2037,$f000,$f9d9,$2000,$f000,$f9fe,$20ff,$f000,$f9fb,$20ff,$f000,$f9f8,
     $20ff,$f000,$f9f5,$20ff,$f000,$f9f2,$204f,$f000,$f9ef,$20ff,$f000,$f9ec,$20ff,$f000,$f9e9,$20ff,
     $f000,$f9e6,$20ff,$f000,$f9e3,$2044,$f000,$f9b8,$2000,$f000,$f9dd,$2000,$f000,$f9da,$2017,$f000,
     $f9d7,$2001,$f000,$f9d4,$2045,$f000,$f9a9,$2000,$f000,$f9ce,$2000,$f000,$f9cb,$20df,$f000,$f9c8,
     $2001,$f000,$f9c5,$2022,$f000,$f99a,$20cf,$f000,$f9bf,$46c0,$46bd,$bd80,$b580,$b084,$b590,$b085,
     $af00,$6078,$230c,$18fb,$4a1e,$801a,$204e,$f000,$f987,$2000,$f000,$f9ac,$2000,$f000,$f9a9,$204f,
     $f000,$f97e,$2000,$f000,$f9a3,$2000,$f000,$f9a0,$2024,$f000,$f975,$230e,$18fb,$2200,$801a,$e00d,
     $240e,$193b,$881b,$687a,$18d3,$781b,$0018,$f000,$f98f,$193b,$881a,$193b,$3201,$801a,$230e,$18fa,
     $230c,$18fb,$8812,$881b,$429a,$d3e9,$2002,$f000,$f9a7,$2020,$f000,$f954,$f000,$f9fc,$46c0,$46bd,
     $b005,$bd90,$41a0,$0000,$b5f0,$b087,$af00,$60f8,$000c,$0010,$0019,$250a,$197b,$1c22,$801a,$2308,
     $18fb,$1c02,$801a,$1dbb,$1c0a,$801a,$1dbb,$881a,$197b,$881b,$1ad3,$001a,$2307,$4013,$d109,$1dbb,
     $881a,$197b,$881b,$1ad3,$d500,$3307,$10db,$b29b,$e00b,$1dbb,$881a,$230a,$18fb,$881b,$1ad3,$d500,
     $3307,$10db,$b29b,$3301,$b29b,$2014,$183a,$8013,$2428,$2608,$19bb,$191b,$2508,$1979,$881a,$880b,
     $1ad3,$b29a,$2312,$18fb,$1839,$8809,$434a,$801a,$1dbb,$1dba,$8812,$3a01,$801a,$19bb,$191b,$19ba,
     $1912,$8812,$3a01,$801a,$2044,$f000,$f8f9,$260a,$19bb,$881b,$b2db,$0018,$f000,$f91a,$19bb,$881b,
     $0a1b,$b29b,$b2db,$2203,$4013,$b2db,$0018,$f000,$f90f,$1dbb,$881b,$b2db,$0018,$f000,$f909,$1dbb,
     $881b,$0a1b,$b29b,$b2db,$2203,$4013,$b2db,$0018,$f000,$f8fe,$2045,$f000,$f8d3,$197b,$881b,$b2db,
     $0018,$f000,$f8f5,$197b,$881b,$0a1b,$b29b,$b2db,$2203,$4013,$b2db,$0018,$f000,$f8ea,$2308,$18fa,
     $1913,$881b,$b2db,$0018,$f000,$f8e2,$2308,$18fb,$191b,$881b,$0a1b,$b29b,$b2db,$2203,$4013,$b2db,
     $0018,$f000,$f8d5,$204e,$f000,$f8aa,$19bb,$881b,$b2db,$0018,$f000,$f8cc,$204f,$f000,$f8a1,$197b,
     $881b,$b2db,$0018,$f000,$f8c3,$197b,$881b,$0a1b,$b29b,$b2db,$0018,$f000,$f8bb,$2024,$f000,$f890,
     $2316,$18fb,$2200,$801a,$e00d,$2416,$193b,$881b,$68fa,$18d3,$781b,$0018,$f000,$f8aa,$193b,$881a,
     $193b,$3201,$801a,$2316,$18fa,$2312,$18fb,$8812,$881b,$429a,$d3e9,$2003,$f000,$f8c2,$2020,$f000,
     $f86f,$f000,$f917,$46c0,$46bd,$b007,$bdf0,$b580,$b580,$af00,$2010,$f000,$f863,$2003,$f000,$f888,
     $46c0,$46bd,$bd80,$b580,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,
     $bd80,$0000,$43ec,$2000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,
     $601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,
     $2101,$0018,$f000,$f924,$4b10,$681b,$b29b,$2101,$0018,$f000,$f91d,$4b0f,$681b,$b29b,$2101,$0018,
     $f000,$f916,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f90f,$4b08,$681b,$b29b,$2101,$0018,$f000,$f932,
     $46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,$4364,$2000,
     $b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f915,$4b0c,$681b,$b29b,
     $2100,$0018,$f000,$f90e,$1dfb,$781b,$0018,$f000,$f923,$4b06,$681b,$b29b,$2101,$0018,$f000,$f902,
     $46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,
     $b29b,$2101,$0018,$f000,$f8ed,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8e6,$1dfb,$781b,$0018,$f000,
     $f8fb,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8da,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,
     $b580,$b084,$af00,$0002,$1dfb,$701a,$2032,$f7ff,$ffa7,$230e,$18fb,$2200,$801a,$e038,$1dfb,$781b,
     $2b00,$d108,$230e,$18fb,$881b,$4a1e,$5cd3,$0018,$f7ff,$ffbe,$e025,$1dfb,$781b,$2b01,$d108,$230e,
     $18fb,$881b,$4a18,$5cd3,$0018,$f7ff,$ffb1,$e018,$1dfb,$781b,$2b02,$d108,$230e,$18fb,$881b,$4a13,
     $5cd3,$0018,$f7ff,$ffa4,$e00b,$1dfb,$781b,$2b03,$d107,$230e,$18fb,$881b,$4a0d,$5cd3,$0018,$f7ff,
     $ff97,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fb,$881b,$2b68,$d9c1,$46c0,$46c0,$46bd,$b004,
     $bd80,$46c0,$e1a0,$1000,$e20c,$1000,$e278,$1000,$e2e4,$1000,$b590,$b083,$af00,$4b0a,$681b,$b29b,
     $1dfc,$0018,$f000,$f89e,$0003,$7023,$1dfb,$781b,$2b00,$d1f2,$20c8,$f000,$f82d,$46c0,$46bd,$b003,
     $bd90,$46c0,$4354,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f855,$201e,$f000,$f81a,
     $4b0b,$681b,$b29b,$2100,$0018,$f000,$f84b,$2003,$f000,$f810,$4b06,$681b,$b29b,$2101,$0018,$f000,
     $f841,$201e,$f000,$f806,$46c0,$46bd,$bd80,$46c0,$4368,$2000,$b580,$b082,$af00,$6078,$687b,$0018,
     $f000,$f872,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,
     $801a,$1dbb,$881b,$0018,$f000,$f86e,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,
     $2100,$0018,$f000,$f87c,$e006,$1dbb,$881b,$2101,$0018,$f000,$f875,$46c0,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,
     $418b,$b2db,$0019,$0010,$f000,$f878,$46c0,$46bd,$b002,$bd80,$b580,$b082,$b580,$b084,$af00,$0002,
     $1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f880,$46c0,$46bd,$b004,$bd80,
     $b580,$b082,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f887,$0003,$0018,$46bd,
     $b002,$bd80,$b580,$b082,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f85e,$46c0,$46bd,
     $b002,$bd80,$b580,$b084,$b580,$b082,$af00,$6078,$23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,
     $061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,$f86d,$46c0,$46bd,$b002,$bd80,$0000,
     $b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,
     $68fb,$0018,$f000,$f88a,$e003,$68fb,$0018,$f000,$f893,$46c0,$46bd,$b004,$bd80,$b580,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,
     $f000,$f888,$e003,$68fb,$0018,$f000,$f891,$46c0,$46bd,$b004,$bd80,$b580,$b590,$b087,$af00,$60f8,
     $60b9,$607a,$603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,
     $bd90,$46c0,$43ec,$2000,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,
     $1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b580,$b088,$af00,$6078,$000a,$1cfb,$701a,$687b,
     $0018,$f000,$f863,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,$61bb,$23c0,$617b,$69fb,$681a,$69bb,
     $4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,$68fa,$601a,$46c0,$46c0,$4906,$1cfb,
     $781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,$c004,$4001,$4000,$4001,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$b580,$b082,$af00,$6078,
     $23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$b580,$b082,$af00,$6078,$23d0,$061b,
     $687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,
     $46c0,$46bd,$b002,$bd80,$b580,$b084,$b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$0000,$b580

REM 0 bytes
LABEL C_RODATA