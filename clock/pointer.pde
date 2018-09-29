class Pointer{
  int colorPointer [] = new int [3];
  float weight [] = new float [3];
  float radius [] = new float [3];
  float value [] = new float [3];
  
  Pointer(){
    colorPointer[0] = layout.colorPointerSec;
    colorPointer[1] = layout.colorPointerMin; 
    colorPointer[2] = layout.colorPointerHour;
    
    weight[0] = layout.weightSec;
    weight[1] = layout.weightMin;
    weight[2] = layout.weightHour;
    
    radius[0] = layout.secRadius;
    radius[1] = layout.minRadius;
    radius[2] = layout.hourRadius;
    
    value[0] = sec;
    value[1] = min;
    value[2] = hour;
  }
  
  void show(char type){
    switch(type){
      case 'H':
        draw_pnt(2);
        break;
      case 'M':
        draw_pnt(1);
        break;
      case 'S':
        draw_pnt(0);
      
    }
  }
  
  void draw_pnt(int index){
    strokeWeight(weight[index]);
    stroke(colorPointer[index]);
    noFill();
    if(!layout.onlyPointers) arc(0, 0, radius[index], radius[index], 0, value[index]);
    rotate(-PI/4);
    rotate(value[index]);
    strokeWeight(weight[index]);  
    line(0, 0, (radius[index]/3) + weight[index],(radius[index]/3) + weight[index]);
    rotate(-value[index]);
    rotate(PI/4);
  }
}
