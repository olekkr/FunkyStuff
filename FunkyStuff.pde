
color[] fColors = {#4287f5, #f54266, #f5e942, #32a846, #40ecf5};
int fCount = 0;
ArrayList<Function> functions = new ArrayList<Function>();
Axes ax;
SegFunc segFunc = new SegFunc();
color backgroundColor = #000000;

void setup() {
  size(800, 800);
  background(0);
  noStroke();
  ax = new Axes();
  
  functions.add(new Function(2,-1,1.0/10)); // 2 - 0*x + 1/8x^2
  functions.add(new Function(2, -2, 1));
  functions.get(0).fLDraw(0, 10, ax);
  segFunc.addFunc(functions.get(0), 0, 100);
  println("ayy: ", segFunc.intDX(0.0, 2.0, 0.001));
  for (Function f : functions) {
    //println("intdx: ", f.intDX(0, 5, 1.0/1000));
    //println("simp:  ", f.simp(0.01, 5, 3));
  }

  update();
}


void update() {
  background(backgroundColor);
  for (Function f : functions) {

    f.fLDraw(ax);
  }
  ax.render();
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
    ax.yMarks *= 2;
  }
  if (key == 's' && ax.yMarks * 1/2 != 0) {
    ax.yMarks *= 1/2.0;
  }
  if (key == 'd' ) {
    ax.xMarks *= 2;
  }
  if (key == 'a' && ax.xMarks * 1/2 != 0) {
    ax.xMarks *= 1/2.0;
  }

  update();
}

void draw() {
}
