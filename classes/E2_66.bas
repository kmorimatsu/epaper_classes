USEVAR C_RAM
GOSUB INIT_C
END

LABEL INIT_C
  DIM C_RAM(31)
  REM ram vectors
  POKE32 DATAADDRESS(C_FUNCTIONS)+616,C_RAM+0
  POKE32 DATAADDRESS(C_FUNCTIONS)+748,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+752,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+756,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+760,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+764,C_RAM+92
  POKE32 DATAADDRESS(C_FUNCTIONS)+768,C_RAM+108
  POKE32 DATAADDRESS(C_FUNCTIONS)+844,C_RAM+28
  POKE32 DATAADDRESS(C_FUNCTIONS)+896,C_RAM+60
  POKE32 DATAADDRESS(C_FUNCTIONS)+972,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+976,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1052,C_RAM+44
  POKE32 DATAADDRESS(C_FUNCTIONS)+1056,C_RAM+76
  POKE32 DATAADDRESS(C_FUNCTIONS)+1688,C_RAM+0
  REM rodata vectors
  REM ram function vectors
  REM callback function vectors
  REM Initialize C global variables
  GOSUB C_MACHIKANIA_INIT
RETURN

ALIGN4
LABEL C_EPD_2IN66_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f832,$bd00,$46c0
LABEL C_EPD_2IN66_INIT_PARTIAL
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f85a,$bd00,$46c0
LABEL C_EPD_2IN66_CLEAR
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8b4,$bd00,$46c0
LABEL C_EPD_2IN66_DISPLAY
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f8e2,$bd00,$46c0
LABEL C_EPD_2IN66_SLEEP
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f92c,$bd00,$46c0
LABEL C_MACHIKANIA_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f930,$bd00,$46c0
LABEL C_DEV_GPIO_INIT
  EXEC $68f0,$6931,$6972,$69b3,$f000,$f938,$bd00,$46c0

REM 1932 bytes
LABEL C_FUNCTIONS
EXEC $b580,$af00,$f000,$f97e,$f000,$f9a2,$2012,$f000,$f9b9,$f000,$f99d,$2011,$f000,$f9b4,$2003,$f000,
     $f9d9,$2044,$f000,$f9ae,$2001,$f000,$f9d3,$2013,$f000,$f9d0,$2045,$f000,$f9a5,$2000,$f000,$f9ca,
     $2000,$f000,$f9c7,$2028,$f000,$f9c4,$2001,$f000,$f9c1,$f000,$f97d,$46c0,$46bd,$bd80,$b580,$af00,
     $b580,$af00,$f000,$f94e,$f000,$f972,$2012,$f000,$f989,$f000,$f96d,$f000,$f9d5,$2037,$f000,$f982,
     $2000,$f000,$f9a7,$2000,$f000,$f9a4,$2000,$f000,$f9a1,$2000,$f000,$f99e,$2000,$f000,$f99b,$2040,
     $f000,$f998,$2000,$f000,$f995,$2000,$f000,$f992,$2000,$f000,$f98f,$2000,$f000,$f98c,$2011,$f000,
     $f961,$2003,$f000,$f986,$2044,$f000,$f95b,$2001,$f000,$f980,$2013,$f000,$f97d,$2045,$f000,$f952,
     $2000,$f000,$f977,$2000,$f000,$f974,$2028,$f000,$f971,$2001,$f000,$f96e,$203c,$f000,$f943,$2080,
     $f000,$f968,$2022,$f000,$f93d,$20cf,$f000,$f962,$2020,$f000,$f937,$f000,$f91b,$46c0,$46bd,$bd80,
     $b580,$b082,$b580,$b082,$af00,$1cbb,$2213,$801a,$003b,$2294,$0052,$801a,$2024,$f000,$f923,$1dbb,
     $2200,$801a,$e016,$1d3b,$2200,$801a,$e007,$20ff,$f000,$f940,$1d3b,$881a,$1d3b,$3201,$801a,$1d3a,
     $1cbb,$8812,$881b,$429a,$d3f1,$1dbb,$881a,$1dbb,$3201,$801a,$1dba,$003b,$8812,$881b,$429a,$d9e2,
     $f000,$f972,$46c0,$46bd,$b002,$bd80,$b590,$b087,$b590,$b087,$af00,$6078,$2312,$18fb,$2213,$801a,
     $2310,$18fb,$2294,$0052,$801a,$2300,$60fb,$2024,$f000,$f8e8,$2316,$18fb,$2200,$801a,$e02a,$2314,
     $18fb,$2200,$801a,$e017,$2414,$193b,$881a,$2316,$18fb,$881b,$2112,$1879,$8809,$434b,$18d3,$60fb,
     $687a,$68fb,$18d3,$781b,$0018,$f000,$f8f3,$193b,$881a,$193b,$3201,$801a,$2314,$18fa,$2312,$18fb,
     $8812,$881b,$429a,$d3df,$2116,$187b,$881a,$187b,$3201,$801a,$2316,$18fa,$2310,$18fb,$8812,$881b,
     $429a,$d3cc,$f000,$f920,$46c0,$46bd,$b007,$bd90,$b580,$af00,$b580,$af00,$2010,$f000,$f8a3,$2001,
     $f000,$f8c8,$46c0,$46bd,$bd80,$0000,$b580,$af00,$b403,$4905,$600d,$604e,$608f,$4640,$60c8,$bc03,
     $46c0,$46bd,$bd80,$0000,$43ec,$2000,$b580,$b084,$af00,$60f8,$60b9,$607a,$603b,$4b1c,$687a,$601a,
     $4b1b,$68fa,$601a,$4b1b,$683a,$601a,$4b1a,$68ba,$601a,$4b1a,$2212,$601a,$4b19,$2213,$601a,$4b13,
     $681b,$b29b,$2101,$0018,$f000,$f8ea,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8e3,$4b0f,$681b,$b29b,
     $2101,$0018,$f000,$f8dc,$4b0a,$681b,$b29b,$2100,$0018,$f000,$f8d5,$4b08,$681b,$b29b,$2101,$0018,
     $f000,$f8f8,$46c0,$46bd,$b004,$bd80,$4368,$2000,$4360,$2000,$4354,$2000,$435c,$2000,$4358,$2000,
     $4364,$2000,$b580,$af00,$4b10,$681b,$b29b,$2101,$0018,$f000,$f8df,$20c8,$f000,$f8f6,$4b0b,$681b,
     $b29b,$2100,$0018,$f000,$f8d5,$2002,$f000,$f8ec,$4b06,$681b,$b29b,$2101,$0018,$f000,$f8cb,$20c8,
     $f000,$f8e2,$46c0,$46bd,$bd80,$46c0,$4368,$2000,$b580,$af00,$2064,$f000,$f8d7,$e002,$2064,$f000,
     $f8d3,$4b07,$681b,$b29b,$0018,$f000,$f8db,$0003,$2b01,$d0f3,$2064,$f000,$f8c7,$46c0,$46bd,$bd80,
     $4354,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,$4b0e,$681b,$b29b,$2100,$0018,$f000,$f89b,$4b0c,
     $681b,$b29b,$2100,$0018,$f000,$f894,$1dfb,$781b,$0018,$f000,$f8c9,$4b06,$681b,$b29b,$2101,$0018,
     $f000,$f888,$46c0,$46bd,$b002,$bd80,$4360,$2000,$435c,$2000,$b580,$b082,$af00,$0002,$1dfb,$701a,
     $4b0e,$681b,$b29b,$2101,$0018,$f000,$f873,$4b0c,$681b,$b29b,$2100,$0018,$f000,$f86c,$1dfb,$781b,
     $0018,$f000,$f8a1,$4b06,$681b,$b29b,$2101,$0018,$f000,$f860,$46c0,$46bd,$b002,$bd80,$4360,$2000,
     $435c,$2000,$b580,$b082,$af00,$2032,$f7ff,$ffaa,$1dbb,$2200,$801a,$e00b,$1dbb,$881b,$4a09,$5cd3,
     $0018,$f7ff,$ffc7,$1dbb,$881a,$1dbb,$3201,$801a,$1dbb,$881b,$2b98,$d9ef,$f7ff,$ff7a,$46c0,$46bd,
     $b002,$bd80,$dd90,$1000,$b580,$af00,$2020,$f7ff,$ff89,$f7ff,$ff6d,$46c0,$46bd,$bd80,$b580,$b082,
     $b580,$b082,$af00,$0002,$1dbb,$801a,$1d3b,$1c0a,$801a,$1dbb,$881b,$0018,$f000,$f86c,$1d3b,$881b,
     $2b00,$d003,$1d3b,$881b,$2b00,$d106,$1dbb,$881b,$2100,$0018,$f000,$f87a,$e006,$1dbb,$881b,$2101,
     $0018,$f000,$f873,$46c0,$46c0,$46bd,$b002,$bd80,$b580,$b082,$b580,$b082,$af00,$0002,$1dbb,$801a,
     $1d7b,$1c0a,$701a,$1dbb,$881a,$1d7b,$781b,$1e59,$418b,$b2db,$0019,$0010,$f000,$f876,$46c0,$46bd,
     $b002,$bd80,$b580,$b082,$b580,$b082,$af00,$6078,$687b,$0018,$f000,$f886,$46c0,$46bd,$b002,$bd80,
     $0000,$b580,$b580,$b082,$af00,$0002,$1dbb,$801a,$1dbb,$881b,$0018,$f000,$f885,$0003,$0018,$46bd,
     $b002,$bd80,$b580,$b082,$b580,$b084,$af00,$0002,$1dfb,$701a,$1dfb,$781b,$60fb,$230c,$18f9,$2394,
     $2203,$2001,$f000,$f882,$46c0,$46bd,$b004,$bd80,$b580,$b082,$b580,$b082,$af00,$6078,$23d0,$061b,
     $2101,$687a,$4091,$000a,$629a,$23d0,$061b,$2101,$687a,$4091,$000a,$619a,$687b,$2105,$0018,$f000,
     $f87d,$46c0,$46bd,$b002,$bd80,$0000,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,
     $0013,$60fb,$1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f89a,$e003,$68fb,$0018,$f000,$f8a3,$46c0,
     $46bd,$b004,$bd80,$b580,$b580,$b084,$af00,$6078,$000a,$1cfb,$701a,$2201,$687b,$409a,$0013,$60fb,
     $1cfb,$781b,$2b00,$d004,$68fb,$0018,$f000,$f898,$e003,$68fb,$0018,$f000,$f8a1,$46c0,$46bd,$b004,
     $bd80,$b580,$b580,$b082,$af00,$6078,$6878,$239a,$2200,$2100,$f000,$f81a,$46c0,$46bd,$b002,$bd80,
     $b580,$b084,$b580,$b082,$af00,$6078,$23d0,$061b,$685a,$687b,$40da,$0013,$2201,$4013,$1e5a,$4193,
     $b2db,$0018,$46bd,$b002,$bd80,$b580,$b590,$b087,$af00,$60f8,$60b9,$607a,$603b,$4b07,$68db,$617b,
     $683b,$687a,$68b9,$68f8,$697c,$47a0,$0003,$0018,$46bd,$b007,$bd90,$46c0,$43ec,$2000,$b580,$b088,
     $af00,$6078,$000a,$1cfb,$701a,$687b,$0018,$f000,$f863,$687b,$009b,$4a12,$4694,$4463,$61fb,$2340,
     $61bb,$23c0,$617b,$69fb,$681a,$69bb,$4053,$697a,$4013,$69fa,$613a,$60fb,$693b,$2280,$0152,$4313,
     $68fa,$601a,$46c0,$46c0,$4906,$1cfb,$781a,$687b,$00db,$18cb,$3304,$601a,$46c0,$46bd,$b008,$bd80,
     $c004,$4001,$4000,$4001,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$625a,$46c0,$46bd,$b002,$bd80,
     $b580,$b082,$b580,$b082,$af00,$6078,$23d0,$061b,$687a,$629a,$46c0,$46bd,$b002,$bd80,$b580,$b084,
     $b580,$b082,$af00,$6078,$23d0,$061b,$687a,$615a,$46c0,$46bd,$b002,$bd80,$b580,$b082,$b580,$b082,
     $af00,$6078,$23d0,$061b,$687a,$619a,$46c0,$46bd,$b002,$bd80,$b580,$b084,$b580,$b082,$af00,$6078,
     $46c0,$46bd,$b002,$bd80,$0000,$b580

REM 0 bytes
LABEL C_RODATA
