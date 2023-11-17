<?php

//date_default_timezone_set('America/Los_Angeles');
date_default_timezone_set('Etc/UCT');

$image=file_get_contents('./image.c');
$image=preg_split('/\r\n/',$image);
//print_r($image);

$result='';
for($i=0;$i<count($image);$i++){
	$line=$image[$i];
	if (preg_match('/gImage_[a-zA-Z0-9_]+/',$line,$m)) $result.='label '.$m[0]."\n";
	elseif (8==preg_match_all('/0X(.{2}),0X(.{2}),/',$line,$m)) {
		$result.='exec ';
		for($j=0;$j<7;$j++) $result.='$'.$m[2][$j].$m[1][$j].',';
		$result.='$'.$m[2][$j].$m[1][$j]."\n";
	}
}
file_put_contents('./result.txt',$result);
