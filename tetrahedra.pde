public class Tetrahedra{
  public Point[] points;
  
  public Tetrahedra( Point p_p1, Point p_p2, Point p_p3, Point p_p4){
    points = new Point[]{p_p1, p_p2, p_p3, p_p4};
  }
  
  public void update(ArrayList<Primitive> p_primitives){
    PVector a, b, c, d, e, f;
    
    a = interp(points[0], points[1], p_primitives).pos;
    b = interp(points[1], points[2], p_primitives).pos;
    c = interp(points[2], points[3], p_primitives).pos;
    d = interp(points[3], points[0], p_primitives).pos;
    e = interp(points[2], points[0], p_primitives).pos;
    f = interp(points[3], points[1], p_primitives).pos;
  
    switch( 8*points[0].valid + 4*points[1].valid + 2*points[2].valid + points[3].valid ){
      case 1:
        triangle(a, d, e); break;
      case 2:
        triangle(c, b, e); break;
      case 3:
        quad(b, c, d, a); break;
      case 4:
        triangle(a, b, f); break;
      case 5:
        quad(b, f, e, d); break;
      case 6:
        quad(a, f, c, e); break;
      case 7:
        triangle(c, d, f); break;
      case 8:
        triangle(c, d, f); break;
      case 9:
        quad(a, f, c, e); break;
      case 10:
        quad(b, f, e, d); break;
      case 11:
        triangle(a, b, f); break;
      case 12:
        quad(b, c, d, a); break;
      case 13:
        triangle(c, b, e); break;
      case 14:
        triangle(a, d, e); break;
    }
  }
  
}
