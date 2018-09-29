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
  //CONFIGS
  layout = Configs.configure(layout, width, height); 
  //FIM CONFIGS
  background(layout.backColor);
  textFont(f, layout.clockRadius/20);
  fill(255);
  
  if(!stop){
    sec = sec();
    min = mn();
    hour = hr();
    
    secReal = second();
    minReal = minute();
    hourReal = hour();
  }
  
  float sec_dg = sec/rad_dg;
  float min_dg = min/rad_dg;
  float hour_dg = hour/rad_dg;
    
  if(abs(height - width) > abs(layout.clockRadius/(1+Configs.taxa))){
    fill(255);
    textAlign(CENTER);
    text(nf(hourReal, 2)+":"+nf(minReal, 2)+":"+nf(secReal, 2), width/2, (height)-layout.clockRadius/40);
    textAlign(LEFT);
    
    text((stop?"Voltar":"Pausar")+": <Espaço>", 0, (height/2)-(layout.clockRadius/2));

    fill(layout.infoBack);
    stroke(layout.infoStroke);
    strokeWeight(layout.weightHourDivision);
    rect(0, (height/2)-layout.clockRadius/6, layout.clockRadius/3, layout.clockRadius/3);
    fill(255);
    text("Graus:", 0, (height/2)-layout.clockRadius/10);
    fill(layout.colorPointerHour);
    text("h : "+nf(hour_dg, 3, 1)+"º", 0, (height/2)-(layout.clockRadius/10)+(layout.clockRadius/10));
    fill(layout.colorPointerMin);
    text("m: "+nf(min_dg, 3, 1)+"º", 0, (height/2)-(layout.clockRadius/10)+(layout.clockRadius/5.5));
    fill(layout.colorPointerSec);
    text("s : "+nf(sec_dg, 3, 1)+"º", 0, (height/2)-(layout.clockRadius/10)+(layout.clockRadius/4));
    
    fill(layout.infoBack);
    stroke(layout.infoStroke);
    strokeWeight(layout.weightHourDivision);
    rect(width-layout.clockRadius/3, (height/2)-layout.clockRadius/6, layout.clockRadius/3, layout.clockRadius/3);
    fill(255);
    text("Radianos:", width-layout.clockRadius/3, (height/2)-layout.clockRadius/10);
    fill(layout.colorPointerHour);
    text("h : "+nf(hour/PI, 1, 2)+"π rad", width-layout.clockRadius/3, (height/2)-(layout.clockRadius/10)+(layout.clockRadius/10));
    fill(layout.colorPointerMin);
    text("m: "+nf(min/PI, 1, 2)+"π rad", width-layout.clockRadius/3, (height/2)-(layout.clockRadius/10)+(layout.clockRadius/5.5));
    fill(layout.colorPointerSec);
    text("s : "+nf(sec/PI, 1, 2)+"π rad", width-layout.clockRadius/3, (height/2)-(layout.clockRadius/10)+(layout.clockRadius/4));
  }
  translate(width/2, height/2);
    
  rotate(-HALF_PI);
  fill(layout.backClock);
  strokeWeight(layout.weightDivision);
  stroke(layout.infoStroke);
  ellipse(0, 0, layout.clockRadius, layout.clockRadius);
  rotate(HALF_PI);

  rotate(-QUARTER_PI);
  for(int i = 1; i <= 12; i++){
    for(int j = 0; j < 4; j++){
       rotate(PI/(6*5)); 
        stroke(layout.colorDivision);
        strokeWeight(layout.weightDivision);
        line((layout.hourRadius/3)+layout.weightHour, (layout.hourRadius/3)+layout.weightHour, layout.clockRadius/3, layout.clockRadius/3);
    }
    rotate(PI/(6*5)); 
    stroke(layout.colorHourDivision);
    strokeWeight(layout.weightHourDivision);
    line(15*layout.weightHour, 15*layout.weightHour, layout.clockRadius/3, layout.clockRadius/3);
  }
  
  rotate(-QUARTER_PI);
  
  strokeWeight(layout.weightHour);
  stroke(layout.colorPointerHour);
  noFill();
  if(!layout.onlyPointers) arc(0, 0, layout.hourRadius, layout.hourRadius, 0, hour);
  rotate(-PI/4);
  rotate(hour);
  strokeWeight(layout.weightPointer/2);  
  line(0, 0, (layout.hourRadius/3) + layout.weightHour,(layout.hourRadius/3) + layout.weightHour);
  rotate(-hour);
  rotate(PI/4);
  
  strokeWeight(layout.weightMin);  
  stroke(layout.colorPointerMin);
  noFill();
  if(!layout.onlyPointers) arc(0, 0, layout.minRadius, layout.minRadius, 0, min);
  rotate(-PI/4);
  rotate(min);
  strokeWeight(layout.weightPointer/2);  
  line(0, 0,(layout.minRadius/3) + layout.weightMin,(layout.minRadius/3) + layout.weightMin);
  rotate(-min);
  rotate(PI/4);
  
  strokeWeight(layout.weightSec);
  stroke(layout.colorPointerSec);
  noFill();
  if(!layout.onlyPointers) arc(0, 0, layout.secRadius, layout.secRadius, 0, sec);
  rotate(-PI/4);
  rotate(sec);
  strokeWeight(layout.weightPointer/2);  
  line(0, 0, (layout.secRadius/3) + 2*layout.weightSec,(layout.secRadius/3) + 2*layout.weightSec);
  rotate(-sec);
  rotate(PI/4);
}

void keyReleased(){
  if(key == ' '){
      stop = !stop;                                                         
    }
}

float sec() {
  int sec = second();
  float dg = sec*6;
  return dg * rad_dg;
}

float mn() {
  int min = minute();
  float sec = second();
  sec = sec*0.1;
  float dg = min*6;
  if(!onlyAbsValues)
    dg += sec;
  return dg * rad_dg;
}

float hr() {
  float hr = hour() > 11 ? hour()-12 : hour();
  int min = minute();
  int sec = second();
  float dg = hr*30;
  if(!onlyAbsValues)
    dg +=  min*0.5 + sec*0.016;
  return dg * rad_dg;
}
