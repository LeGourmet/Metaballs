void triangle(PVector p1, PVector p2, PVector p3){
  line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
  line(p2.x, p2.y, p2.z, p3.x, p3.y, p3.z);
  line(p1.x, p1.y, p1.z, p3.x, p3.y, p3.z);
}

void quad(PVector p1, PVector p2, PVector p3,  PVector p4){
  line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
  line(p2.x, p2.y, p2.z, p3.x, p3.y, p3.z);
  line(p3.x, p3.y, p3.z, p4.x, p4.y, p4.z);
  line(p1.x, p1.y, p1.z, p4.x, p4.y, p4.z);
}
 
Point interp(Point p1, Point p2) {
  return interpRec(p1, p2, REC_INTERP);
}

Point interpRec(Point p1, Point p2, int level) {
  Point m = new Point(PVector.lerp(p1.pos, p2.pos, 0.5));
  if ((level == 0) || (p1.valid == p2.valid)) 
    return m;
  if (m.valid == p1.valid) 
    return interpRec(m, p2, level-1);
  return interpRec(p1, m, level-1);
}
