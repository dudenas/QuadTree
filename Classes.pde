class Pointt {
  PVector loc;

  Pointt(PVector loc) {
    this.loc = loc;
  }
}

class Rectangle {
  PVector loc;
  float w, h;

  Rectangle(PVector loc, float w, float h) {
    this.loc = loc;
    this.w = w;
    this.h = h;
  }

  boolean contains(Pointt p) {
    if (p.loc.x > loc.x - w &&
      p.loc.x < loc.x + w &&
      p.loc.y > loc.y - h &&
      p.loc.y < loc.y + h) {
      return true;
    } else return false;
  }
}

class QuadTree {
  Rectangle b;
  int capacity;
  Pointt[] points;
  boolean divided = false;

  QuadTree qne;
  QuadTree qnw;
  QuadTree qse;
  QuadTree qsw;

  QuadTree(Rectangle boundary, int capacity) {
    this.b = boundary;
    this.capacity = capacity;
    points = new Pointt[capacity];
  }

  int cp = 0;
  void insert(Pointt p) {
    if (b.contains(p)) {
      if (cp < capacity) {
        points[cp] = p;
        cp++;
      } else {
        if (!divided) {
          subdivide();
        }
        qne.insert(new Pointt(new PVector(random(width), random(height))));
        qnw.insert(new Pointt(new PVector(random(width), random(height))));
        qse.insert(new Pointt(new PVector(random(width), random(height))));
        qsw.insert(new Pointt(new PVector(random(width), random(height))));
      }
    }
  }

  void subdivide() {
    PVector vne = new PVector(b.loc.x + b.w/2, b.loc.y - b.h/2);
    Rectangle rne = new Rectangle(vne, b.w/2, b.h/2);
    qne = new QuadTree(rne, capacity);
    PVector vnw = new PVector(b.loc.x - b.w/2, b.loc.y - b.h/2);
    Rectangle rnw = new Rectangle(vnw, b.w/2, b.h/2);
    qnw = new QuadTree(rnw, capacity);
    PVector vse = new PVector(b.loc.x + b.w/2, b.loc.y + b.h/2);
    Rectangle rse = new Rectangle(vse, b.w/2, b.h/2);
    qse = new QuadTree(rse, capacity);
    PVector vsw = new PVector(b.loc.x - b.w/2, b.loc.y + b.h/2);
    Rectangle rsw = new Rectangle(vsw, b.w/2, b.h/2);
    qsw = new QuadTree(rsw, capacity);
    divided = true;
  }

  void show() {
    strokeWeight(1);
    stroke(255);
    noFill();
    rectMode(CENTER);
    rect(b.loc.x, b.loc.y, b.w*2, b.h*2);
    showPoint();
    if (divided) {
      qne.show();
      qnw.show();
      qse.show();
      qsw.show();
    }
  }

  void showPoint() {
    for (int i = 0; i < cp; i++) {
      Pointt p = points[i];
      strokeWeight(4);
      stroke(255);
      
      try {
        point(p.loc.x, p.loc.y);
      } 
      catch (NullPointerException e) {
        println("trouble bubble");
      }
    }
  }
}
