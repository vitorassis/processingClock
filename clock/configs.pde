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
      output.println("\"cor_horas\": \"\\uff1919\",");    
      output.println("\"cor_minutos\": \"\\u88D317\",");  
      output.println("\"cor_segundos\": \"\\u0080ff\"");    
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
    
      JSONObject clr = parseJSONObject(
    "{"+
      "\"aliceblue\": [240, 248, 255],"+
      "\"antiquewhite\": [250, 235, 215],"+
      "\"aqua\": [0, 255, 255],"+
      "\"aquamarine\": [127, 255, 212],"+
      "\"azure\": [240, 255, 255],"+
      "\"beige\": [245, 245, 220],"+
      "\"bisque\": [255, 228, 196],"+
      "\"black\": [0, 0, 0],"+
      "\"blanchedalmond\": [255, 235, 205],"+
      "\"blue\": [0, 0, 255],"+
      "\"blueviolet\": [138, 43, 226],"+
      "\"brown\": [165, 42, 42],"+
      "\"burlywood\": [222, 184, 135],"+
      "\"cadetblue\": [95, 158, 160],"+
      "\"chartreuse\": [127, 255, 0],"+
      "\"chocolate\": [210, 105, 30],"+
      "\"coral\": [255, 127, 80],"+
    "}"
    );
    
    JSONObject obj = getConfigs();
    
    layout.clockRadius = (h <= w ? h : w) * (obj.getBoolean("monitor") ? (4/3) : taxa );
    
    layout.secRadius = layout.clockRadius * 0.85;
    
    layout.minRadius = layout.clockRadius * 0.675;
    
    layout.hourRadius = layout.clockRadius * 0.5;
    
    layout.weightHour = layout.clockRadius * 0.01;
    layout.weightMin = layout.weightHour;
    layout.weightSec = layout.weightMin;
    
    layout.weightPointer = layout.clockRadius*0.02;
    
    JSONArray = sec = clr.getJSONArray(obj.getString("cor_segundos"));
    layout.colorPointerSec = hex();
    layout.colorPointerMin = int(obj.getString("cor_minutos"));
    layout.colorPointerHour = int(obj.getString("cor_horas"));
    
    layout.onlyPointers = !obj.getBoolean("arcos");
    
    return layout;
    
  } 
   
}
