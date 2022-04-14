final int NB = 30;        // nomber of vertice by size
final int SIZE = 8;      // size of 1 vertice
final int MAX_LIMITE = NB*SIZE/2;
final int MIN_LIMITE = -MAX_LIMITE;

float angle = 0;
ArrayList<Primitive> primitives = new ArrayList<>();
Point[][][] field = new Point[NB+1][NB+1][NB+1];

void setup() {
  size(500, 500, P3D);
  primitives.add(new Metaball(new Center(new PVector(0,0,0),new PVector(0,0,0)), 20));
  primitives.add(new Metaball(new Center(new PVector(0,0,0),new PVector(-1,-1,-1)), 15));
  primitives.add(new Metaball(new Center(new PVector(0,0,0),new PVector(1,0.5,0.7)), 15));
  primitives.add(new Metaball(new Center(new PVector(0,0,0),new PVector(4,0,0.31)), 15));
  primitives.add(new Metaball(new Center(new PVector(0,0,0),new PVector(1,-1,-2)), 15));
  
  for(int x=0; x<=NB ;x++){
    for(int y=0; y<=NB ;y++){
      for(int z=0; z<=NB ;z++){
        field[x][y][z] = new Point(new PVector(x*SIZE+MIN_LIMITE, y*SIZE+MIN_LIMITE, z*SIZE+MIN_LIMITE));
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

  // todo update+1

  for(int x=0; x<NB ;x++){
    for(int y=0; y<NB ;y++){
      for(int z=0; z<NB ;z++){
        field[x][y][z].update(primitives);
        Point[] points = findBox(x,y,z);
     

        Tetrahedra t1 = new Tetrahedra(points[0], points[2], points[3], points[6]);
        t1.display();
        Tetrahedra t2 = new Tetrahedra(points[0], points[3], points[5], points[6]);
        t2.display();
        Tetrahedra t3 = new Tetrahedra(points[0], points[4], points[5], points[6]);
        t3.display();
        Tetrahedra t4 = new Tetrahedra(points[0], points[1], points[3], points[5]);
        t4.display();
        Tetrahedra t5 = new Tetrahedra(points[3], points[5], points[6], points[7]);
        t5.display();
      }
    }
  }
  
  for(Primitive p : primitives){p.move(MIN_LIMITE,MAX_LIMITE);}
  
  angle += PI/150;
}

Point[] findBox(int p_x, int p_y, int p_z){
  Point[] points = new Point[8];
  
  points[0] = field[p_x  ][p_y  ][p_z  ];
  points[1] = field[p_x+1][p_y  ][p_z  ];
  points[2] = field[p_x  ][p_y+1][p_z  ];
  points[3] = field[p_x+1][p_y+1][p_z  ];
  points[4] = field[p_x  ][p_y  ][p_z+1];
  points[5] = field[p_x+1][p_y  ][p_z+1];
  points[6] = field[p_x  ][p_y+1][p_z+1];
  points[7] = field[p_x+1][p_y+1][p_z+1];
  
  return points;
}
