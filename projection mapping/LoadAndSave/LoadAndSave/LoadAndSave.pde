ArrayList<Surface> surfaces = new ArrayList<Surface>();

PShape s;

final int LIVE = 0;
final int EDIT = 1;
final int ADD = 2;

int surface_id = 0;
int curr_mode = LIVE;

void setup() {
  size(800, 600, P2D);
  loadSVGs();
}

void draw() {

  background(0);

  for (int i = 0; i < surfaces.size(); i++) {
    Surface surface = surfaces.get(i);
    surface.display();
    switch(curr_mode) {
    case LIVE:
      println("live");
      break;
    case EDIT:
      println("edit mode..zzz");
      surface.editVertices();
      break;
    }
  }
}

void randomiseColors() {
  for (Surface surface : surfaces) 
    surface.setColor(color(int(random(255)),int(random(255)),int(random(255))));
}

