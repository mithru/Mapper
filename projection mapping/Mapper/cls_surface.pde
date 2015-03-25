final int EDIT_MODE = 0;
final int SELECT_MODE = 1;
final int LIVE_MODE = 2;

class Surface {
  PShape surface;
  int mode;
  int id;
  float x, y;
  color col, edit;
  boolean edit_vertex;

  Surface(PShape s, float theX, float theY) {
    surface = s;
    surface.setFill(127);

    x = theX;
    y = theY;
    col = color(127);
    edit_vertex = false;
  }

  void display() {
    surface.setFill(col);
    shape(surface, x, y);
    checkVertices();
  }

  void setColor(color c) {
    col = c;
  }

  void setMode(int m) {
    mode = m;
  }


  float threshold = 15;
  void checkVertices() {
    for (int i = 0; i < surface.getVertexCount(); i++) {
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

