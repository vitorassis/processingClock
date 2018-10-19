class Configs{
  
  float taxa = 0.87;
  PrintWriter output;  
  
  boolean fileExists(String path) {
    try{
      JSONObject json = loadJSONObject(path);
      return true;
    }catch(Exception e){
      return false;
    }
  } 
  
  boolean createFile(String path){
    try{
        
      createOutput(path);
      output = createWriter(path); 
      output.println("{");
      output.println();
      output.println();
      output.println("\"projetor\": false,");
      output.println("\"arcos\": true,");    
      output.println("\"horas redondas\": false");
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
    JSONObject obj = getConfigs();
    
    layout.clockRadius = (h <= w ? h : w) * (obj.getBoolean("projetor") ? (0.45) : taxa );
    
    layout.secRadius = layout.clockRadius * 0.85;
    
    layout.minRadius = layout.clockRadius * 0.675;
    
    layout.hourRadius = layout.clockRadius * 0.5;
    
    layout.weightHour = layout.clockRadius * 0.01;
    layout.weightMin = layout.weightHour;
    layout.weightSec = layout.weightMin;
    
    layout.weightPointer = layout.clockRadius*0.02;
    
    layout.onlyPointers = !obj.getBoolean("arcos");
    
    onlyAbsValues = obj.getBoolean("horas redondas");
    
    return layout;
    
  } 
   
}
