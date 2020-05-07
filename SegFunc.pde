class SegFunc {

  ArrayList<Function> funcs = new ArrayList<Function>();
  FloatList limits = new FloatList();


  SegFunc(){
  
  
  
  }

  int addLtdFunc(Function func, float a, float b) {
    this.funcs.add(func);
    this.limits.append(a);
    this.limits.append(b);

    return 0;
  }
}
  
