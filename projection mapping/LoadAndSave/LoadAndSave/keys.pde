
void keyReleased() {


  switch(key) {
  case 'e':
    curr_mode = EDIT;
    println("mode = EDIT");
    break;
  case 'l':
    curr_mode = LIVE;
    println("mode = LIVE");
    break;
  case 'a':
    curr_mode = ADD;
    println("mode = ADD");
    break;

  case 'q':
    saveSVGs();
    exit();
    break;
  case 'r':
    randomiseColors();
    break;
  }
}

float threshold = 15;
void mouseReleased() {
  switch(curr_mode) {

  case ADD:
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
    break;
  }
}

