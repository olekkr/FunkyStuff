class Axes {
  float xPos = 400;
  float yPos = 600; //origo of coordinate system
  int markCount = 10;
  color coorColor = #ffffff;
  float xScalar;
  float yScalar;
  color chLineColor = #696969;
  color textColor = #ffffff;
  Axes() {
    xScalar = width/markCount;
    yScalar = height/markCount;
  }

  void render() {
    //yAxis
    for (float y = yPos; y < height; y += yScalar) {
      stroke(chLineColor);
      line(0, y, width, y);
      stroke(coorColor);
      line(xPos - 5, y, xPos, y);
      fill(textColor);
      text(int((yPos-y)/yScalar), xPos-20, y+yScalar/2 -3);
    }

    for (float y = yPos; y > 0; y -= yScalar) {
      stroke(chLineColor);
      line(0, y, width, y);
      stroke(coorColor);
      line(xPos - 5, y, xPos, y);
      fill(textColor);
      text(int((yPos-y)/yScalar), xPos-20, y+yScalar/2 -5);
    }

    //xAxis
    for (float x = xPos; x < width; x += xScalar) {
      stroke(chLineColor);
      line(x, 0, x, height);
      stroke(coorColor);
      line(x, yPos - 5, x, yPos);
      fill(textColor);
      text(-int((xPos-x)/xScalar), x-xScalar/2 -3, yPos-10);
    }

    for (float x = xPos; x > 0; x -= xScalar) {
      stroke(chLineColor);
      line(x, 0, x, height);
      stroke(coorColor);
      line(x, yPos - 5, x, yPos);
      fill(textColor);
      text(-int((xPos-x)/xScalar), x-xScalar/2 -3, yPos-10);
    }

    stroke(255);
    line(xPos, 0, xPos, height); // horizontal line
    line(0, yPos, width, yPos); // vertical line
  }
  float xPos(float xIn) {
    return (xIn * xScalar + this.xPos) ;
  }

  float yPos(float yIn) {
    return (this.yPos - yIn * yScalar)  ;
  }
}
