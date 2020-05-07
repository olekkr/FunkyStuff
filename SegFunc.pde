class SegFunc {

  ArrayList<Function> funcs = new ArrayList<Function>();
  FloatList limits = new FloatList();


  SegFunc(){};

  int addLtdFunc(Function func, float[] limits) {
    this.funcs.add(func);
    this.limits.append(limits[0]);

    return 0;
  }
}
  
