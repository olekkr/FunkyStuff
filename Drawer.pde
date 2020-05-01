class Drawer {
  float[] m_polys = new float[10];
  color m_color;

  Drawer(float[] polyList) { //ambigious poly
    for (int i = 0; i > polyList.length; i++) {
      m_polys[i] = polyList[i];
    }
    assignColor();
  }

  Drawer(float a, float b, float c) {//2.grads poly
    m_polys[0] = c;
    m_polys[1] = b;
    m_polys[2] = a;
    assignColor();
  }

  private void assignColor() {
    if (fCount + 1 > fColors.length) {
      m_color = #ffffff;
    } else {
      fCount++;
      m_color = fColors[fCount];
    }
  }

  float compute(int x) {
    float result = 0;
    for (int i = 0; i < m_polys.length; i++) {
      result += pow(m_polys[i], i ) * x;
    }
    return result;
  }

  void render(int min, int max) {
    noStroke();
    fill(m_color);
    for (int x = min; x < max; x++) {
      circle(x, compute(x), 2);
    }
  }
}
