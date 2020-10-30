//> make 10 polgas behind current polga (like a tail)
//> the polgas behind should minimize and their alpha should be turned down as they approach polgas[0]

//polga.png (366x490)

int[] windowSize = {1600,900};
PImage polgaImg;
float x = random(366/2,width-366/2);
float y = random(490/2,height-490/2);
float speedX = random(-6,7);
float speedY = random(-6,7);
float scale = 0.995;

Polga[] tail = new Polga[1];
Polga big,small;

void settings() {
  size(windowSize[0],windowSize[1]);
}

void setup() {
  imageMode(CENTER);
  polgaImg = loadImage("polga.png");
  for(int i = 0; i < tail.length; i++) {
    tail[i] = new Polga(true,polgaImg,mouseX,mouseY,float(polgaImg.width),float(polgaImg.height));
  }
  big = new Polga(true,polgaImg,mouseX,mouseY,float(polgaImg.width),float(polgaImg.height));
  small = new Polga(false,polgaImg,x,y,(polgaImg.width)/2,(polgaImg.height)/2,speedX,speedY);
}

void draw() {
  background(0);
  fill(0,255,0);
  small.update();
  //> polga tail
  for(int i = tail.length-1; i > 0; i--) {
    tail[i].x = tail[i-1].x;
    tail[i].y = tail[i-1].y;
    tail[i].sizeX = tail[i-1].sizeX*pow(scale,i);
    tail[i].sizeY = tail[i-1].sizeY*pow(scale,i);
  }
  for(int i = 0; i < tail.length; i++) {
    tail[i].update();
    tail[i].follow();
  }
  big.update();
}
