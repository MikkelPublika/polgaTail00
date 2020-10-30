class Polga {
  float x,y,sizeX,sizeY,speedX,speedY;
  boolean switcher;
  PImage img;
  
  //> big polga constructor
  Polga(boolean switcher, PImage img, float x, float y, float sizeX, float sizeY) {
    this.switcher = switcher;
    this.img = img;
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }
  
  //> small polga constructor
  Polga(boolean switcher, PImage img, float x, float y, float sizeX, float sizeY, float speedX, float speedY) {
    this.switcher = switcher;
    this.img = img;
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.speedX = speedX;
    this.speedY = speedY;
  }
  
  void update() {
    if(switcher) {
      follow();
    }
    else {
      display();
      move();
      bounce();
    }
  }
  
  void follow() {
    image(img,mouseX,mouseY,sizeX,sizeY);
  }
  
  void display() {
    image(img,x,y,sizeX,sizeY);
  }
  
  void move() {
    x+=speedX;
    y+=speedY;
  }
  
  void bounce() {
    if(x <= sizeX/2 || x >= width-sizeX/2)
      speedX*=-1;
    if(y <= sizeY/2 || y >= height-sizeY/2)
      speedY*=-1;
  }
}
