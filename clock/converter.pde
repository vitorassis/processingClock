class Converter{
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
}
