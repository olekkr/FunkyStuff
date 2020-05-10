
color[] fColors = {#4287f5, #f54266, #f5e942, #32a846, #40ecf5};
int fCount = 0;
ArrayList<Function> functions = new ArrayList<Function>();
Axes ax;
SegFunc segFunc;
color backgroundColor = #000000;

void setup() {
  size(800, 800);
  background(0);
  noStroke();

  float[]args = {2.0, -1.0, 1.0/10};
  functions.add(new Function(args)); // 2 - 0*x + 1/8x^2
  functions.add(new Function(2,-2,1));
  ax = new Axes();
  for (Function f : functions) {
    println("intdx: ", f.intDX(0, 5, 1.0/1000));
    println("simp:  ", f.simp(0.01, 5, 3));
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
  if (key == 's') {
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
  
  if(key == 'w'){
    println("t");
    ax.yMarks += 20;
  }
  if(key == 's'){
    ax.yMarks -= 20;
  }
  if(key == 'd'){
    ax.xMarks += 20;
  }
  if(key == 'a'){
    ax.xMarks -= 20;
  }
  
  update();
  
  
}

void draw() {
}
