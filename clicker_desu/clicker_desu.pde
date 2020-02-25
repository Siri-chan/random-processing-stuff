int clicks=0;
int up=1;
float[] bg={0,0,0};
int[] level={0,0};
int[] upgradecost = {100, 500};
PrintWriter output;
String[] lines;
int index = 0;
boolean die=false;
void setup(){
  background(bg[0],bg[1],bg[2]);
  size(1280,720);
  frameRate(10); 
  lines = loadStrings("user.save");
  /*
  !!IMPORTANT DEV NOTE!!
  This line being uncommented resets your save
  output = createWriter("user.save");
  */
}
void draw(){
  if (index < lines.length) {
    String[] pieces = split(lines[index], ',');
    if (pieces.length > 5 && die == false) {
      up = int(pieces[0]);
      clicks = int(pieces[1]);
      level[0] = int(pieces[2]);      
      level[1] = int(pieces[3]);
      upgradecost[0] = int(pieces[4]);
      upgradecost[1] = int(pieces[5]);
      die=true;
    }
  }
  background(bg[0],bg[1],bg[2]);
  fill(128);
  stroke(random(255),random(255),random(255));
  strokeWeight(random(30));
  rect(30,height/2-50,width-60,100);
  fill(20);
  textSize(32);
  text(clicks, 60, height/2+20);
  textSize(18);
  noStroke();
  rect(20,20,width-20,height/3);
  fill(128);
  text("press 'Q' key to buy an upgrade for "+upgradecost[0]+". current level:"+level[0], 20,20,width,999);
  text("press 'W' key to buy a upgrade for "+upgradecost[1]+". current level:"+level[1],20,60);
  text("press 'S' key to save",20,80);
  text("press 'A' key to save and quit",20,100);

}
void keyPressed(){
  if (key=='q'){
    if (clicks > upgradecost[0]){
    clicks-=upgradecost[0];
    up++;
    level[0]++;
    upgradecost[0]+=100;
    }
  }
    if (key=='w'){
    if (clicks > upgradecost[1]){
    clicks-=upgradecost[1];
    up+=2;
    level[1]++;
    upgradecost[1]+=500;
    }
  }
  if (key=='s'){
      println("saved!");
      output = createWriter("user.save");
      output.println(up + "," + clicks + ',' + level[0] + "," + level[1] + "," + upgradecost[0] + "," + upgradecost[1]);
      output.flush();
      output.close();
  }
    if (key=='a'){
      println("saved!");
      output = createWriter("user.save");
      output.println(up + "," + clicks + ',' + level[0] + "," + level[1] + "," + upgradecost[0] + "," + upgradecost[1]);
      output.flush();
      output.close();
      exit();
  }
}
void mouseClicked(){
    bg[0]=random(255);
    bg[1]=random(255);
    bg[2]=random(255);
    clicks+=up;
}