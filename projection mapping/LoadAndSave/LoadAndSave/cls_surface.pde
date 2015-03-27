
class Surface {
  PShape surface;
  int mode;
  int ID;
  color col;

  Surface(int id, PShape s) {
    surface = s;
    col = color(127);
  }

  void display() {
    surface.setFill(col);

    surface.noStroke();
    shape(surface, 0, 0);
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

