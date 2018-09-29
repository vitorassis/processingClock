class Pointer{
  void show(char type){
    switch(type){
      case 'H':
        hr();
        break;
      case 'M':
        mn();
        break;
      case 'S':
        sec();
        break;
      
    }
  }
  
  private void hr(){
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
  }
  
  private void mn(){
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
  }
  
  private void sec(){
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
}
