void vertex(PVector p_p){
  vertex(p_p.x,p_p.y,p_p.z);
}

void triangle(PVector p_p1, PVector p_p2, PVector p_p3){
  beginShape();
  vertex(p_p1);
  vertex(p_p2);
  vertex(p_p3);
  endShape();
}

void quad(PVector p_p1, PVector p_p2, PVector p_p3,  PVector p_p4){
  beginShape();
  vertex(p_p1);
  vertex(p_p2);
  vertex(p_p3);
  vertex(p_p4);
  endShape();
}
 
Point interp(Point p_p1, Point p_p2, ArrayList<Primitive> p_primitives) {
  return interpRec(p_p1, p_p2, p_primitives, REC_INTERP);
}

Point interpRec(Point p_p1, Point p_p2, ArrayList<Primitive> p_primitives , int p_level) {
  Point m = new Point(PVector.lerp(p_p1.pos, p_p2.pos, 0.5), p_primitives);
  if ((p_level <= 0) || (p_p1.valid == p_p2.valid))  { return m; }
  if (m.valid == p_p1.valid) { return interpRec(m, p_p2, p_primitives, p_level-1); }
  return interpRec(p_p1, m, p_primitives, p_level-1);
}
