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


    for (int i = 0; i < functions.size(); i ++) {
      funcs.get(i).fLDraw(limits.get(2*i) + 0.5, limits.get(2*i+1), ax);
      //println("reeeee");
    }
  }

  double intDX(double a, double b, double dx) {
    double result = 0.0;
    for (int i = 0; i < funcs.size(); i++) {
      double left = limits.get(i*2);
      double right = limits.get(i*2 + 1);
      if (left < a) {
        left = a;
      }
      if ( right > b) {
        right = b;
      }
      //println(i, left, right);
      result += funcs.get(i).intDX(left, right, dx);
    }
    return result;
  }


  double simp(float a, float b) {
    double result = 0.0;
    for (int i = 0; i < funcs.size(); i++) {
      float left = limits.get(i*2);
      float right = limits.get(i*2+1);
      if (left < a) {
        left = a;
      }
      if ( right > b) {
        right = b;
      }
      result += funcs.get(i).simp(left, right);
    }
    return result;
  }

  double trapez(double a, double b, double dx) {
    double result = 0.0;
    for (int i = 0; i < funcs.size(); i++) {
      double left = limits.get(i*2);
      double right = limits.get(i*2+1);
      if (left < a) {
        left = a;
      }
      if ( right > b) {
        right = b;
      }
      result += funcs.get(i).trapez(left, right, dx);
    }
    return result;
  }
}
