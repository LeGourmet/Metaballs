public class Tetrahedra{
  public Point[] points;
  public boolean valid;
  public boolean ambiguous;
  
  public Tetrahedra( Point p_p1, Point p_p2, Point p_p3, Point p_p4){
    points = new Point[]{p_p1, p_p2, p_p3, p_p4};
    valid = p_p1.valid && p_p2.valid && p_p3.valid && p_p4.valid;
    ambiguous = !valid && (p_p1.valid || p_p2.valid || p_p3.valid || p_p4.valid);
  }
  
  private void my_vertex(Point p_p){
    vertex(p_p.pos.x, p_p.pos.y, p_p.pos.z);
  }
  
  public void display(){
    if(points[0].valid && points[1].valid && points[2].valid && points[3].valid){
      beginShape(TRIANGLE);
      my_vertex(points[0]);
      my_vertex(points[1]);
      my_vertex(points[2]);
      
      my_vertex(points[0]);
      my_vertex(points[1]);
      my_vertex(points[3]);
      
      my_vertex(points[0]);
      my_vertex(points[2]);
      my_vertex(points[3]);
      
      my_vertex(points[1]);
      my_vertex(points[2]);
      my_vertex(points[3]);
      endShape(CLOSE);
    }
  }
}
