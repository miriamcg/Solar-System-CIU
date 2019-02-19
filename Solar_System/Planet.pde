class Planet{
  
  int radius;
  int distance;
  float angle;
  float speed;
  PVector vector;
  PShape planet;
  String name;
  Moon moon;
  
  Planet(int radius, int distance, float angle, float speed, PVector vector, PImage texture, String name, Moon moon){
    this.radius = radius;
    this.distance = distance;
    this.angle = angle;
    this.speed = speed;
    this.vector = vector;
    
    noStroke();
    noFill();
    planet = createShape(SPHERE, radius);
    planet.setTexture(texture);
    
    this.name = name;
    this.moon = moon;
  }
  
  void orbit(){
    angle += speed;
    if(angle >= 360){
      angle = 0;
    }
    if(moon != null){
      moon.orbit();
    }
  }
  
  void display(){
    pushMatrix();
    rotateY(radians(angle));
    translate(distance * vector.x, vector.y, vector.z);
    shape(planet);
    textFont(font, 16);
    text(name, -50, radius + 30);
    if(moon != null){
      moon.display();
    }
    popMatrix();
  }
}
