void vertex(PVector p_p){
  vertex(p_p.x,p_p.y,p_p.z);
}

void triangle(Point p_p1, Point p_p2, Point p_p3){
  beginShape(TRIANGLE);
  vertex(p_p1.pos);
  vertex(p_p2.pos);
  vertex(p_p3.pos);
  endShape();
}

void quad(Point p_p1, Point p_p2, Point p_p3, Point p_p4){
  beginShape();
  vertex(p_p1.pos);
  vertex(p_p2.pos);
  vertex(p_p3.pos);
  vertex(p_p4.pos);
  endShape();
}
 
Point interp(Point p_p1, Point p_p2, ArrayList<Primitive> p_primitives) {
  if(p_p1.valid==p_p2.valid){return null;}
  return interpRec(p_p1, p_p2, p_primitives, REC_INTERP);
}

Point interpRec(Point p_p1, Point p_p2, ArrayList<Primitive> p_primitives , int p_level) {
  Point m = new Point(PVector.lerp(p_p1.pos, p_p2.pos, 0.5), p_primitives);
  if ((p_level <= 0) || (p_p1.valid == p_p2.valid))  { return m; }
  if (m.valid == p_p1.valid) { return interpRec(m, p_p2, p_primitives, p_level-1); }
  return interpRec(p_p1, m, p_primitives, p_level-1);
}
