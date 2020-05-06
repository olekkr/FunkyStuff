class Axes {
  float xPos = 400;
  float yPos = 600; //origo of coordinate system
  int markCount = 50;
  color coorColor = #ffffff;
  float xScalar;
  float yScalar;
  color chLineColor = #696969;
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
      text(y/yScalar, xPos-10, y);
    }

    for (float y = yPos; y > 0; y -= yScalar) {
      stroke(chLineColor);
      line(0, y, width, y);
      stroke(coorColor);
      line(xPos - 5, y, xPos, y);
    }

    //xAxis
    for (float x = xPos; x < width; x += xScalar) {
      stroke(chLineColor);
      line(x, 0, x, height);
      stroke(coorColor);
      line(x, yPos - 5, x, yPos);
    }

    for (float x = xPos; x > 0; x -= xScalar) {
      stroke(chLineColor);
      line(x, 0, x, height);
      stroke(coorColor);
      line(x, yPos - 5, x, yPos);
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
