final int NB = 10;        // nomber of vertice by size
final int SIZE = 20;      // size of 1 vertice
final int MAX_LIMITE = NB*SIZE/2;
final int MIN_LIMITE = -MAX_LIMITE;

float angle = 0;
ArrayList<Primitive> primitives = new ArrayList<>();

void setup() {
  size(500, 500, P3D);
  primitives.add(new Metaball(new Center(new PVector(0,0,0),new PVector(0,0,0)), 50));
  primitives.add(new Metaball(new Center(new PVector(0,0,0),new PVector(-1,-1,-1)), 50));
  stroke(255);
}

void draw() {
  background(0); 
  lights();
  translate(width/2, height/2, 0);
  rotateY(angle);
  
  
  for(int x=0; x<NB ;x++){
    for(int y=0; y<NB ;y++){
      for(int z=0; z<NB ;z++){
        Point[] points = generatePoint(new PVector(x,y,z));
        
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

Point[] generatePoint(PVector p_point){
  Point[] points = new Point[8];
  float x  =  p_point.x    * SIZE + MIN_LIMITE;
  float x1 = (p_point.x+1) * SIZE + MIN_LIMITE;
  float y  =  p_point.y    * SIZE + MIN_LIMITE;
  float y1 = (p_point.y+1) * SIZE + MIN_LIMITE;
  float z  =  p_point.z    * SIZE + MIN_LIMITE;
  float z1 = (p_point.z+1) * SIZE + MIN_LIMITE;
    
  points[0] = new Point(new PVector( x,  y,  z), primitives);
  points[1] = new Point(new PVector(x1,  y,  z), primitives);
  points[2] = new Point(new PVector( x, y1,  z), primitives);
  points[3] = new Point(new PVector(x1, y1,  z), primitives);
  points[4] = new Point(new PVector( x,  y, z1), primitives);
  points[5] = new Point(new PVector(x1,  y, z1), primitives);
  points[6] = new Point(new PVector( x, y1, z1), primitives);
  points[7] = new Point(new PVector(x1, y1, z1), primitives);

  return points;
}
