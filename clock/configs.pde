class Configs{
  
  float taxa = 0.87;
  PrintWriter output;  
  
  boolean fileExists(String path) {
    return new File(path).exists();
  } 
  
  boolean createFile(String path){
    try{
        
      createOutput(path);
      output = createWriter(path); 
      output.println("{");
      output.println();
      output.println();
      output.println("\"monitor\": false,");
      output.println("\"arcos\": true,");    
      output.println("\"horas redondas\": false,");
      output.println("\"cor_horas\": \"coral\",");    
      output.println("\"cor_minutos\": \"blue\",");  
      output.println("\"cor_segundos\": \"chocolate\"");    
      output.println();
      output.println();
      output.println();
      output.println("}");
      output.flush();
      output.close();
      return true;
    }catch(Exception e){return false;}
  }
  
  private JSONObject getConfigs(){
    String path="configs.json";    
    JSONObject json = loadJSONObject(path);
    return json;
  }
  
  public Layout configure(Layout layout, float w, float h){
    
        Object [][] clr = {
        {
          "aliceblue",
          "antiquewhite",
          "aqua",
          "aquamarine",
          "azure",
          "beige",
          "bisque",
          "black",
          "blanchedalmond",
          "blue",
          "blueviolet",
          "brown",
          "burlywood",
          "cadetblue",
          "chartreuse",
          "chocolate",
          "coral"
        },
        {
          [240, 248, 255],
          [250, 235, 215],
          [0, 255, 255],
          [127, 255, 212],
          [240, 255, 255],
          [245, 245, 220],
          [255, 228, 196],
          [0, 0, 0],
          [255, 235, 205],
          [0, 0, 255],
          [138, 43, 226],
          [165, 42, 42],
          [222, 184, 135],
          [95, 158, 160],
          [127, 255, 0],
          [210, 105, 30],
          [255, 127, 80]
        }
    };
    
    JSONObject obj = getConfigs();
    
    layout.clockRadius = (h <= w ? h : w) * (obj.getBoolean("monitor") ? (4/3) : taxa );
    
    layout.secRadius = layout.clockRadius * 0.85;
    
    layout.minRadius = layout.clockRadius * 0.675;
    
    layout.hourRadius = layout.clockRadius * 0.5;
    
    layout.weightHour = layout.clockRadius * 0.01;
    layout.weightMin = layout.weightHour;
    layout.weightSec = layout.weightMin;
    
    layout.weightPointer = layout.clockRadius*0.02;
    
    Object sec = null;
    Object min = null;
    Object hora = null;
    
    for(int i = 0; i<clr.lenght(); i++){
      if(clr[0][i] == obj.getString("cor_segundos")){
        sec = clr[1][i];
      }if(clr[0][i] == obj.getString("cor_minutos")){
        min = clr[1][i];
      }if(clr[0][i] == obj.getString("cor_horas")){
        hora = clr[1][i];
      }
    }
    
    layout.colorPointerSec = hex(sec);
    layout.colorPointerMin = int(min);
    layout.colorPointerHour = int(hora);
    
    layout.onlyPointers = !obj.getBoolean("arcos");
    
    return layout;
    
  } 
   
}
