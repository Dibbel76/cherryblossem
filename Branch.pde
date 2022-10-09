/**
* representing a Branch of the FractalTree
* @author Lukas Klassen
*/
class Branch{
 
  /**
  * Start and end Point of the Branch
  */
  public PVector begin;
  public PVector end;
  public boolean finished = false;
  public float w;
 
  /**
  * create Branch with beginning and end-Point
  * @param beging Startpoint
  * @param end Endpoint
  */
  Branch(PVector begin, PVector end, float w){
    this.begin = begin;
    this.end = end;
    this.w = w;
   
   
  }
 
  /**
  * jitters the Branch (randomly change the end-Point a bit)
  */
  void jitter(){
    end.x += random(-1, 1);
    end.y += random(-1, 1);
  }
 
  /**
  * displays the Branch
  */
  void show(){
    stroke(163,146,88);
    strokeWeight(w);
    line(begin.x, begin.y, end.x, end.y);
  }
 
  /**
  * generates a new Branch for the right-side
  */
  Branch branchA(){
    PVector dir = PVector.sub(end, begin);
    dir.rotate(random(PI / random(3, 6),PI / random(5,8)));
    dir.mult(0.75);
    PVector newEnd = PVector.add(end, dir);
    Branch b = new Branch(end, newEnd,w*0.7);
    return b;
  }
 
  /**
  * generates a new Branch for the left-side
  */
  Branch branchB(){
    PVector dir = PVector.sub(end, begin);
    dir.rotate(- random(PI / 4,PI / 5));
    dir.mult(0.67);
    PVector newEnd = PVector.add(end, dir);
    Branch b = new Branch(end, newEnd,w*0.7);
    return b;
  }
 
 
}
