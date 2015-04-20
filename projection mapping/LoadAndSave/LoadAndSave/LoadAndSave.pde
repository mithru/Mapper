ArrayList<Surface> surfaces = new ArrayList<Surface>();

PShape s;

PImage kohar, felix, caslyn;

PImage[] images = new PImage[3];

int color_mode = 0;

final int LIVE = 0;
final int EDIT = 1;
final int ADD = 2;

int surface_id = 0;
int curr_mode = LIVE;

void setup() {
  size(displayWidth, displayHeight, OPENGL);
  images[0] = loadImage("data/Kohar.jpg");
  images[1] = loadImage("data/Felix.jpg");
  images[2] = loadImage("data/Caslyn.jpg");
  loadSVGs();
  noStroke();

  randomiseColors();
  randomiseFaces();
}

void draw() {

  background(127);

  //  println(frameRate);
  //  image(kohar, 0, 0);
  if (grid)
    displayGrid();
  //  textSize(32);
  //  text("Hello Mithru... Sunday afternoon.. Feeling good on a Wednesday.. Ya ya ya.. I am Lorde.", mouseX, mouseY);

  for (int i = 0; i < surfaces.size(); i++) {
    Surface surface = surfaces.get(i);

    switch(curr_mode) {
    case LIVE:

      //      background(100);
      animation();
      displayFaces();
      //      println("live");
      break;
    case EDIT:
      //      println("edit mode");
      surface.editVertices();
      break;
    }

    surface.display();

    //    surface.displayID();
  }
}

void randomiseColors() {

  for (Surface surface : surfaces) {
    switch(color_mode) {
    case 0 :
      surface.setColor(color(int(random(100, 255))));
      break;
    case 1:
      surface.setColor(color(int(random(200, 255)), int(random(0, 50)), int(random(0, 55))));
      break;
    case 2:
      surface.setColor(color(int(random(0, 55)), int(random(200, 255)), int(random(0, 55))));
      break;
    case 3:
      surface.setColor(color(int(random(0, 55)), int(random(0, 55)), int(random(200, 255))));
      break;
    case 4:
      surface.setColor(color(int(random(200, 255)), int(random(200, 255)), int(random(200, 255))));
      break;
    }
  }
}

int[] faceSurfaceIDs = {
  19, 25, 27
};

int curr_surface = 0;

void randomiseFaces() {
  //  curr_surface = faceSurfaceIDs[int(random(100) % faceSurfaceIDs.length)];
  //  surfaces.get(19).setImage(images[int(random(100) % images.length)]);
  //  surfaces.get(curr_surface).setImage(images[int(random(100) % images.length)]);
  for (int i = 0; i < faceSurfaceIDs.length; i++)
    surfaces.get(faceSurfaceIDs[i]).setImage(images[i]);
}


void displayFaces() {
  //  surfaces.get(19).maskImage();
  surfaces.get(faceSurfaceIDs[curr_surface]).maskImage();
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

int time = 0;
int interval = 200;

void animation() {

  if (time > interval) {
    randomiseColors();
    //    randomiseFaces();
    time = 0;
    interval = int(random(50, 1000));
    if (interval % 3 == 0) {
      curr_surface++;
      curr_surface %= 3;
    }
  }
  time ++;
}

void displayGrid() {
  stroke(255);
  for (int i = 0; i < width; i+=10) line(i, 0, i, height);
  for (int i = 0; i < height; i+=10) line(0, i, width, i);
  noStroke();
}

