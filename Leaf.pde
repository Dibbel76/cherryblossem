class Leaf{
ArrayList<Leaf> leaves = new ArrayList<Leaf>();
public PVector location;
public boolean lose = false;
public float dropSpeed;
public float dropDirection;
int red;
int green;
int bleu;

int alfa;
int lWidth;
int lHeight;

Leaf(PVector location, int lWidth,int lHeight,int red, int green, int bleu, int alfa){

  this.location = location;
  this.red=red;
  this.green=green;
  this.bleu=bleu;
  this.lWidth = lWidth;
  this.lHeight = lHeight;
  this.alfa = alfa;
  dropSpeed = random(0.2,0.5);
  dropDirection = random(-0.1,0.1);
                                        //242 138 188
                                       //232 74 150
}

void show(){
    //location.sub(direction.div(2));
for (int i = 0; i<5;i++){
  if(lose){drop();}
  noStroke();
  fill(this.red,this.green,this.bleu,this.alfa);
  ellipse(this.location.x,this.location.y,lWidth,lHeight);
  noFill();
}


}

void drop(){
  if (this.location.y < height){
  this.location.y += dropSpeed;
  this.location.x += dropDirection;
  }
}
}
