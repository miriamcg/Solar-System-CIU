Star star;
Planet tatooine, alderaan, hoth, dabogah, endor;
Moon deathStar, endorMoon;
Spaceship ship;

PImage bg, tato, ald, ht, dg, end, starImg, ds, fm, mft;
float xShip, yShip, zShip;
boolean cam;
PFont font;
PShape mf;

void setup(){
  size(1200,800,P3D);
  
  bg = loadImage("st.jpg");
  tato = loadImage("tatooine.jpg");
  ald = loadImage("alderaan.jpg");
  ht = loadImage("hoth.png");
  dg = loadImage("dabogah.jpg");
  end = loadImage("endor.jpg");
  starImg = loadImage("sun.jpg");
  ds = loadImage("death.jpg");
  fm = loadImage("moon_endor.jpg");
  
  font = createFont("Starjedi.ttf", 52);
  
  mf = loadShape("mf.obj");
  
  xShip = -3000;
  yShip = -4500;
  zShip = 0;
  
  cam = false;
  
  star = new Star(100, 5, 0, 0.25, new PVector(width/2, height/2, -550), starImg);
  deathStar = new Moon(15, 1.6, 0, 0.02, new PVector(55, 0, 1), ds);
  endorMoon = new Moon(15, 1.6, 0, 0.02, new PVector(55, 0, 1), fm);
  tatooine = new Planet(50, 5, 0,  0.25, new PVector(40, 0, 1), tato, "Tatooine", null);
  alderaan = new Planet(70, 8, 0,  0.15, new PVector(40, 0, 1), ald, "Alderaan", deathStar);
  hoth = new Planet(35, 10, 0,  0.35, new PVector(40, 0, 1), ht, "Hoth", null);
  dabogah = new Planet(40, 13, 0,  0.3, new PVector(40, 0, 1), dg, "Dabogah", null);
  endor = new Planet(30, 15, 0,  0.4, new PVector(40, 0, 1), end, "Endor", endorMoon);
  ship = new Spaceship(mf, xShip, yShip, zShip);
}

void draw(){
  background(bg);

  textFont(font, 36);
  color c = color(245, 235, 0); 
  noStroke();
  fill(c);
  text("The planets and moons of Star Wars", width/2 - 380, height/2 - 330);
  
  star.orbit();
  star.displaySun();
  
  tatooine.orbit();
  tatooine.display();
  
  alderaan.orbit();
  alderaan.display();
  
  hoth.orbit();
  hoth.display();
  
  dabogah.orbit();
  dabogah.display();
  
  endor.orbit();
  endor.display();
  
  ship.display();
  
  instructions();
  
  if(!cam){
    ship.thirdPersonCamera();
  }else{
    ship.firstPersonCamera();
  }
}

void instructions(){
  textFont(font, 28);
  text("To pilot Millennium Falcon", -1050, 520, 0);
  text("Press A-D to move RIGHT/LEFT", -1050, 560, 0);
  text("Press W-S to move UP/DOWN", -1050, 600, 0);
  text("Press K-L to move FORWARD/BACKWARD", -1050, 640, 0);
  if(!cam){
    text("Press P to first person view", -1050, 680, 0);
  }else{
    text("Press O to third person view", -1050, 680, 0);
  }
}
