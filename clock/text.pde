class Text{
  void show(){
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
  }
}
