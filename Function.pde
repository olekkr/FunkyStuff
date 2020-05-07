class Function {

  float[] exponent;
  float[] multiplier;
  float[] m_polys;
  color m_color;

  boolean extended = false;

  Function(float[] polyList) { //any poly
    m_polys = new float[polyList.length];
    for (int i = 0; i < polyList.length; i++) {
      this.m_polys[i] = polyList[i];
      printArray(m_polys);
    }
    assignColor();
  }

  Function(float[] exponent, float[] multiplier) { //extended poly
    this.extended = true;
    assignColor();
    this.exponent = exponent;
    this.multiplier = multiplier;
  }

  Function(float c, float b, float a) {//2.grads poly
    m_polys = new float[3];
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
    if (!extended) {
      for (int i = 0; i < m_polys.length; i++) {
        if (m_polys[i] == 0) {
          continue;
        }
        result += pow(x, i) * m_polys[i];
      }
    } else {
      for (;;) {
        if (m_polys[i] == 0) {
          continue;
        }
        result += pow(x, i) * m_polys[i];
      }
    }


    return result;
  }

  void fDraw(Axes ax) {
    float delta = 0.01;
    noStroke();
    fill(m_color);
    for (float x = -400; x < width; x += delta) {
      circle(ax.xPos(x), ax.yPos(compute(x)), 2.0);
    }
  }
  void LfDraw(Axes ax) {
    float delta = 0.01;
    stroke(m_color);
    for (float x = -400; x < width; x += delta) {
      line(ax.xPos(x), ax.yPos(compute(x)), ax.xPos(x-delta), ax.yPos(compute(x-delta)));
    }
  }

  float intDX(float a, float b, float dx) {
    if (a>b) {
      println("you gei");
      return 0;
    }
    float sum = 0;
    for (float x = a; x <= b; x += dx) {
      sum += compute(x) * dx;
    }
    return sum;
  }

  float simp(float a, float b, int simpCount) {
    if (a>b || a == 0  ) {
      println("your gei");
      return 0;
    }
    float sum = 0;

    float hopLen = abs(b-a)/simpCount;
    for (int i = 0; i <= simpCount; ++i) {
      sum += (3 * log(compute(i*hopLen))-1 + 4 * (3 * log(compute(i*hopLen + hopLen * (3.0/1.0)))-1 ) + (3 * log(compute(i*hopLen + hopLen * (3.0/2.0)) )-1));
    } 


    return sum/6;
  }
}
