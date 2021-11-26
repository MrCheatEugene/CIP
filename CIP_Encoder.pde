PImage image;
String inFile;
void setup() {
  noLoop();  
    size(640, 480, P2D);
  if (image==null) selectInput("Choose an image", "inputFile");     
  while (image==null) delay(200);

}
 
void inputFile(File selected) {     
  if (selected == null) exit();      
    image = loadImage(selected.getAbsolutePath());
    inFile=selected.getAbsolutePath();
 selectInput("Choose text file", "textFile");   
}
void textFile(File selected) {     
  if (selected == null) exit();      
    //selected.getAbsolutePath()
    String[] lines = loadStrings(selected.getAbsolutePath());
    String text="";
for (int i = 0 ; i < lines.length; i++) {
  text+=lines[i];
}
processText(text);
}
void processText(String text){
char chartext[]=text.toCharArray();
for (int i=0; i<chartext.length; i++)
{
int character = ((int) chartext[i]);
println(character+"<-"+chartext[i]);
color thatcolor = color(0,0,character);
image.set(i, 5, thatcolor);
}
String currtime=year()+"_"+month()+"_"+day()+" "+hour()+"-"+minute()+"-"+second();
  String out="outputImage_"+currtime+".png";
image.save(out);
image(image, 0, 0);
String result="Time:"+currtime+". Conversion is done! Encoded file "+inFile+" to a CIP picture. Text length: "+chartext.length+". Saved into "+out+".";
String charArray[] ={result};
saveStrings("log_"+currtime+".txt",charArray);
delay(5000);
exit();
} 
