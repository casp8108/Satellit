/*class Location{
    
  JSONObject Jay;
  Location(JSONObject PosJay){
    Jay = PosJay;
  }
  
  void display(){
    for (TableRow row : table.rows()) {
    
 JSONArray positions = this.Jay.getJSONArray("positions");

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

    translate(x, y, z);

    rotate(angleb, raxis.x, raxis.y, raxis.z);

    fill(255);

    box(10, 10, 10);

    popMatrix();
    }
  }
}*/
