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
			imagesetpixel($this->image_gd,$key, $height, ord($value));
			$return_array[$key]=array($value =>ord($value) );
	}
	return $return_array;
}
function getTextBack($length,$height=5){
	$text="";
	for ($i=0; $i < $length; $i++) { 
		if(imagecolorat($this->image_gd, $i, $height)!==false){
		$text.=chr(imagecolorat($this->image_gd, $i, $height));
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