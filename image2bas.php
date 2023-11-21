<?php

//date_default_timezone_set('America/Los_Angeles');
date_default_timezone_set('Etc/UCT');

$image=preg_split('/[\r\n]{1,2}/',file_get_contents('./c/e-Paper/ImageData.c'));

$license="rem \nrem 	This file was copied from Waveshare C library and modified by Katsumi. \nrem \n";
for($i=0;$i<count($image);$i++){
	$license.='rem '.$image[$i]."\n";
	if (false!==strpos($image[$i],'*/')) break;
}
$license.="\n";

$filenames=array();
$filenames["flagimage"]            ="flag.bas";
$filenames["gImage_2in13_2"]       ="i2in13.bas";
$filenames["gImage_2in9"]          ="i2in9.bas";
$filenames["gImage_2in9_4gray"]    ="i2in9.bas";
$filenames["gImage_2in9bc_b"]      ="i2in9bc.bas";
$filenames["gImage_2in9bc_ry"]     ="i2in9bc.bas";
$filenames["gImage_2in13"]         ="i2in13.bas";
$filenames["gImage_2in13b_V4b"]    ="i2in13b4.bas";
$filenames["gImage_2in13b_V4r"]    ="i2in13b4.bas";
$filenames["gImage_2in13b_b"]      ="i2in13b.bas";
$filenames["gImage_2in13b_r"]      ="i2in13b.bas";
$filenames["gImage_2in13c_b"]      ="i2in13c.bas";
$filenames["gImage_2in13c_y"]      ="i2in13c.bas";
$filenames["gImage_2in13d"]        ="i2in13d.bas";
$filenames["gImage_2in66"]         ="i2in66.bas";
$filenames["gImage_2in66br"]       ="i2in66b.bas";
$filenames["gImage_2in66bb"]       ="i2in66b.bas";
$filenames["gImage_2in7"]          ="i2in7.bas";
$filenames["gImage_2in7b_Black"]   ="i2in7b.bas";
$filenames["gImage_2in7b_Red"]     ="i2in7b.bas";
$filenames["gImage_2in7b_Red_V2"]  ="i2in7b2.bas";
$filenames["gImage_2in7b_Black_V2"]="i2in7b2.bas";
$filenames["gImage_2in7_4Gray"]    ="i2in7.bas";
$filenames["gImage_2in7_4Gray_1"]  ="i2in7.bas";
$filenames["gImage_4in2"]          ="i4in2.bas";
$filenames["gImage_4in2_4Gray"]    ="i4in2.bas";
$filenames["gImage_4in2_4Gray1"]   ="i4in2.bas";
$filenames["gImage_4in2bc_b"]      ="i4in2bc.bas";
$filenames["gImage_4in2bc_ry"]     ="i4in2bc.bas";
$filenames["gImage_5in65f"]        ="i5in65f.bas";
$filenames["gImage_5in83_V2"]      ="i5in83V2.bas";
$filenames["gImage_5in83b_V2_b"]   ="i5in83b2.bas";
$filenames["gImage_5in83b_V2_r"]   ="i5in83b2.bas";
$filenames["gImage_7in5_V2"]       ="i7in5V2.bas";
$filenames["gImage_7in5_V2_b"]     ="i7in5V2.bas";
$filenames["gImage_7in5_V2_ry"]    ="i7in5V2.bas";
//print_r($filenames);exit;
foreach($filenames as $fname){
	//echo "$fname \n";
	file_put_contents('./images/'.$fname,$license);
}

for($i=0;$i<count($image);$i++){
	$line=$image[$i];
	if (!preg_match('/^const unsigned char (.*)\[/',$line,$m)) continue;
	if (!$filenames[$m[1]]) exit('error '.__LINE__);
	//echo '$filenames["'.$m[1].'"]="'.$m[1],'";',"\n";
	$imagename=$m[1];
	$fname=$filenames[$m[1]];
	echo "file: $fname \n";
	echo "                       image: $imagename \n";
	$i++;
	$datalines='';
	$datalines.='label array_'.$imagename."\n";
	while($i<count($image)) {
		$line=$image[$i++];
		$query='/0x(.{1,2})[\s]*,[\s]*0x(.{1,2})[\s]*,[\s]*/i';
		if (!preg_match_all($query,$line,$m)) {
			if (false===strpos($line,'}')) continue;
			else break;
		}
		$datalines.='exec ';
		for($j=0;$j<count($m[0]);$j++){
			$l=hexdec($m[1][$j]);
			$h=hexdec($m[2][$j]);
			$datalines.='$';
			if ($h<16) $datalines.='0';
			$datalines.=dechex($h);
			if ($l<16) $datalines.='0';
			$datalines.=dechex($l);
			if ($j<count($m[0])-1) $datalines.=',';
			else $datalines.="\n";
		}
		if (false===strpos($line,'}')) continue;
		else break;
	}
	$t='method '.$imagename."\n";
	$t.='return dataaddress(array_'.$imagename.")\n\n";
	$t.=file_get_contents('./images/'.$fname);
	$t.=$datalines;
	file_put_contents('./images/'.$fname,$t);	
}

