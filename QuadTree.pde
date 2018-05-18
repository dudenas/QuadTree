QuadTree qt;

void setup() {
  size(500, 500);

  PVector locR = new PVector(width/2, height/2);
  Rectangle r = new Rectangle(locR, height/2, width/2);
  qt = new QuadTree(r, 4);
  
  //for (int i = 0; i < 500; i++) {
  //  qt.insert(new Pointt(new PVector(random(width), random(height))));
  //}

  background(0);
  
  //qt.show();
}

void draw() {
  background(0);
  qt.show();
}

void mouseDragged() {
  PVector loc = new PVector(mouseX,mouseY);
  Pointt mouse = new Pointt(loc);
  qt.insert(mouse);
}
