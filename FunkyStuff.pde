
color[] fColors = {#4287f5, #f54266, #f5e942, #f5ce42, #40ecf5};
int fCount = 0;


void setup() {
  size(800, 800);
  background(255);
  noStroke();


  Drawer d = new Drawer(1, 0, -3.0);
  Axes ax = new Axes();    

  println(d.compute(10));
  d.render(0, 800);

  ax.render();
}

void draw() {
}
