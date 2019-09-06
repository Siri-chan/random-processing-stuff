int player1y = 310;
int player2y = 310;
int score1 = 0;
int score2 = 0;
boolean[] keys;
int rad = 20;
float[] pos = {width/2, height/2};
float[] speed = {5,5};
float[] direction ={1, 1};

void setup(){
 size(1280,720);
 background(0);
 frameRate(30);
 ellipseMode(RADIUS);
  pos[0] = width/2;
  pos[1] = height/2;
  keys=new boolean[4];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
}
void draw(){
  background(0);
  stroke(255);
  strokeWeight(10);
   // Update the position of the shape
  pos[0] = pos[0] + ( speed[0] * direction[0] );
  pos[1] = pos[1] + ( speed[1] * direction[1] );
  if (pos[0] == 40 && pos[1] < player1y + 100 && pos[1] > player1y){
    direction[0] *= -1;
     pos[0] = pos[0] + ( 10 * direction[0] );
  }
   if (pos[0] == width-40 && pos[1] < player2y + 100 && pos[1] > player2y){
    direction[0] *= -1;
     pos[0] = pos[0] + ( 10 * direction[0] );
  }
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (pos[0] > width-rad) {
    if(pos[0] > width-rad){
      score1++;
    }
    direction[0] *= -1;
    pos[0] = width/2;
    pos[1] = height/2;    
  }
  if (pos[0] < rad){
    score2++;
        direction[0] *= -1;
    pos[0] = width/2;
    pos[1] = height/2;  
  }
  
  if (pos[1] > height-rad || pos[1] < rad) {
    direction[1] *= -1;
  }
  line(40, player1y, 40, player1y + 100);
  line(1240, player2y, 1240, player2y + 100);
   ellipse(pos[0], pos[1], rad, rad);
  if(keys[0]){
    if(player1y > 0){
    player1y -= 10;
    }
  }
  if(keys[1]){
   if(player1y + 100 < 720){
    player1y+= 10;
    }
  }
  if(keys[2]){
    if(player2y > 0){
    player2y-= 10;
    }
  }
  if(keys[3]){
   if(player2y + 100 < 720){
    player2y+= 10;
    }
  }
  text(score1,10,40);
  text(score2,width-10,40);
}
void keyPressed()
{
    if(key == 'w'){
    keys[0] = true;
  }
  if(key == 's'){
    keys[1] = true;
  
  }
if(keyCode == UP){
    keys[2] = true;
  }
if(keyCode == DOWN){
    keys[3] = true;
  }
}

void keyReleased()
{
{
    if(key == 'w'){
    keys[0] = false;
  }
  if(key == 's'){
    keys[1] = false;
  
  }
if(keyCode == UP){
    keys[2] = false;
  }
if(keyCode == DOWN){
    keys[3] = false;
  }
}
} 
