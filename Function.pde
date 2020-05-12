class Function {

  float[] m_polys;
  color m_color;

  Function(float[] polyList) { //any poly
    m_polys = new float[polyList.length];
    for (int i = 0; i < polyList.length; i++) {
      this.m_polys[i] = polyList[i];
    }
    assignColor();
  }

  Function(float c, float b, float a) {//2.grads poly
    m_polys = new float[3];
    this.m_polys[0] = c;
    this.m_polys[1] = b;
    this.m_polys[2] = a;
    assignColor();
  }

  float compute(float x) { // computes f(x) given x
    float result = 0;

    for (int i = 0; i < m_polys.length; i++) {
      if (m_polys[i] == 0) {
        continue;
      }
      result += pow(x, i) * m_polys[i];
    }

    return result;
  }

  void fDraw(Axes ax) { //with dots draws entire function on entire window
    float delta = 0.01;
    noStroke();
    fill(m_color);
    for (float x = (0-ax.xPos)/ax.xScalar; x < (width-ax.xPos)/ax.xScalar; x += delta) { //for-loop from position that is the leftmost position to the rightmost position .
      circle(ax.xPos(x), ax.yPos(compute(x)), 2.0);
    }
  }

  void fLDraw(Axes ax) {//with lines draws entire function on entire window
    float delta = 0.5;
    stroke(m_color);
    for (float x = (0-ax.xPos)/ax.xScalar; x < (width-ax.xPos)/ax.xScalar; x += delta) {
      line(ax.xPos(x), ax.yPos(compute(x)), ax.xPos(x-delta), ax.yPos(compute(x-delta)));
    }
  }

  void fLDraw(float a, float b, Axes ax) { //with lines draws function from a to b
    float delta = 0.5;
    stroke(m_color);
    for (float x = a; x <= b; x += delta) {
      line(ax.xPos(x), ax.yPos(compute(x)), ax.xPos(x-delta), ax.yPos(compute(x-delta)));
    }
  }

  float intDX(float a, float b, float dx) { //numerically integrates function from a to b with dx as hopping distance
    float sum = 0;
    for (float x = a; x <= b; x += dx) {
      sum += compute(x) * dx;
    }
    return sum;
  }

  float simp(float a, float b) { //simpsons integration method
    float sum = 0;
    sum = compute(a) + 4* compute(abs(b-a)/2.0 + a) + compute(b);
    return ((b-a)/6) *sum;
  }

  private void assignColor() { // function that assigns color based on count of "functions"
    if (fCount +1 > fColors.length) {
      m_color = #ffffff;
    } else {
      fCount++;
      m_color = fColors[fCount-1];
    }
  }
  void debug() {
    printArray(m_polys);
  }
}
