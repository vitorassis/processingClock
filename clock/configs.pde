static class Configs{
  
  static float taxa = 0.87;
  
  public static Layout configure(Layout layout, float w, float h){
    layout.clockRadius = (h <= w ? h : w) * taxa ;
    
    layout.secRadius = layout.clockRadius * 0.85;
    
    layout.minRadius = layout.clockRadius * 0.675;
    
    layout.hourRadius = layout.clockRadius * 0.5;
    
    layout.weightHour = layout.clockRadius * 0.01;
    layout.weightMin = layout.weightHour;
    layout.weightSec = layout.weightMin;
    
    layout.weightPointer = layout.clockRadius*0.02;
    
    return layout;
    
  } 
}
