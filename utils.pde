void vertex(PVector p_p){
  vertex(p_p.x,p_p.y,p_p.z);
}

void translate(PVector p_v){
  translate(p_v.x,p_v.y,p_v.z);
}

void triangle(Point p_p1, Point p_p2, Point p_p3){ // to call in a shape triangle
  vertex(p_p1.pos);
  vertex(p_p2.pos);
  vertex(p_p3.pos);
}

void quad(Point p_p1, Point p_p2, Point p_p3, Point p_p4){ // to call in a shape triangle
  vertex(p_p1.pos);
  vertex(p_p2.pos);
  vertex(p_p3.pos);
  
  vertex(p_p2.pos);
  vertex(p_p3.pos);
  vertex(p_p4.pos);
}
 
Point interp(Point p_p1, Point p_p2, ArrayList<Primitive> p_primitives) {
  Point m = null;
  Point start = p_p1;
  Point stop = p_p2;
  for(int i=0; i<REC_INTERP ;i++){
    if(start.valid == stop.valid){break;}
    m = new Point(PVector.lerp(start.pos, stop.pos, 0.5), p_primitives);
    if(m.valid == p_p1.valid){start=m;}
    else{stop=m;}
  }
  return m;
}
