import java.lang.ProcessBuilder;
import java.io.BufferedReader;
import java.io.InputStreamReader;

final float rad_dg = 0.0174532925;

PFont f;

boolean onlyAbsValues = false;

Layout layout;

void setup() {
  //fullScreen();
  size(1000, 500);
  surface.setResizable(true);

  f = createFont("Verdana", 16, true);
  
  layout = new Layout();
}

boolean stop = false;

float sec;
float min;
float hour;

int secReal;
int minReal;
int hourReal;

void draw() {           
  if(!new Configs().fileExists("configs.json")){
    new Configs().createFile("configs.json");
  }
  //CONFIGS
  layout = new Configs().configure(layout, width, height); 
  //FIM CONFIGS
  background(layout.backColor);
  textFont(f, layout.clockRadius/20);
  
  fill(255);
  
  if(!stop){
    Converter converter = new Converter();
    sec = converter.sec();
    min = converter.mn();
    hour = converter.hr();
    
    secReal = second();
    minReal = minute();
    hourReal = hour();
  }
  new Text().show();
  
  new Frame().show();
  
  Pointer pointer = new Pointer();
  
  pointer.show('H');
  pointer.show('M');
  pointer.show('S');
}

void keyReleased(){
  if(key == ' '){
    stop = !stop;                                          
  }
}
