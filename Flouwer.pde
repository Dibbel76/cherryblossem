class Flouwer{
ArrayList<Leaf> leaves = new ArrayList<Leaf>();
public PVector location;
public PVector direction;
public boolean lose = false;
public float dropSpeed;
public float dropDirection;
int allGone = 0;
Leaf leaf;
int red;
int green;
int bleu;

int alfa;
int lWidth;
int lHeight;

Flouwer(PVector location,PVector direction){
  this.direction = direction;
  this.location = location;
  this.lWidth = height/160;
  this.lHeight = height/160;
  grow();


  dropSpeed = random(0.2,0.5);
  dropDirection = random(-0.1,0.1);
                                        //242 138 188
                                       //232 74 150
}

void show(){

for (int i = 0; i<leaves.size();i++){
  if(lose){drop();}
  leaves.get(i).show();
}


}

void drop(){
  
  
  for(int i = 0; i < leaves.size()-1; i++){
     if (leaves.get(i).lose == true){ allGone+=1;}
     if (allGone == leaves.size()-1) {leaves.get(leaves.size()-1).lose=true;}
     int r = int(random(0,2));
     if (r!=0){
    leaves.get(i).lose = true;
     
}
    this.lose=false;
  }
}

void grow(){
   leaves.clear();
  
  alfa = int(random(100,255));


for (int i=0;i<5;i++){
 
  this.red=int(random(242, 232));
  this.green=int(random(200, 232));
  this.bleu=int(random(200, 240));
  int w = int(random(2,height/160));
  
  float x = w*cos((TWO_PI/5)*i) + location.copy().x;
  float y = w*sin((TWO_PI/5)*i) + location.copy().y;
  PVector newloc = new PVector(x,y);
  leaf = new Leaf(newloc,this.lWidth,this.lHeight,this.red,this.green,this.bleu,alfa);
  leaves.add(leaf);
}
this.red=int(random(242, 232));
  this.green=int(random(138, 74));
  this.bleu=int(random(188, 150));
leaf = new Leaf(new PVector(location.x,location.y),this.lWidth/2,this.lHeight/2,this.red,this.green,this.bleu,alfa);
leaves.add(leaf);
}

}
