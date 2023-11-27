<?php

//date_default_timezone_set('America/Los_Angeles');
date_default_timezone_set('Etc/UCT');

$initcode='method INIT
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
';

$dir = 'classes';
foreach (glob($dir . '/*.bas') as $filename) {
	echo "$filename \n";
	$basfile=file_get_contents($filename);
	$usevarcram=strpos($basfile,"USEVAR C_RAM\n");
	if (!$usevarcram) exit('error '.__LINE__);
	$labelinitc=strpos($basfile,"LABEL INIT_C\n");
	if (!$labelinitc) exit('error '.__LINE__);
	//echo "$labelinitc \n";
	if (!preg_match_all('/LABEL C_(EPD_.*)\n/',$basfile,$m)) exit('error '.__LINE__);
	$result=substr($basfile,0,$usevarcram)."USEVAR C_RAM\n\n";
	for($i=0;$i<count($m[1]);$i++){
		$result.='method '.$m[1][$i]."\n  goto C_".$m[1][$i]."\n";
	}
	$result.="\n".$initcode;
	$result.="\n".substr($basfile,$labelinitc);
	file_put_contents($filename,$result);
}
