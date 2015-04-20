
class Surface {
  PShape surface;
  PImage img, original, resized;
  PGraphics mask;
  int mode;
  int ID;
  color col;

  Surface(int id, PShape s) {
    ID = id;
    surface = s;
    col = color(127);
  }


  void displayID() {
    fill(255, 0, 0);
    text(ID, getShapeX(), getShapeY());
  }

  void display() {
    surface.setFill(col);
//    surface.noStroke();
    shape(surface, 0, 0);
  }

  void setImage(PImage i) {
    original = i;
  }

  void createWarpedImage() {
    resized = original;
    // reduce image size to fit shape
    resized.resize(getShapeWidth(), getShapeHeight());
    img = createGraphics(getShapeWidth(), getShapeHeight());
    img = resized;
  }

  void createMask() {
    // create mask
    mask = createGraphics(getShapeWidth(), getShapeHeight());
    mask.beginDraw();
//    mask.background(0);
    surface.setFill(color(255));
    mask.shape(surface, -getShapeX(), -getShapeY());
    mask.endDraw();
  }

  void maskImage() {
    createWarpedImage();
    createMask();
    img.mask(mask);
    image(img, getShapeX(), getShapeY());
  }

  int getShapeWidth() {
    float lowerbound = displayWidth;
    float upperbound = 0;
    for (int i = 0; i < surface.getVertexCount();i++) {
      if (surface.getVertex(i).x < lowerbound) lowerbound = surface.getVertex(i).x;
      if (surface.getVertex(i).x > upperbound) upperbound = surface.getVertex(i).x;
    }
    int w = int(upperbound - lowerbound);
    return w;
  }

  int getShapeHeight() {
    float lowerbound = displayHeight;
    float upperbound = 0;
    for (int i = 0; i < surface.getVertexCount();i++) {
      if (surface.getVertex(i).y < lowerbound) lowerbound = surface.getVertex(i).y;
      if (surface.getVertex(i).y > upperbound) upperbound = surface.getVertex(i).y;
    }
    int h = int(upperbound - lowerbound);
    return h;
  }

  int getShapeX() {
    float lowerbound = displayWidth;
    for (int i = 0; i < surface.getVertexCount();i++) {
      if (surface.getVertex(i).x < lowerbound) lowerbound = surface.getVertex(i).x;
    }
    return int(lowerbound);
  }

  int getShapeY() {
    float lowerbound = displayHeight;
    for (int i = 0; i < surface.getVertexCount();i++) {
      if (surface.getVertex(i).y < lowerbound) lowerbound = surface.getVertex(i).y;
    }
    return int(lowerbound);
  }

  void setColor(color c) {
    col = c;
  }

  void setMode(int m) {
    mode = m;
  }


  void editVertices() {
    for (int i = 0; i < surface.getVertexCount (); i++) {
      PVector v = surface.getVertex(i);
      if (dist(v.x, v.y, mouseX, mouseY) < threshold) {
        ellipse(v.x, v.y, threshold, threshold);
        if (mousePressed) {
          v.x = mouseX;
          v.y = mouseY;
          surface.setVertex(i, v);
        }
      }
    }
  }
}

