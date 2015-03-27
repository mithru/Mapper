
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
    addSurface();
    println("mode = ADD");
    break;

  case 'q':
    saveSVGs();
    exit();
    break;
  case 'r':
    randomiseColors();
    break;
  case 'd':
    removeSurface(surfaces.size()-1);
    break;
  }
}

