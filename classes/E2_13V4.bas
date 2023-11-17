USEVAR C_RAM
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+1312,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1376,C_RAM+16
  POKE32 DATAADDRESS(C_FUNCTIONS)+1508,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1512,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1516,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1520,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1524,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+1528,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+1604,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+1652,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+1728,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1732,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1808,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1812,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+2688,C_RAM+16
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN13_V4_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f852,$bd00,$46c0
LABEL C_EPD_2IN13_V4_INIT_FAST
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f88c,$bd00,$46c0
LABEL C_EPD_2IN13_V4_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8c6,$bd00,$46c0
LABEL C_EPD_2IN13_V4_CLEAR_BLACK
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8f2,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f91e,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY_FAST
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f964,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY_BASE
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f9aa,$bd00,$46c0
LABEL C_EPD_2IN13_V4_DISPLAY_PARTIAL
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fa2a,$bd00,$46c0
LABEL C_EPD_2IN13_V4_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$faa4,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$faac,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$fab4,$bd00,$46c0

REM 2932 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$fafa,$f000,$fb1e,$2012,$f000,$fb33,$f000,$fb19,$2001,$f000,$fb2e,$20f9,$f000,
     $fb53,$2000,$f000,$fb50,$2000,$f000,$fb4d,$2011,$f000,$fb22,$2003,$f000,$fb47,$23f9,$2279,$2100,
     $2000,$f000,$fb69,$2100,$2000,$f000,$fbaf,$203c,$f000,$fb12,$2005,$f000,$fb37,$2021,$f000,$fb0c,
     $2000,$f000,$fb31,$2080,$f000,$fb2e,$2018,$f000,$fb03,$2080,$f000,$fb28,$f000,$fae6,$46c0,$46bd,
     $bd80,$b580,$b580,$af00,$f000,$fab8,$2012,$f000,$faf3,$f000,$fad9,$2018,$f000,$faee,$2080,$f000,
     $fb13,$2011,$f000,$fae8,$2003,$f000,$fb0d,$23f9,$2279,$2100,$2000,$f000,$fb2f,$2100,$2000,$f000,
     $fb75,$2022,$f000,$fad8,$20b1,$f000,$fafd,$2020,$f000,$fad2,$f000,$fab8,$201a,$f000,$facd,$2064,
     $f000,$faf2,$2000,$f000,$faef,$2022,$f000,$fac4,$2091,$f000,$fae9,$2020,$f000,$fabe,$f000,$faa4,
     $46c0,$46bd,$bd80,$b580,$b580,$b082,$af00,$1cbb,$2210,$801a,$003b,$22fa,$801a,$2024,$f000,$faac,
     $1dbb,$2200,$801a,$e016,$1d3b,$2200,$801a,$e007,$20ff,$f000,$fac9,$1d3b,$881a,$1d3b,$3201,$801a,
     $1d3a,$1cbb,$8812,$881b,$429a,$d3f1,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,$003b,$8812,$881b,$429a,
     $d3e2,$f000,$fb4b,$46c0,$46bd,$b002,$bd80,$b580,$b580,$b082,$af00,$1cbb,$2210,$801a,$003b,$22fa,
     $801a,$2024,$f000,$fa78,$1dbb,$2200,$801a,$e016,$1d3b,$2200,$801a,$e007,$2000,$f000,$fa95,$1d3b,
     $881a,$1d3b,$3201,$801a,$1d3a,$1cbb,$8812,$881b,$429a,$d3f1,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,
     $003b,$8812,$881b,$429a,$d3e2,$f000,$fb17,$46c0,$46bd,$b002,$bd80,$b590,$b590,$b085,$af00,$6078,
     $230a,$18fb,$2210,$801a,$2308,$18fb,$22fa,$801a,$2024,$f000,$fa41,$230e,$18fb,$2200,$801a,$e029,
     $230c,$18fb,$2200,$801a,$e016,$240c,$193b,$881a,$230e,$18fb,$881b,$210a,$1879,$8809,$434b,$18d3,
     $001a,$687b,$189b,$781b,$0018,$f000,$fa4d,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,$18fb,
     $8812,$881b,$429a,$d3e0,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$2308,$18fb,$8812,$881b,
     $429a,$d3cd,$f000,$faca,$46c0,$46bd,$b005,$bd90,$b590,$b085,$b590,$b085,$af00,$6078,$230a,$18fb,
     $2210,$801a,$2308,$18fb,$22fa,$801a,$2024,$f000,$f9f3,$230e,$18fb,$2200,$801a,$e029,$230c,$18fb,
     $2200,$801a,$e016,$240c,$193b,$881a,$230e,$18fb,$881b,$210a,$1879,$8809,$434b,$18d3,$001a,$687b,
     $189b,$781b,$0018,$f000,$f9ff,$193b,$881a,$193b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,$881b,
     $429a,$d3e0,$210e,$187b,$881a,$187b,$3201,$801a,$230e,$18fa,$2308,$18fb,$8812,$881b,$429a,$d3cd,
     $f000,$fa8e,$46c0,$46bd,$b005,$bd90,$b590,$b087,$b590,$b087,$af00,$6078,$230e,$18fb,$2210,$801a,
     $230c,$18fb,$22fa,$801a,$2024,$f000,$f9a5,$2316,$18fb,$2200,$801a,$e029,$2314,$18fb,$2200,$801a,
     $e016,$2414,$193b,$881a,$2316,$18fb,$881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,
     $0018,$f000,$f9b1,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,
     $2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$2026,$f000,
     $f96b,$2312,$18fb,$2200,$801a,$e029,$2310,$18fb,$2200,$801a,$e016,$2410,$193b,$881a,$2312,$18fb,
     $881b,$210e,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f977,$193b,$881a,$193b,
     $3201,$801a,$2310,$18fa,$230e,$18fb,$8812,$881b,$429a,$d3e0,$2112,$187b,$881a,$187b,$3201,$801a,
     $2312,$18fa,$230c,$18fb,$8812,$881b,$429a,$d3cd,$f000,$f9f4,$46c0,$46bd,$b007,$bd90,$b590,$b085,
     $b590,$b085,$af00,$6078,$230a,$18fb,$2210,$801a,$2308,$18fb,$22fa,$801a,$4b39,$681b,$b29b,$2100,
     $0018,$f000,$f9ff,$2001,$f000,$fa16,$4b34,$681b,$b29b,$2101,$0018,$f000,$f9f5,$203c,$f000,$f90c,
     $2080,$f000,$f931,$2001,$f000,$f906,$20f9,$f000,$f92b,$2000,$f000,$f928,$2000,$f000,$f925,$2011,
     $f000,$f8fa,$2003,$f000,$f91f,$23f9,$2279,$2100,$2000,$f000,$f941,$2100,$2000,$f000,$f987,$2024,
     $f000,$f8ea,$230e,$18fb,$2200,$801a,$e029,$230c,$18fb,$2200,$801a,$e016,$240c,$193b,$881a,$230e,
     $18fb,$881b,$210a,$1879,$8809,$434b,$18d3,$001a,$687b,$189b,$781b,$0018,$f000,$f8f6,$193b,$881a,
     $193b,$3201,$801a,$230c,$18fa,$230a,$18fb,$8812,$881b,$429a,$d3e0,$210e,$187b,$881a,$187b,$3201,
     $801a,$230e,$18fa,$2308,$18fb,$8812,$881b,$429a,$d3cd,$f000,$f9bf,$46c0,$46bd,$b005,$bd90,$46c0,
     $4368,$2000,$b580,$af00,$2010,$f000,$f8a5,$2001,$f000,$f8ca,$2064,$f000,$f99f,$46c0,$46bd,$bd80,
     $b580,$af00,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,$46c0,$46bd,$bd80,$0000,
     $43ec,$2000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,$4b1b,$68fa,$601a,$4b1b,
     $683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,$681b,$b29b,$2101,$0018,
     $f000,$f98a,$4b10,$681b,$b29b,$2101,$0018,$f000,$f983,$4b0f,$681b,$b29b,$2101,$0018,$f000,$f97c,
     $4b0a,$681b,$b29b,$2100,$0018,$f000,$f975,$4b08,$681b,$b29b,$2101,$0018,$f000,$f934,$46c0,$46bd,
     $b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,$4364,$2000,$b580,$af00,
     $4b10,$681b,$b29b,$2101,$0018,$f000,$f91b,$2014,$f000,$f932,$4b0b,$681b,$b29b,$2100,$0018,$f000,
     $f911,$2002,$f000,$f928,$4b06,$681b,$b29b,$2101,$0018,$f000,$f907,$2014,$f000,$f91e,$46c0,$46bd,
     $bd80,$46c0,$4368,$2000,$b580,$af00,$4b09,$681b,$b29b,$0018,$f000,$f95a,$1e03,$d003,$200a,$f000,
     $f90b,$e7f3,$46c0,$200a,$f000,$f906,$46c0,$46bd,$bd80,$46c0,$4354,$2000,$b580,$b082,$af00,$0002,
     $1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f8d9,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8d2,
     $1dfb,$781b,$0018,$f000,$f943,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8c6,$46c0,$46bd,$b002,$bd80,
     $4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2101,$0018,$f000,
     $f8b1,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f8aa,$1dfb,$781b,$0018,$f000,$f91b,$4b06,$681b,$b29b,
     $2101,$0018,$f000,$f89e,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b5b0,$b082,$af00,$0005,
     $000c,$0010,$0019,$1dbb,$1c2a,$801a,$1d3b,$1c22,$801a,$1cbb,$1c02,$801a,$003b,$1c0a,$801a,$2044,
     $f7ff,$ff9a,$1dbb,$881b,$08db,$b29b,$b2db,$0018,$f7ff,$ffba,$1cbb,$881b,$08db,$b29b,$b2db,$0018,
     $f7ff,$ffb2,$2045,$f7ff,$ff87,$1d3b,$881b,$b2db,$0018,$f7ff,$ffa9,$1d3b,$881b,$0a1b,$b29b,$b2db,
     $0018,$f7ff,$ffa1,$003b,$881b,$b2db,$0018,$f7ff,$ff9b,$003b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,
     $ff93,$46c0,$46bd,$b002,$bdb0,$b580,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$204e,
     $f7ff,$ff5a,$1dbb,$881b,$b2db,$0018,$f7ff,$ff7c,$204f,$f7ff,$ff51,$1d3b,$881b,$b2db,$0018,$f7ff,
     $ff73,$1d3b,$881b,$0a1b,$b29b,$b2db,$0018,$f7ff,$ff6b,$46c0,$46bd,$b002,$bd80,$b580,$b580,$af00,
     $2022,$f7ff,$ff39,$20f7,$f7ff,$ff5e,$2020,$f7ff,$ff33,$f7ff,$ff19,$46c0,$46bd,$bd80,$b580,$af00,
     $b580,$af00,$2022,$f7ff,$ff27,$20c7,$f7ff,$ff4c,$2020,$f7ff,$ff21,$f7ff,$ff07,$46c0,$46bd,$bd80,
     $b580,$af00,$b580,$b082,$af00,$0002,$1dbb,$801a,$1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,
     $418b,$b2db,$0019,$0010,$f000,$f878,$46c0,$46bd,$b002,$bd80,$b580,$b082,$b580,$b082,$af00,$6078,
     $687b,$0018,$f000,$f888,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b580,$af00,$2022,$f7ff,$feed,$20ff,
     $f7ff,$ff12,$2020,$f7ff,$fee7,$f7ff,$fecd,$46c0,$46bd,$bd80,$b580,$af00,$b580,$b082,$af00,$0002,
     $1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f872,$1d3b,$881b,$2b00,$d003,$1d3b,$881b,
     $2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f880,$e006,$1dbb,$881b,$2101,$0018,$f000,$f879,$46c0,
     $46c0,$46bd,$b002,$bd80,$b580,$b082,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,
     $f885,$0003,$0018,$46bd,$b002,$bd80,$b580,$b082,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,
     $60fb,$230c,$18f9,$2394,$2203,$2001,$f000,$f882,$46c0,$46bd,$b004,$bd80,$b580,$b082,$b580,$b084,
     $af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,
     $f000,$f880,$e003,$68fb,$0018,$f000,$f889,$46c0,$46bd,$b004,$bd80,$b580,$b580,$b082,$af00,$6078,
     $6878,$239a,$2200,$2100,$f000,$f854,$46c0,$46bd,$b002,$bd80,$b580,$b084,$b580,$b082,$af00,$6078,
     $23d0,$061b,$2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,
     $0018,$f000,$f86b,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,
     $687b,$409a,$0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f888,$e003,$68fb,$0018,$f000,
     $f891,$46c0,$46bd,$b004,$bd80,$b580,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,
     $2201,$4013,$1e5a,$4193,$b2db,$0018,$46bd,$b002,$bd80,$b580,$b590,$b087,$af00,$60f8,$60b9,$607a,
     $603b,$4b07,$68db,$617b,$683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,
     $43ec,$2000,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$b580,$b088,
     $af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f847,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,
     $61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,
     $68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,
     $c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $b580,$b082,$af00,$6078,$46c0,$46bd,$b002,$bd80,$0000,$b580

REM 0 bytes
LABEL C_RODATA