float xmag, ymag = 0;
float newXmag, newYmag = 0;
float d1 = 1;
float d2 = 1;
void setup() {
  size(640,640,P3D);
  // fullScreen(P3D);
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
    if(d1 < 1.5){
      d1 += 0.025;
    }
  } else {
    if(d1 > 0.75){
      d1 -= 0.025;
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

  vertex(-d1,  d1,  d1);
  vertex( d1,  d1,  d1);
  vertex( d1, -d1,  d1);
  vertex(-d1, -d1,  d1);

  vertex( d1,  d1,  d1);
  vertex( d1,  d1, -d1);
  vertex( d1, -d1, -d1);
  vertex( d1, -d1,  d1);

  vertex( d1,  d1, -d1);
  vertex(-d1,  d1, -d1);
  vertex(-d1, -d1, -d1);
  vertex( d1, -d1, -d1);

  vertex(-d1,  d1, -d1);
  vertex(-d1,  d1,  d1);
  vertex(-d1, -d1,  d1);
  vertex(-d1, -d1, -d1);

  vertex(-d1,  d1, -d1);
  vertex( d1,  d1, -d1);
  vertex( d1,  d1,  d1);
  vertex(-d1,  d1,  d1);

  vertex(-d1, -d1, -d1);
  vertex( d1, -d1, -d1);
  vertex( d1, -d1,  d1);
  vertex(-d1, -d1,  d1);

// larger cube
  vertex(-d2,  d2,  d2);
  vertex( d2,  d2,  d2);
  vertex( d2, -d2,  d2);
  vertex(-d2, -d2,  d2);

  vertex( d2,  d2,  d2);
  vertex( d2,  d2, -d2);
  vertex( d2, -d2, -d2);
  vertex( d2, -d2,  d2);

  vertex( d2,  d2, -d2);
  vertex(-d2,  d2, -d2);
  vertex(-d2, -d2, -d2);
  vertex( d2, -d2, -d2);

  vertex(-d2,  d2, -d2);
  vertex(-d2,  d2,  d2);
  vertex(-d2, -d2,  d2);
  vertex(-d2, -d2, -d2);

  vertex(-d2,  d2, -d2);
  vertex( d2,  d2, -d2);
  vertex( d2,  d2,  d2);
  vertex(-d2,  d2,  d2);

  vertex(-d2, -d2, -d2);
  vertex( d2, -d2, -d2);
  vertex( d2, -d2,  d2);
  vertex(-d2, -d2,  d2);

  // cross sections
  vertex(d1, d1, d1);
  vertex(d2, d2, d2);
  vertex(d2, -d2, d2);
  vertex(d1, -d1, d1);

  vertex(-d1, d1, d1);
  vertex(-d2, d2, d2);
  vertex(-d2, -d2, d2);
  vertex(-d1, -d1, d1);

  vertex(-d1, d1, -d1);
  vertex(-d2, d2, -d2);
  vertex(-d2, -d2, -d2);
  vertex(-d1, -d1, -d1);

  vertex(d1, d1, -d1);
  vertex(d2, d2, -d2);
  vertex(d2, -d2, -d2);
  vertex(d1, -d1, -d1);

  endShape();
  popMatrix();
}