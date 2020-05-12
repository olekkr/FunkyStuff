
color[] fColors = {#4287f5, #f54266, #f5e942, #32a846, #40ecf5};
int fCount = 0;
ArrayList<Function> functions = new ArrayList<Function>();
ArrayList<SegFunc> segFuncs = new ArrayList<SegFunc>();

Axes ax;
SegFunc segFunc = new SegFunc();
color backgroundColor = #000000;
boolean showPureFunc = false;

void setup() { 
  size(800, 800);
  noStroke();
  ax = new Axes();

  functions.add(new Function(2, -1, 0.1)); // 2 - 0*x + 1/8x^2
  functions.add(new Function(2, -2, 1));
  functions.add(new Function(20, 0.0001, 0));

  segFunc.addFunc(functions.get(0), 0, 10);
  segFunc.addFunc(functions.get(1), 10, 20);
  segFunc.addFunc(functions.get(2), 20, 30);
  
  println("wut: ", functions.get(0).simp(0, 10));
  
  segFuncs.add(segFunc);
  println(segFunc.simp(0.0, 30.0));


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


void keyPressed() {
  if (key == 'f') {
    save("img" + str(int(random(1000))) + ".png");
  }
  if (keyCode == UP) {
    ax.yPos += 50;
  }
  if (keyCode == DOWN) {
    ax.yPos -= 50;
  }
  if (keyCode == LEFT) {
    ax.xPos += 50;
  }
  if (keyCode == RIGHT) {
    ax.xPos -= 50;
  }

  if (key == 'w' ) {
    ax.yMarks *= 1.2;
  }
  if (key == 's' && ax.yMarks * 1/1.1 != 0) {
    ax.yMarks *= 1/1.1;
  }
  if (key == 'd' ) {
    ax.xMarks *= 1.2;
  }
  if (key == 'a' && ax.xMarks * 1/1.2 != 0) {
    ax.xMarks *= 1/1.2;
  }

  update();
}

void draw() {
}
