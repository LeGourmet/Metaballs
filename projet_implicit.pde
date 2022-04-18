final float DELTA = PI/180;
PVector TRANSLATE;

final int NB = 30;                  // number of vertex by axis
final int SIZE = 8;                 // size of 1 vertice
final int MAX_LIMITE = NB*SIZE/2;   // LIMITE MAX OF CUBE (FOR VELOCITY)
final int MIN_LIMITE = -MAX_LIMITE; // LIMITE MIN OF CUBE (FOR VELOCITY)
final int NB_OBJ = 20;              // number of metaball
final int REC_INTERP = 10;


float angle = 0;
ArrayList<Primitive> primitives = new ArrayList<>();
ArrayList<Tetrahedra> field = new ArrayList<>();
Point[][][] points = new Point[NB+1][NB+1][NB+1];

void setup() {
  size(500, 500, P3D);
  TRANSLATE = new PVector(height/2,width/2,-MIN_LIMITE);
  for(int i=0; i<NB_OBJ ;i++){primitives.add(new Metaball(MIN_LIMITE,MAX_LIMITE));}
  primitives.add(new Metaplane(MAX_LIMITE-SIZE*2));
  
  for(int x=0; x<=NB ;x++)
    for(int y=0; y<=NB ;y++)
      for(int z=0; z<=NB ;z++)
        points[x][y][z] = new Point(new PVector(x*SIZE+MIN_LIMITE, y*SIZE+MIN_LIMITE, z*SIZE+MIN_LIMITE), primitives);
  
  for(int x=0; x<NB ;x++){
    for(int y=0; y<NB ;y++){
      for(int z=0; z<NB ;z++){
        Point p0 = points[x  ][y  ][z  ]; // back  top left
        Point p1 = points[x+1][y  ][z  ]; // back  top right
        Point p2 = points[x  ][y+1][z  ]; // back  bot left  
        Point p3 = points[x+1][y+1][z  ]; // back  bot right
        Point p4 = points[x  ][y  ][z+1]; // front top left
        Point p5 = points[x+1][y  ][z+1]; // front top right
        Point p6 = points[x  ][y+1][z+1]; // front bot left
        Point p7 = points[x+1][y+1][z+1]; // front bot right
        
        // 5 thetrahedron
        /*
        field.add(new Tetrahedra(p0, p3, p5, p6, primitives));  // center
        field.add(new Tetrahedra(p0, p1, p3, p5, primitives));  // back top right corner
        field.add(new Tetrahedra(p0, p2, p3, p6, primitives));  // back bot left corner
        field.add(new Tetrahedra(p0, p4, p5, p6, primitives));  // front top left corner 
        field.add(new Tetrahedra(p3, p5, p6, p7, primitives));  // front bot right corner
        */
        
        // 6 thetrahedron
        field.add(new Tetrahedra(p1, p2, p0, p5, primitives));
        field.add(new Tetrahedra(p4, p2, p5, p0, primitives));
        field.add(new Tetrahedra(p3, p5, p2, p1, primitives));
        field.add(new Tetrahedra(p4, p5, p2, p6, primitives));
        field.add(new Tetrahedra(p5, p6, p7, p2, primitives));
        field.add(new Tetrahedra(p5, p2, p7, p3, primitives));
      }
    }
  }
  
  fill(50,50,200);
  noStroke();
}

void draw() {
  background(0);
  lights();
  translate(TRANSLATE);
  rotateY(angle);

  for(int x=0; x<=NB ;x++)
    for(int y=0; y<=NB ;y++)
      for(int z=0; z<=NB ;z++)
        points[x][y][z].update();
      
  for(Tetrahedra t : field){beginShape(TRIANGLES); t.update(); endShape(CLOSE);}
  for(Primitive p : primitives){p.move(MIN_LIMITE,MAX_LIMITE);}
  
  angle += DELTA;
}
