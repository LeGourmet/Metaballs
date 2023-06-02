void vertex(PVector p_p){
  vertex(p_p.x,p_p.y,p_p.z);
}

void translate(PVector p_v){
  translate(p_v.x,p_v.y,p_v.z);
}

void triangle(Point p_p1, Point p_p2, Point p_p3){
  vertex(p_p1.getPosition());
  vertex(p_p2.getPosition());
  vertex(p_p3.getPosition());
}

void quad(Point p_p1, Point p_p2, Point p_p3, Point p_p4){
  vertex(p_p1.getPosition());
  vertex(p_p2.getPosition());
  vertex(p_p3.getPosition());
  
  vertex(p_p2.getPosition());
  vertex(p_p3.getPosition());
  vertex(p_p4.getPosition());
}
