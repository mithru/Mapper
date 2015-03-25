Surface s1;

int num_shapes = 1;

void setup() {
  size(displayWidth, displayHeight, P2D);
  background(255);
  smooth();

  PShape s = createShape();
  s.beginShape();
  s.vertex(50, 300);
  s.vertex(550, 300);
  s.vertex(350, 500);
  s.fill(127, 0, 0);
  s.noStroke();
  s.endShape(CLOSE);  
  s1 = new Surface(s, 0, 0);

}

void draw() {
  background(255);
//  s1.setColor(color(int(random(255)),int(random(100)),int(random(100))));
  s1.display();
//  delay(500);
}

