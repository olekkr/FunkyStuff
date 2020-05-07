
color[] fColors = {#4287f5, #f54266, #f5e942, #32a846, #40ecf5};
int fCount = 0;
ArrayList<Function> functions = new ArrayList<Function>();
Axes ax;

SegFunc segFunc;


void setup() {
  size(800, 800);
  background(0);
  noStroke();

  float[]args = {2.0, -1.0, 1.0/10};
  functions.add(new Function(args)); // 2 - 0*x + 1/8x^2
  ax = new Axes();





  update();
}


void update() {
  for (Function f : functions) {
    f.fDraw(ax);
    println("intdx: ", f.intDX(0, 5, 1.0/1000));
    println("simp:  ", f.simp(0.01, 5, 3));
  }
  ax.render();
}


void mousePressed() {
  save("img" + str(int(random(1000))) + ".png");
}

void draw() {
}
