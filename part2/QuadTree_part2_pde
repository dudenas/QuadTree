QuadTree qt;

void setup() {
  size(500, 500);

  PVector locR = new PVector(width/2, height/2);
  Rectangle r = new Rectangle(locR, height/2, width/2);
  qt = new QuadTree(r, 4);

  for (int i = 0; i < 500; i++) {
    qt.insert(new Pointt(new PVector(random(width), random(height))));
  }
}

void draw() {
  ArrayList<Pointt> found = new ArrayList<Pointt>();
  background(0);

  qt.show();

  float r2 = 50;
  PVector locrange = new PVector(mouseX, mouseY);
  ArrayList<Pointt> points = new ArrayList<Pointt>();
  Rectangle range = new Rectangle(locrange, r2, r2);

  stroke(0, 0, 255);
  strokeWeight(3);
  noFill();
  rectMode(CENTER);
  rect(locrange.x, locrange.y, r2*2, r2*2);

  qt.query(range, points);

  for (Pointt p : points) {
    stroke(0, 0, 255);
    strokeWeight(6);
    point(p.loc.x, p.loc.y);
  }
}
