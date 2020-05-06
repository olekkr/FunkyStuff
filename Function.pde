class Function {
  int numOfPolys = 5;
  float[] m_polys = new float[numOfPolys];

  color m_color;

  Function(float[] polyList) { //any poly
    for (int i = 0; i > polyList.length; i++) {
      m_polys[i] = polyList[i];
    }
    assignColor();
  }

  Function(float c, float b, float a) {//2.grads poly
    this.m_polys[0] = c;
    this.m_polys[1] = b;
    this.m_polys[2] = a;
    assignColor();
  }

  private void assignColor() {
    if (fCount +1 > fColors.length) {
      m_color = #ffffff;
    } else {
      fCount++;
      m_color = fColors[fCount-1];
    }
  }


  float compute(float x) {
    float result = 0;
    for (int i = 0; i < m_polys.length; i++) {
      if (m_polys[i] == 0) {
        continue;
      }
      result += pow(x, i) * m_polys[i];
    }
    return result;
  }

  void fDraw(Axes ax) {
    noStroke();
    fill(m_color);
    for (float x = -400; x < ax.size[0]; x += 0.01) {
      circle(ax.xPos(x*ax.xScalar), ax.yPos(compute(x*ax.yScalar)), 2.5);
      
    }
    
  }

  //void render(int min, int max) {
  //  noStroke();
  //  fill(m_color);
  //  for (int x = min; x < max; x++) {
  //    circle(x, (height - compute(x)) + height/2, 2);
  //  }
  //}
}
