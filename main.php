<?php 
/**
 * 
 */
class encode_picture 
{
	public $image_gd;
	public $arr;
	public $return_path;
	function __construct($file_path)
	{
 $this->image_gd= imagecreatefrompng($file_path);
 $this->arr = range( 'a', 'z');	
 $this->return_path;
}

function addText($letters,$height=5){
	$letters = str_split($letters);

$return_array=array();
	foreach ($letters as $key => $value) {
			imagesetpixel($this->image_gd,$key, $height,imagecolorallocate($this->image_gd, 0, 0, ord($value)));
			$return_array[$key]=array($value =>ord($value) );
	}
	return $return_array;
}
function addTextSecure($letters,$height=5,$repeat=100){
	$letters = str_split($letters);

$return_array=array();			for ($i=0; $i<$repeat ; $i++) { 

	foreach ($letters as $key => $value) {
//imagesetpixel($this->image_gd,$key, $height, ord($value));
imagesetpixel($this->image_gd,$key, $height+$i, ord($value));	
		
			
			$return_array[$key]=array($value =>ord($value) );
	}}
	return $return_array;
}
function getTextBack($length,$height=5){
	$text="";
	for ($i=0; $i < $length; $i++) { 
		if( imagecolorsforindex($this->image_gd, imagecolorat($this->image_gd, $i, $height))!==false){
		$text.=chr( imagecolorsforindex($this->image_gd,imagecolorat($this->image_gd, $i, $height))['blue']);
		}
	}
	return $text;
}
function finish($end){
imagepng($this->image_gd,$end);
imagedestroy($this->image_gd);
return true;
}
}