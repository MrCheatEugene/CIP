PImage image;
String inFile;
  String input;
boolean askForInput;
Textlabel lengthLabel;
Textlabel stateLabel;
Textlabel inputLabel;

import controlP5.*;

ControlP5 cp5;

int myColor = color(255);

void setup() {
    cp5 = new ControlP5(this);
  size(700,400);
  if (image==null) selectInput("Choose an image", "inputFile");     
  while (image==null) delay(200);
       stateLabel= cp5.addTextlabel("label")
                    .setText("Status: waiting for data")
                    .setPosition(25,25)
                    .setFont(createFont("Arial",20))
                    ;
     lengthLabel= cp5.addTextlabel("len_label")
                    .setText("Enter length of encoded text. When you done - press enter. ")
                    .setPosition(100,50)
                    .setFont(createFont("Arial",20))
                    ;
                         inputLabel= cp5.addTextlabel("in_label")
                    .setText("Current value: ")
                    .setPosition(100,75)
                    .setFont(createFont("Arial",20))
                    ;
}
void draw(){
 background(0);
  lengthLabel.draw(this); 
    stateLabel.draw(this); 
        inputLabel.draw(this); 
image(image, 0, 200);
}


void inputFile(File selected) {     
 if (selected == null) exit();      
   image = loadImage(selected.getAbsolutePath());
   inFile=selected.getAbsolutePath();
askForInput=true;
}
void keyPressed() {
if(key=='\n' && askForInput==true){
askForInput=false;
    input=input.replace("null", ""); 
processImage(parseInt(input.replace("null","")));
    inputLabel.setValueLabel("Current value:"+input.replace("null","")+"; "+parseInt(input.replace("null",""))+" characters");
    stateLabel.setValueLabel("Data is collected; statring conversion..");
}else{
  if(askForInput==true && Character.isDigit(key)==true){
  input=input+parseInt(Character.toString(key));
    input=input.replace("null", ""); 
    inputLabel.setValueLabel("Current value:"+input.replace("null","")+"; "+parseInt(input.replace("null",""))+" characters");
    stateLabel.setValueLabel("waiting for length");
}
}
}
void processImage(Integer textlength){
      stateLabel.setValueLabel("Conversion has started..");

  println(input);
  println(textlength);
 String result="";
for (int i=0; i<textlength; i++){
float toStr=blue(image.get(i,5));
result+= String.valueOf(Character.toChars(parseInt(toStr)));
      stateLabel.setValueLabel("Decoded character '"+String.valueOf(Character.toChars(parseInt(toStr)))+"'; Result: "+result);

println(result);
println(toStr);
}
String currtime=year()+"_"+month()+"_"+day()+" "+hour()+"-"+minute()+"-"+second();
  String out="outputtext_"+currtime+".txt";
String log_result="Time:"+currtime+". Decoding is done! Decoded file "+inFile+" to a text. Text length is "+textlength+" Saved into 'result_"+currtime+".txt'.";
String charArray[] ={log_result};
saveStrings("log_"+currtime+".txt",charArray);
String results[] ={result};
saveStrings("result_"+currtime+".txt",results);
delay(5000);
exit();

} 
