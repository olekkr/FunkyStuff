class SegFunc {

  ArrayList<Function> funcs = new ArrayList<Function>();
  FloatList limits = new FloatList();


  SegFunc() {
  }

  int addFunc(Function func, float a, float b) {
    this.funcs.add(func);
    this.limits.append(a);
    this.limits.append(b);
    return 0;
  }

  void fLDraw(Axes ax) {
    
    
    for(int i = 0; i < functions.size(); i ++){
      funcs.get(i).fLDraw(limits.get(2*i), limits.get(2*i+1), ax);
      //println("reeeee");
    }
  }
  
  float intDX(float a, float b, float dx) {
    float result = 0.0;
    
    for(int i = 0; i < funcs.size(); i++){
      float left = limits.get(i*2);
      float right = limits.get(i*2+1);
      if (left < a){
        left = a;
      }
      if( right > b){
        right = b;
      }
      //println(i, left, right);
      result += funcs.get(i).intDX(left, right, 0.001);
    }
    return result;
  }
  
  
  float simp(float a, float b) {
    float result = 0.0;
    for(int i = 0; i < funcs.size(); i++){
      float left = limits.get(i*2);
      float right = limits.get(i*2+1);
      if (left < a){
        left = a;
      }
      if( right > b){
        right = b;
      }
      println("simp: ", left, right);
      result += funcs.get(i).simp(left, right);
    }
    return result;
  }
}
