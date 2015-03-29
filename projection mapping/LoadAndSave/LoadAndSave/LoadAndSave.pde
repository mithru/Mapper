ArrayList<Surface> surfaces = new ArrayList<Surface>();

PShape s;

final int LIVE = 0;
final int EDIT = 1;
final int ADD = 2;

int surface_id = 0;
int curr_mode = LIVE;

void setup() {
  size(displayWidth, displayHeight, P2D);
  loadSVGs();
  noStroke();
}

void draw() {

  background(0);
  
  textSize(32);
  text("Hello Mithru... Sunday afternoon.. Feeling good on a Wednesday.. Ya ya ya.. I am Lorde.", mouseX, mouseY);

  for (int i = 0; i < surfaces.size(); i++) {
    Surface surface = surfaces.get(i);
    surface.display();
    switch(curr_mode) {
    case LIVE:
      animation();
      println("live");
      break;
    case EDIT:
      println("edit mode");
      surface.editVertices();
      break;
    }
  }
}

void randomiseColors() {
  for (Surface surface : surfaces) 
    surface.setColor(color(int(random(0)), int(random(50,155)), int(random(10))));
}


float threshold = 15;
void addSurface() {
  float side = threshold * 2;
  float h = side/2 * sqrt(3);
  float hc = h/3;
  s = createShape();
  s.beginShape();
  s.vertex(mouseX, mouseY - h + hc);
  s.vertex(mouseX - side/2, mouseY + hc);
  s.vertex(mouseX + side/2, mouseY + hc);
  s.fill(127, 0, 0);
  s.noStroke();
  s.endShape(CLOSE);  
  surfaces.add(new Surface(surface_id++, s));
}

void removeSurface(int i) {
  surfaces.remove(i);
}


void animation() {
  randomiseColors();
  delay(10);
}

