// 3D Earthquake Data Visualization

// The Coding Train / Daniel Shiffman

// https://thecodingtrain.com/CodingChallenges/058-earthquakeviz3d.html

// https://youtu.be/dbs4IYGfAXc

// https://editor.p5js.org/codingtrain/sketches/tttPKxZi


float rotator;

float angle;

JSONObject Jay;

Table table;

float r = 150;

PImage earth;

PShape globe;



void setup() {

  size(600, 600, P3D);
  earth = loadImage("earth.jpg"); //prøv Albert.png og b4nny.png og earth.jpg
  // table = loadTable("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_day.csv", "header");
  table = loadTable("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv", "header"); //der DER DER WAAHH WAAA SE MIG ***********************************
  Jay = loadJSONObject("https://www.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=EVZW8Y-GY7GW3-U6FV47-4KH5");
 

  noStroke();
  globe = createShape(SPHERE, r);
  globe.setTexture(earth);
 
}



void draw() {
   JSONArray posit = Jay.getJSONArray("positions");

    JSONObject a = posit.getJSONObject(0);

    float latt = a.getFloat("satlatitude");

    float lont = a.getFloat("satlongitude");
    float time = a.getFloat("timestamp");
  clear();
  text("The white box shows the position of the satelite Space station",0,10);
  text("Satelite latitude  "+latt,0,20);
  text("Satelite longitude "+lont,0,30);
  text("Timestamp  "+time,0,40);
  translate(width*0.5, height*0.5);
  rotateY(angle);

 rotator = 1;
 
  angle += rotator/5; // divideret med 2 er bare fordi så er det langsommere

  lights();
  fill(200);
  noStroke();
  //sphere(r);
  shape(globe);

  for (TableRow row : table.rows()) {

    JSONArray positions = Jay.getJSONArray("positions");

    JSONObject o = positions.getJSONObject(0);

    float lat = o.getFloat("satlatitude");

    float lon = o.getFloat("satlongitude");


    // original version

    // float theta = radians(lat) + PI/2;



    // fix: no + PI/2 needed, since latitude is between -180 and 180 deg

    float theta = radians(lat);



    float phi = radians(lon) + PI;



    // original version

    // float x = r * sin(theta) * cos(phi);

    // float y = -r * sin(theta) * sin(phi);

    // float z = r * cos(theta);



    // fix: in OpenGL, y & z axes are flipped from math notation of spherical coordinates

    float x = r * cos(theta) * cos(phi)-40;

    float y = -r * sin(theta);

    float z = -r * cos(theta) * sin(phi);


    PVector pos = new PVector(x, y, z);

    PVector xaxis = new PVector(1, 0, 0);

    float angleb = PVector.angleBetween(xaxis, pos);

    PVector raxis = xaxis.cross(pos);


    pushMatrix();
text("SPACE STATION",10,10);
    translate(x, y, z);

    rotate(angleb, raxis.x, raxis.y, raxis.z);

    fill(255);
   
    box(10, 10, 10);
    
    popMatrix();
  }
}
