
ArrayList<Branch> tree = new ArrayList<Branch>();
ArrayList<Flouwer> flouwers = new ArrayList<Flouwer>();
int count = 0;
boolean lose = false;
float dist;
PVector mousePosition;

void settings(){
  size(800,800,P3D);
  
}
void setup(){

  PVector a = new PVector(width/2, height,0);
  PVector b = new PVector(width/2, height - height/3,0);
  Branch root = new Branch(a, b,42);
  tree.add(root);

}

//build grtz neles
void Bild(){
  if(count < 8){
  for(int i = tree.size() -1; i >= 0; i--){
    Branch current = tree.get(i);
    if(!current.finished){

      tree.add(current.branchA());
      tree.add(current.branchB());
    }
    current.finished = true;
  }
  count ++;
 
  //on the 6. Level: spawn the Leaves
  if(count > 6){
    for(int i = 0; i < tree.size(); i++){
      Branch current = tree.get(i);
      Flouwer blossom = new Flouwer(current.end.copy(),current.end.copy().sub(current.begin.copy()));
       
        int w = int(random(2,height/160));
       float x = w*cos((TWO_PI/5)*i) + current.end.copy().x;
       float y = w*sin((TWO_PI/5)*i) + current.end.copy().y;
       Flouwer blossom1 = new Flouwer(current.end.copy(),current.end.copy().sub(current.begin.copy()));



     //if the current Branch is on the last Level
      if(!current.finished){
       flouwers.add(blossom);
       flouwers.add(blossom1);
    }
    }
  }}
   
}

/**
* Displays the Tree
*/
void draw(){
  Bild();
  background(255);
 
  //forEach Branch of the Tree: Draw it
  for(int i = 0; i < tree.size(); i++){
    tree.get(i).show();
  }
 
  //forEach Leave: draw it
 
  for(int i = 0; i < flouwers.size(); i++){
    flouwers.get(i).show();
  }
  }
  void mouseReleased(){
  if (!lose){
  for(int i = 0; i < flouwers.size(); i++){
  mousePosition = new PVector(mouseX,mouseY);
  dist = dist(flouwers.get(i).location.x,flouwers.get(i).location.y,mousePosition.x,mousePosition.y);
   if(dist<50){
   flouwers.get(i).lose = true;
   //lose = true;
  }}
  }
 //   else if(lose){
 //    print("x");
 //    for(int i = 0; i < flouwers.size(); i++){
 //    flouwers.get(i).grow();
 //    flouwers.get(i).lose = false;
 //     lose = false;
  //   }
 // }

  }
