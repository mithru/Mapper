String filename = "surfaces.txt";

String[] file;

int curr_line = 0;

void loadSVGs() {
  file = loadStrings("data/" + filename);
  println("there are " + file.length + " lines");
  for (curr_line = 0 ; curr_line < file.length; curr_line++) {
    println(file[curr_line]);
    if (file[curr_line].equals("BEGIN")) {
      println("starting new shape at line " + curr_line);
      s = createShape();
      s.beginShape();
    } 
    else if (file[curr_line].substring(0, 2).equals("V ")) {
      println("creating new vertex at line" + curr_line);
      String[] t = splitTokens(file[curr_line].substring(2), ",");
      s.vertex(int(t[0]), int(t[1]));
      println("vertex created at x: " + t[0] + "y: " + t[1] );
    }  
    else if (file[curr_line].equals("END")) {
      println("ending new shape at line " + curr_line);
      s.endShape();
      surfaces.add(new Surface(surface_id++, s));
    }
  }
}

void saveSVGs() {
  StringList saveLinesList = new StringList();
  for (int i = 0; i < surfaces.size(); i++) {
    saveLinesList.append("BEGIN");
    Surface s = surfaces.get(i);
    for (int j = 0; j < s.surface.getVertexCount(); j++) {
      PVector v = s.surface.getVertex(j);
      saveLinesList.append("V " + v.x + "," + v.y);
    }
    saveLinesList.append("END");
  }
  String[] saveLines = new String[saveLinesList.size()];
  for (int i = 0; i < saveLines.length; i++) {
    saveLines[i] = saveLinesList.get(i);
  }

  saveStrings("data/"+filename, saveLines);
}

