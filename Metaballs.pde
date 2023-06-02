import peasy.*;

final int NB_VERTICES   = 30;                          // number of vertex by axis
final int SIZE_VERTICE  = 8;
final int BOUND_MAX     = NB_VERTICES*SIZE_VERTICE/2;  // bound max of the cube 
final int BOUND_MIN     = -BOUND_MAX;                  // bound max of the cube 
final int NB_BALLS      = 20;

PeasyCam camera;
ArrayList<Primitive> primitives = new ArrayList<>();
ArrayList<Tetrahedra> field = new ArrayList<>();
Point[][][] points = new Point[NB_VERTICES+1][NB_VERTICES+1][NB_VERTICES+1];

void setup() {
  size(1200, 800, P3D);
  camera = new PeasyCam(this,300.);
  
  for(int i=0; i<NB_BALLS ;i++){primitives.add(new Metaball(BOUND_MIN,BOUND_MAX));}
  primitives.add(new Metaplane(BOUND_MAX-SIZE_VERTICE*2, new PVector(0.f,1.f,0.f)));
  
  for(int x=0; x<points.length ;x++)
    for(int y=0; y<points[x].length ;y++)
      for(int z=0; z<points[x][y].length ;z++)
        points[x][y][z] = new Point(new PVector(x*SIZE_VERTICE+BOUND_MIN, y*SIZE_VERTICE+BOUND_MIN, z*SIZE_VERTICE+BOUND_MIN));
  
  for(int x=0; x<points.length-1 ;x++)
    for(int y=0; y<points[x].length-1 ;y++)
      for(int z=0; z<points[x][y].length-1 ;z++){
        Point p0 = points[x  ][y  ][z  ]; // back  top left
        Point p1 = points[x+1][y  ][z  ]; // back  top right
        Point p2 = points[x  ][y+1][z  ]; // back  bot left  
        Point p3 = points[x+1][y+1][z  ]; // back  bot right
        Point p4 = points[x  ][y  ][z+1]; // front top left
        Point p5 = points[x+1][y  ][z+1]; // front top right
        Point p6 = points[x  ][y+1][z+1]; // front bot left
        Point p7 = points[x+1][y+1][z+1]; // front bot right
        
        // 5 thetrahedron
        /*field.add(new Tetrahedra(p0, p3, p5, p6));  
        field.add(new Tetrahedra(p0, p1, p3, p5));  
        field.add(new Tetrahedra(p0, p2, p3, p6));  
        field.add(new Tetrahedra(p0, p4, p5, p6));  
        field.add(new Tetrahedra(p3, p5, p6, p7));*/
        
        // 6 thetrahedron
        field.add(new Tetrahedra(p1, p2, p0, p5));
        field.add(new Tetrahedra(p4, p2, p5, p0));
        field.add(new Tetrahedra(p3, p5, p2, p1));
        field.add(new Tetrahedra(p4, p5, p2, p6));
        field.add(new Tetrahedra(p5, p6, p7, p2));
        field.add(new Tetrahedra(p5, p2, p7, p3));
      }
  
  noStroke();
}

void draw() {
  background(0);
  lights();

  for(int x=0; x<points.length ;x++)
    for(int y=0; y<points[x].length ;y++)
      for(int z=0; z<points[x][y].length ;z++)
        points[x][y][z].update();
  
  fill(50,50,200);
  for(Tetrahedra t : field){beginShape(TRIANGLES); t.update(); endShape(CLOSE);}
  for(Primitive p : primitives){p.move(BOUND_MIN,BOUND_MAX);}
  
  camera.beginHUD();
  fill(255);
  text("fps : " + frameRate, width*0.05,height*0.05,0);
  camera.endHUD();
}
