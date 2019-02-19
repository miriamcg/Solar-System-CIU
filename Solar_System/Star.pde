class Star{
   
  int radius;
  float distance;
  float angle;
  float speed;
  PVector vector;
  PShape star;
  
  Star(int radius, float distance, float angle, float speed, PVector vector, PImage texture){
    this.radius = radius;
    this.distance = distance;
    this.angle = angle;
    this.speed = speed;
    this.vector = vector;
    
    noStroke();
    noFill();
    star = createShape(SPHERE, radius);
    star.setTexture(texture);
   }
  
  void orbit(){
    angle += speed;
    if(angle >= 360){
      angle = 0;
    }
  }
  
  void displaySun(){
    translate(vector.x, vector.y, vector.z);
    pushMatrix();
    rotateY(radians(angle));
    shape(star);
    popMatrix();
  }
}
