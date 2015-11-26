float xmag, ymag = 0;
float newXmag, newYmag = 0;
float d1 = 1;
float d2 = 2;

float[] x = new float[] {-2,-2, 2, 2,-2,-2, 2, 2,-1,-1, 1, 1,-1,-1, 1, 1};
float[] y = new float[] {-2,-2,-2,-2, 2, 2, 2, 2,-1,-1,-1,-1, 1, 1, 1, 1};
float[] z = new float[] { 2,-2,-2, 2, 2,-2,-2, 2, 1,-1,-1, 1, 1,-1,-1, 1};

void resetShape(){
  x = new float[] {-2,-2, 2, 2,-2,-2, 2, 2,-1,-1, 1, 1,-1,-1, 1, 1};
  y = new float[] {-2,-2,-2,-2, 2, 2, 2, 2,-1,-1,-1,-1, 1, 1, 1, 1};
  z = new float[] { 2,-2,-2, 2, 2,-2,-2, 2, 1,-1,-1, 1, 1,-1,-1, 1};
}

void setup() {
  // size(640,640,P3D);
  fullScreen(P3D);
  strokeWeight(0.075);
  colorMode(RGB, 1);
}

void draw() {
  background(255, 255, 255);
  pushMatrix();
  translate(width/2, height/2, -30);
  noFill();
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;

  if(mousePressed){
    if(d1 < 2){
      d1 += 0.025;
      d2 -= 0.025;
    }
  } else {
    if(d1 > 1){
      d1 -= 0.025;
      d2 += 0.025;
    }
  }
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) {
    xmag -= diff/4.0;
  }

  diff = ymag-newYmag;
  if (abs(diff) >  0.01) {
    ymag -= diff/4.0;
  }

  rotateX(-ymag);
  rotateY(-xmag);

  scale(90);
  beginShape(QUADS);
  // smaller cube
  vertex(x[12],y[12],z[12]);
  vertex(x[15],y[15],z[15]);
  vertex(x[11],y[11],z[11]);
  vertex(x[8],y[8],z[8]);

  vertex(x[15],y[15],z[15]);
  vertex(x[14],y[14],z[14]);
  vertex(x[10],y[10],z[10]);
  vertex(x[11],y[11],z[11]);

  vertex(x[14],y[14],z[14]);
  vertex(x[13],y[13],z[13]);
  vertex(x[9],y[9],z[9]);
  vertex(x[10],y[10],z[10]);

  vertex(x[8],y[8],z[8]);
  vertex(x[9],y[9],z[9]);
  vertex(x[13],y[13],z[13]);
  vertex(x[12],y[12],z[12]);

  vertex(x[12],y[12],z[12]);
  vertex(x[13],y[13],z[13]);
  vertex(x[14],y[14],z[14]);
  vertex(x[15],y[15],z[15]);

  vertex(x[8],y[8],z[8]);
  vertex(x[9],y[9],z[9]);
  vertex(x[10],y[10],z[10]);
  vertex(x[11],y[11],z[11]);

// larger cube
  vertex(x[0],y[0],z[0]);
  vertex(x[1],y[1],z[1]);
  vertex(x[2],y[2],z[2]);
  vertex(x[3],y[3],z[3]);

  vertex(x[2],y[2],z[2]);
  vertex(x[6],y[6],z[6]);
  vertex(x[7],y[7],z[7]);
  vertex(x[3],y[3],z[3]);

  vertex(x[6],y[6],z[6]);
  vertex(x[7],y[7],z[7]);
  vertex(x[4],y[4],z[4]);
  vertex(x[5],y[5],z[5]);

  vertex(x[4],y[4],z[4]);
  vertex(x[5],y[5],z[5]);
  vertex(x[1],y[1],z[1]);
  vertex(x[0],y[0],z[0]);

  vertex(x[1],y[1],z[1]);
  vertex(x[2],y[2],z[2]);
  vertex(x[6],y[6],z[6]);
  vertex(x[5],y[5],z[5]);

  vertex(x[0],y[0],z[0]);
  vertex(x[3],y[3],z[3]);
  vertex(x[7],y[7],z[7]);
  vertex(x[4],y[4],z[4]);

  // cross sections
  vertex(x[0],y[0],z[0]);
  vertex(x[8],y[8],z[8]);
  vertex(x[12],y[12],z[12]);
  vertex(x[4],y[4],z[4]);

  vertex(x[1],y[1],z[1]);
  vertex(x[5],y[5],z[5]);
  vertex(x[13],y[13],z[13]);
  vertex(x[9],y[9],z[9]);

  vertex(x[1],y[1],z[1]);
  vertex(x[5],y[5],z[5]);
  vertex(x[13],y[13],z[13]);
  vertex(x[9],y[9],z[9]);

  vertex(x[2],y[2],z[2]);
  vertex(x[6],y[6],z[6]);
  vertex(x[14],y[14],z[14]);
  vertex(x[10],y[10],z[10]);

  vertex(x[3],y[3],z[3]);
  vertex(x[7],y[7],z[7]);
  vertex(x[15],y[15],z[15]);
  vertex(x[11],y[11],z[11]);

  endShape();
  popMatrix();
}