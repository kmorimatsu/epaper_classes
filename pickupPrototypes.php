<?php

//date_default_timezone_set('America/Los_Angeles');
date_default_timezone_set('Etc/UCT');

$cfiles='';
$includes='';
$config=array();
$ptypes=array();
$dir = 'c/e-Paper';
foreach (glob($dir . '/*.h') as $filename) {
	$cfiles.=preg_replace('/h$/','c',$filename)."\n";
	$includes.='#include "'.$filename.'"'."\n";
	$classname=preg_replace('/(^.*EPD_|\.h$)/','',$filename);
	$classname=preg_replace('/_V/','V',$classname);
	$classname=preg_replace('/([0-9])in([0-9])/i','$1_$2',$classname);
	$classname='E'.$classname;
	$config[$classname]=array();
	//echo $classname."\n";
	foreach(open_h_file($filename) as $ptype) {
		if (preg_match('/EPD_2in13_V4_Init_GUI[\s]*\(/',$ptype)) continue;
		$ptypes[]=$ptype;
		preg_match('/(EPD_[^\s\(]*)[\s]*\(/',$ptype,$m);
		//echo $m[1];exit;
		$config[$classname][]=$m[1];
	}
}
//print_r($ptypes);

//print_r($config);
$ctext='';
foreach($config as $name=>$funcs){
	$ctext.="\$conf['$name']=array(\n";
	//print_r($funcs);
	for($i=0;$i<count($funcs);$i++){
		$ctext.="\t'".$funcs[$i]."',\n";
	}
	$ctext.=");\n";
}

$callcodes='';
$argtypes=array();
for($i=0;$i<count($ptypes);$i++){
	$ptype=$ptypes[$i];
	if (preg_match('/EPD_2in13_V4_Init_GUI[\s]*\(/',$ptype)) continue;
	$ptype=preg_replace('/^void /','',$ptype);
	$callcodes.=preg_replace('/('.
			'void|'.
			'UBYTE[\s\*]+|'.
			'UWORD[\s\*]+|'.
			'const[\s]+)/','',$ptype)."\n";
	preg_match('/\((.*)\)/',$ptype,$m);
	//echo $m[1],"\n";
	preg_match_all('/,?([^,]+)/',$m[1],$m);
	//print_r($m[1]);
	for($j=0;$j<count($m[1]);$j++) {
		$arg=trim($m[1][$j]);
		$arg=preg_replace('/const[\s]+/','',$arg);
		$argtypes[$arg]=true;
	}
}
//print_r($argtypes);
$vars='';
foreach($argtypes as $arg=>$value) {
	if ('void'!=$arg) $vars.=$arg.";\n";
}

$result='';
$result.=$cfiles;
$result.=$includes;
$result.=$vars;
$result.=$callcodes;
$result.=$ctext;
echo $result;
file_put_contents('./result.txt',$result);
exit;

function open_h_file($filename){
	//echo "$filename\n";
	$hfile=file_get_contents($filename);
	preg_match_all('/[\r\n]([a-zA-Z]+ EPD_.*)/',$hfile,$m);
	//print_r($m[1]);
	return $m[1];
}

