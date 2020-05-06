
color[] fColors = {#4287f5, #f54266, #f5e942, #32a846, #40ecf5};
int fCount = 0;


void setup() {
  size(800, 800);
  background(0);
  noStroke();


  Function f = new Function(2.0, 0.0, 1.0/8); // 2 - 0*x + 1/8x^2
  
  Axes ax = new Axes();
  
  
  ax.render();
  ax.xPos(0);
  f.fDraw(ax);
  
  println(f.compute(100));
  
}
void onClick(){
  save("img" + str(int(random(1000))) + ".png");
}

void draw() {
}
