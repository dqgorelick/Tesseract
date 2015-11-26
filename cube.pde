float d1 = 1;
float d2 = 1;
float speed = 70;
int count = 0;
int pattern = 1;
float xmag, ymag = 0;
float newXmag, newYmag = 0;

float[] x = new float[] {-2,-2, 2, 2,-2,-2, 2, 2,-1,-1, 1, 1,-1,-1, 1, 1};
float[] y = new float[] {-2,-2,-2,-2, 2, 2, 2, 2,-1,-1,-1,-1, 1, 1, 1, 1};
float[] z = new float[] { 2,-2,-2, 2, 2,-2,-2, 2, 1,-1,-1, 1, 1,-1,-1, 1};
float[] x_temp = new float[] {-2,-2, 2, 2,-2,-2, 2, 2,-1,-1, 1, 1,-1,-1, 1, 1};
float[] y_temp = new float[] {-2,-2,-2,-2, 2, 2, 2, 2,-1,-1,-1,-1, 1, 1, 1, 1};
float[] z_temp = new float[] { 2,-2,-2, 2, 2,-2,-2, 2, 1,-1,-1, 1, 1,-1,-1, 1};

void resetShape(){
  for(int i = 0; i < 16; i++){
    x[i] = x_temp[i];
    y[i] = y_temp[i];
    z[i] = z_temp[i];
  }
};

int [][][] patterns = new int[][][] {
  {
    {0,3},{1,2},{2,10},{3,11},{4,7},{5,6},{6,14},{7,15},
    {8,0},{9,1},{10,9},{11,8},{12,4},{13,5},{14,13},{15,12}
  },
  {
    {0,8},{1,9},{2,1},{3,0},{4,12},{5,13},{6,5},{7,4},
    {8,11},{9,10},{10,2},{11,3},{12,15},{13,14},{14,6},{15,7}
  },
  {
    {0,8},{1,9},{2,10},{3,11},{4,12},{5,13},{6,14},{7,15},
    {8,0},{9,1},{10,2},{11,3},{12,4},{13,5},{14,6},{15,7}
  }
};

PVector [] vectors = new PVector[] {
  setVect(0,3), setVect(1,2), setVect(2,10), setVect(3,11),
  setVect(4,7), setVect(5,6), setVect(6,14), setVect(7,15),
  setVect(8,0), setVect(9,1), setVect(10,9), setVect(11,8),
  setVect(12,4), setVect(13,5), setVect(14,13), setVect(15,12)
};

// going from a to b
PVector setVect(int a, int b){
  return new PVector((x[b] - x[a])/speed, (y[b] - y[a])/speed, (z[b] - z[a])/speed);
}

void setPattern(int template){
  for(int i = 0; i < 16; i++){
    vectors[i] = setVect(patterns[template][i][0],patterns[template][i][1]);
  }
}
// true = forwards, false = backwards
void moveVects(boolean dir){
  for(int i = 0; i < 16; i++){
    if(dir){
      x[i] += vectors[i].x;
      y[i] += vectors[i].y;
      z[i] += vectors[i].z;
    } else {
      x[i] -= vectors[i].x;
      y[i] -= vectors[i].y;
      z[i] -= vectors[i].z;
    }
  }
}

void setup() {
  // size(640,640,P3D);
  fullScreen(P3D);
  strokeWeight(0.1);
  colorMode(RGB, 1);
}

void draw() {
  background(255, 255, 255);
  pushMatrix();
  translate(width/2, height/2, -30);
  // noFill();
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;

  if(mousePressed){
    if(count == speed){
      resetShape();
      count = 0;
      setPattern(pattern);
      pattern++;
      if(pattern == 3){
        pattern = 0;
      }
    }
    if(count < speed){
      moveVects(true);
      count++;
    }
  } else {
    if(count > 0){
      moveVects(false);
      count--;
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
  vertex(d1*x[12],d1*y[12],d1*z[12]);
  vertex(d1*x[15],d1*y[15],d1*z[15]);
  vertex(d1*x[11],d1*y[11],d1*z[11]);
  vertex(d1*x[8],d1*y[8],d1*z[8]);

  vertex(d1*x[15],d1*y[15],d1*z[15]);
  vertex(d1*x[14],d1*y[14],d1*z[14]);
  vertex(d1*x[10],d1*y[10],d1*z[10]);
  vertex(d1*x[11],d1*y[11],d1*z[11]);

  vertex(d1*x[14],d1*y[14],d1*z[14]);
  vertex(d1*x[13],d1*y[13],d1*z[13]);
  vertex(d1*x[9],d1*y[9],d1*z[9]);
  vertex(d1*x[10],d1*y[10],d1*z[10]);

  vertex(d1*x[8],d1*y[8],d1*z[8]);
  vertex(d1*x[9],d1*y[9],d1*z[9]);
  vertex(d1*x[13],d1*y[13],d1*z[13]);
  vertex(d1*x[12],d1*y[12],d1*z[12]);

  vertex(d1*x[12],d1*y[12],d1*z[12]);
  vertex(d1*x[13],d1*y[13],d1*z[13]);
  vertex(d1*x[14],d1*y[14],d1*z[14]);
  vertex(d1*x[15],d1*y[15],d1*z[15]);

  vertex(d1*x[8],d1*y[8],d1*z[8]);
  vertex(d1*x[9],d1*y[9],d1*z[9]);
  vertex(d1*x[10],d1*y[10],d1*z[10]);
  vertex(d1*x[11],d1*y[11],d1*z[11]);

// larger cube
  vertex(d2*x[0],d2*y[0],d2*z[0]);
  vertex(d2*x[1],d2*y[1],d2*z[1]);
  vertex(d2*x[2],d2*y[2],d2*z[2]);
  vertex(d2*x[3],d2*y[3],d2*z[3]);

  vertex(d2*x[2],d2*y[2],d2*z[2]);
  vertex(d2*x[6],d2*y[6],d2*z[6]);
  vertex(d2*x[7],d2*y[7],d2*z[7]);
  vertex(d2*x[3],d2*y[3],d2*z[3]);

  vertex(d2*x[6],d2*y[6],d2*z[6]);
  vertex(d2*x[7],d2*y[7],d2*z[7]);
  vertex(d2*x[4],d2*y[4],d2*z[4]);
  vertex(d2*x[5],d2*y[5],d2*z[5]);

  vertex(d2*x[4],d2*y[4],d2*z[4]);
  vertex(d2*x[5],d2*y[5],d2*z[5]);
  vertex(d2*x[1],d2*y[1],d2*z[1]);
  vertex(d2*x[0],d2*y[0],d2*z[0]);

  vertex(d2*x[1],d2*y[1],d2*z[1]);
  vertex(d2*x[2],d2*y[2],d2*z[2]);
  vertex(d2*x[6],d2*y[6],d2*z[6]);
  vertex(d2*x[5],d2*y[5],d2*z[5]);

  vertex(d2*x[0],d2*y[0],d2*z[0]);
  vertex(d2*x[3],d2*y[3],d2*z[3]);
  vertex(d2*x[7],d2*y[7],d2*z[7]);
  vertex(d2*x[4],d2*y[4],d2*z[4]);

  // cross sections
  vertex(d1*x[0],d1*y[0],d1*z[0]);
  vertex(d2*x[8],d2*y[8],d2*z[8]);
  vertex(d2*x[12],d2*y[12],d2*z[12]);
  vertex(d1*x[4],d1*y[4],d1*z[4]);

  vertex(d1*x[1],d1*y[1],d1*z[1]);
  vertex(d1*x[5],d1*y[5],d1*z[5]);
  vertex(d2*x[13],d2*y[13],d2*z[13]);
  vertex(d2*x[9],d2*y[9],d2*z[9]);

  vertex(d1*x[1],d1*y[1],d1*z[1]);
  vertex(d1*x[5],d1*y[5],d1*z[5]);
  vertex(d2*x[13],d2*y[13],d2*z[13]);
  vertex(d2*x[9],d2*y[9],d2*z[9]);

  vertex(d1*x[2],d1*y[2],d1*z[2]);
  vertex(d1*x[6],d1*y[6],d1*z[6]);
  vertex(d2*x[14],d2*y[14],d2*z[14]);
  vertex(d2*x[10],d2*y[10],d2*z[10]);

  vertex(d1*x[3],d1*y[3],d1*z[3]);
  vertex(d1*x[7],d1*y[7],d1*z[7]);
  vertex(d2*x[15],d2*y[15],d2*z[15]);
  vertex(d2*x[11],d2*y[11],d2*z[11]);

  endShape();
  popMatrix();
}