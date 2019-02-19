class Moon{
  
  int radius;
  float distance;
  float angle;
  float speed;
  PVector vector;
  PShape moon;
  
  Moon(int radius, float distance, float angle, float speed, PVector vector, PImage texture){
    this.radius = radius;
    this.distance = distance;
    this.angle = angle;
    this.speed = speed;
    this.vector = vector;
    
    noStroke();
    noFill();
    moon = createShape(SPHERE, radius);
    moon.setTexture(texture);
  }
  
  void orbit(){
    angle += speed;
    if(angle >= 360){
      angle = 0;
    }
  }
  
  void display(){
    pushMatrix(); 
    rotateY(angle); 
    translate(distance * vector.x, vector.y, vector.z); 
    shape(moon);
    popMatrix();
  }
}
