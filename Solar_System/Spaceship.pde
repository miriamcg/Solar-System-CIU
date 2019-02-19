class Spaceship{
  
    PShape ship;
    float x;
    float y;
    float z;
    
    Spaceship(PShape ship, float x, float y, float z){
      this.ship = ship;
      this.x = x;
      this.y = y;
      this.z = z;
    }
    
    void moveShip(){
      if(keyPressed){
        if(key == 'a'){
          x -= 20;
        }else if (key == 'd'){
          x += 20;
        }else if (key == 'w'){
          y += 20;
        }else if (key == 's'){
          y -= 20;
        }else if (key == 'k'){
          z += 0.5;
        }else if (key == 'l'){
          z -= 0.5;
        }
      }
    }
    
    void display(){
      pushMatrix();
      scale(0.1);
      rotateX(PI);
      moveShip();
      rotateY(radians(z));
      translate(x, y, z);
      shape(ship);
      popMatrix();
    }
}
