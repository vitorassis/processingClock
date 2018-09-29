class Frame{
  void show(){
    
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
  }
}
