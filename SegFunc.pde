class SegFunc {

  ArrayList<Function> funcs = new ArrayList<Function>();
  FloatList limits = new FloatList();


  SegFunc(){
  }

  int addFunc(Function func, float a, float b) {
    this.funcs.add(func);
    this.limits.append(a);
    this.limits.append(b);

    return 0;
  }
  
  void fDraw(Axes ax) {
    
  }
  void LfDraw(Axes ax) {}
  //float intDX(float a, float b, float dx) {}
  //float simp(float a, float b, int simpCount) {}
  
}
  
