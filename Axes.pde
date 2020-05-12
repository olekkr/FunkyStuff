class Axes {
  float xPos = 100;
  float yPos = 700; //origo of coordinate system
  int d = 50;
  int xMarks = 50;
  int yMarks = 50;
  color coorColor = #ffffff;
  float xScalar;
  float yScalar;
  color chLineColor = #696969;
  boolean enableTxt = false;
  color textColor = #ffffff;
  boolean anoyingL = false;


  Axes() {
    update();
  }
  void update() {
    xScalar = width/xMarks;
    yScalar = height/yMarks;
  }
  void render() {
    update();
    //yAxis
    for (float y = yPos; y < height; y += yScalar) {
      stroke(chLineColor);
      if(anoyingL){line(0, y, width, y);}
      
      stroke(coorColor);
      line(xPos - 5, y, xPos, y);
      fill(textColor);
      if (enableTxt) {
        text(int((yPos-y)/yScalar), xPos-20, y+yScalar/2 -3);
      }
    }

    for (float y = yPos; y > 0; y -= yScalar) {
      stroke(chLineColor);
      if(anoyingL){line(0, y, width, y);}
      stroke(coorColor);
      line(xPos - 5, y, xPos, y);
      fill(textColor);
      if (enableTxt) {
        text(int((yPos-y)/yScalar), xPos-20, y+yScalar/2 -5);
      }
    }

    //xAxis
    for (float x = xPos; x < width; x += xScalar) {
      stroke(chLineColor);
      if(anoyingL){line(x, 0, x, height);}
      stroke(coorColor);
      line(x, yPos - 5, x, yPos);
      fill(textColor);
      if (enableTxt) {
        text(-int((xPos-x)/xScalar), x-xScalar/2 -3, yPos-10);
      }
    }

    for (float x = xPos; x > 0; x -= xScalar) {
      stroke(chLineColor);
      if(anoyingL){line(x, 0, x, height);}
      stroke(coorColor);
      line(x, yPos - 5, x, yPos);
      fill(textColor);
      if (enableTxt) {
        text(-int((xPos-x)/xScalar), x-xScalar/2 -3, yPos-10);
      }
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

  void point(float x, float y) {
    circle(xPos(x), yPos(y), 2.5);
  }
}
