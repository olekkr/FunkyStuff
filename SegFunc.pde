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

  void fDraw(Axes ax) {}
  void fLDraw(float a, float b, Axes ax) {
    int idx = 0;
    for (; idx < limits.size()-1; idx = idx + 2) {
      if (limits.get(idx) <= a) {
        break;
      }
      println(idx, limits.size()-2);
      if (idx == limits.size()-2) {
        println("a is over max lower limit");
        //return 0;
      }
    }
    for (; idx < limits.size(); idx +=2) {
      if (limits.get(idx+1) < b ) {
        //result += funcs.get(idx/2).intDX(limits.get(idx), limits.get(idx+1), dx );
        
      } else {
        println("upperlimit too high");
        //result += funcs.get(idx/2).intDX(limits.get(idx), b, dx );
        //return result;
      }
    }
    
  }
  float intDX(float a, float b, float dx) {
    int idx = 0;
    float result = 0.0;
    for (; idx < limits.size()-1; idx += 2) {
      if (limits.get(idx) <= a) {
        break;
      }
      println(idx, limits.size()-2);
      if (idx == limits.size()-2) {
        return 0;
      }
    }
    for (; idx < limits.size(); idx +=2) {
      if (limits.get(idx+1) < b ) {
        result += funcs.get(idx/2).intDX(limits.get(idx), limits.get(idx+1), dx );
        println("upperlimit too high");
        
      } else {
        println("normal");
        result += funcs.get(idx/2).intDX(limits.get(idx), b, dx );
      }
    }
    return result;
  }
}
