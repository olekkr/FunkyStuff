class Axes {
  float xPos = width/2;
  float yPos = height/2;
  int markCount = 20;
  color coorColor = #000000;

  Axes() {
  }

  void render() {
    //xAxis
    stroke(coorColor);
    line(xPos, height, xPos, 0);
    for (int y = int(yPos); y < width; y += width/20) {
      line(xPos - 5, y, xPos, y);
    }
    for (int y = int(yPos); y > 0; y -= width/20) {
      line(xPos - 5, y, xPos, y);
    }

    //yAxis
    stroke(coorColor);
    line(0, yPos, width, yPos);
    for (int x = int(xPos); x < width; x += width/20) {
      line(x, yPos + 5, x, yPos);
    }
    for (int x = int(xPos); x > 0; x -= width/20) {
      line(x, yPos + 5, x, yPos);
    }
  }
}
