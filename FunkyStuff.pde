
color[] fColors = {#4287f5, #f54266, #7f03fc, #32a846, #40ecf5};
int fCount = 0;
ArrayList<Function> functions = new ArrayList<Function>();
ArrayList<SegFunc> segFuncs = new ArrayList<SegFunc>();
double realValue = 250;

Axes ax;
SegFunc segFunc = new SegFunc();
color backgroundColor = #ffffff;
boolean showPureFunc = false;

void setup() { 
  size(1000, 800);
  noStroke();
  ax = new Axes();


  functions.add(new Function(5, -1, 0.066666666666666));
  functions.add(new Function(-55, 5, -0.083333333333333));
  segFunc.addFunc(functions.get(0), 0, 20);
  segFunc.addFunc(functions.get(1), 20, 30);
  segFuncs.add(segFunc);
  
  //functions.add(new Function(-5, 1, -0.066666666666666));
  //functions.add(new Function(55, -5, 0.083333333333333));
  //segFunc.addFunc(functions.get(2), 0, 20);
  //segFunc.addFunc(functions.get(3), 20, 30);
  //segFuncs.add(segFunc);


  update();
}


void update() {
  background(backgroundColor);

  ax.render();
  if (showPureFunc) {
    for (Function f : functions) {
      f.fLDraw(ax);
    }
  } else {
    for (SegFunc f : segFuncs) {
      f.fLDraw(ax);
    }
  }
}

double dpow(double x, int count) {
  double acc = 1;
  for (int i = 0; i < count; i++) {
    acc *= x;
  }
  return acc;
}

double abs(double d) {
  if (d<0) {
    return -d;
  }
  return d;
}

void keyPressed() {
  println(key, keyCode);
  if (key == 'f') {
    save("img" + str(int(random(1000))) + ".png");
  }
  if (keyCode == UP) {
    ax.yPos += 12.5;
  }
  if (keyCode == DOWN) {
    ax.yPos -= 12.5;
  }
  if (keyCode == LEFT) {
    ax.xPos += 12.5;
  }
  if (keyCode == RIGHT) {
    ax.xPos -= 12.5;
  }

  if (key == 'w' ) {
    ax.yMarks *= 1.05;
  }
  if (key == 's' ) {
    ax.yMarks *= 1/1.05;
  }
  if (key == 'd' ) {
    ax.xMarks *= 1.05;
  }
  if (key == 'a' ) {
    ax.xMarks *= 1/1.05;
  }
  if (key == '1') {
    println("trapez\tdx\tint\ttime\tcount");
    for (double dx = 2; dx > 1/dpow(2, 26); dx *= 0.5) {
      int i = 0;
      int start = millis();
      for (; millis() - start < 500 || (millis() - start > 500 && i < 2); i++) {
        segFuncs.get(0).trapez(0.0, 30.0, dx);
      }
      println("\t", dx, "\t", segFuncs.get(0).trapez(0.0, 30, dx), "\t", millis() - start, "\t", i);
    }
    
    println("\nintdx\tdx\tint\ttime\tcoun");
    for (double dx = 2; dx > 1/dpow(2, 26); dx *= 0.5) {
      int start = millis();
      int i = 0;
      for (; millis() - start < 500 || (millis() - start > 500 && i < 2); i++) {
        segFuncs.get(0).intDX(0.0, 30.0, dx);
      }
      println("\t", dx, "\t", segFuncs.get(0).intDX(0.0, 30.0, dx), "\t", millis() - start, "\t", i);
    }
    println("done");
  }
  update();
}

void draw() {
}
