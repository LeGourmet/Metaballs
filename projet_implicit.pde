final int NB = 25;                  // nomber of vertice by size
final int SIZE = 8;                 // size of 1 vertice
final int MAX_LIMITE = NB*SIZE/2;   // LIMITE MAX OF CUBE (FOR VELOCITY)
final int MIN_LIMITE = -MAX_LIMITE; // LIMITE MIN OF CUBE (FOR VELOCITY)
final int NB_OBJ = 5;               // number of metaball
final int REC_INTERP = 5;

float angle = 0;
ArrayList<Primitive> primitives = new ArrayList<>();
ArrayList<Tetrahedra> field = new ArrayList<>();
Point[][][] points = new Point[NB+1][NB+1][NB+1];

void setup() {
  size(500, 500, P3D);
  for(int i=0; i<NB_OBJ ;i++){primitives.add(new Metaball(MIN_LIMITE,MAX_LIMITE));}
  primitives.add(new Metaplane(MIN_LIMITE+SIZE+1));
  
  for(int x=0; x<=NB ;x++)
    for(int y=0; y<=NB ;y++)
      for(int z=0; z<=NB ;z++)
        points[x][y][z] = new Point(new PVector(x*SIZE+MIN_LIMITE, y*SIZE+MIN_LIMITE, z*SIZE+MIN_LIMITE));
  
  for(int x=0; x<NB ;x++){
    for(int y=0; y<NB ;y++){
      for(int z=0; z<NB ;z++){
        Point p0 = points[x  ][y  ][z  ];
        Point p1 = points[x+1][y  ][z  ];
        Point p2 = points[x  ][y+1][z  ];
        Point p3 = points[x+1][y+1][z  ];
        Point p4 = points[x  ][y  ][z+1];
        Point p5 = points[x+1][y  ][z+1];
        Point p6 = points[x  ][y+1][z+1];
        Point p7 = points[x+1][y+1][z+1];
        
        field.add(new Tetrahedra(p0, p2, p3, p6));
        field.add(new Tetrahedra(p0, p3, p5, p6));
        field.add(new Tetrahedra(p0, p4, p5, p6));
        field.add(new Tetrahedra(p0, p1, p3, p5));
        field.add(new Tetrahedra(p3, p5, p6, p7));
      }
    }
  }
  
  stroke(255);
}

void draw() {
  background(0); 
  lights();
  translate(width/2, height/2, -MIN_LIMITE);
  rotateY(angle);

  for(int x=0; x<=NB ;x++)
    for(int y=0; y<=NB ;y++)
      for(int z=0; z<=NB ;z++)
        points[x][y][z].update(primitives);
      
  
  for(Tetrahedra t : field){t.update();}
  
  for(Primitive p : primitives){p.move(MIN_LIMITE,MAX_LIMITE);}
  
  angle += PI/150;
}
