<?php 
include 'main.php';
$image=new encode_picture("/Program Files/VertrigoServ/www/encode-pic-text/end.png");
echo $image->getTextBack(12,99);
$image->finish('ennd.png');