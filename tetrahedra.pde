public class Tetrahedra{
  public Point p0;
  public Point p1;
  public Point p2;
  public Point p3;
  public ArrayList<Primitive> prims;
  
  public Tetrahedra( Point p_p0, Point p_p1, Point p_p2, Point p_p3, ArrayList<Primitive> p_primitives){
    p0 = p_p0;
    p1 = p_p1;
    p2 = p_p2;
    p3 = p_p3;
    prims = p_primitives;
  }
  
  public Point a(){return interp(p0, p1, prims);}
  public Point b(){return interp(p0, p2, prims);}
  public Point c(){return interp(p0, p3, prims);}
  public Point d(){return interp(p1, p2, prims);}
  public Point e(){return interp(p1, p3, prims);}
  public Point f(){return interp(p2, p3, prims);}
  
  public void update(){
    switch((p0.valid<<3) | (p1.valid<<2) | (p2.valid<<1) | p3.valid){
      case 0:
      case 15: break;
  
      case 1:
      case 14: triangle(c(), e(), f());break;
      
      case 2:
      case 13: triangle(b(), d(), f());break;
      
      case 4: 
      case 11: triangle(a(), d(), e());break;
      
      case 8:
      case 7: triangle(a(), b(), c());break;
      
      case 3:
      case 12: quad(b(), c(), d(), e());break;
      
      case 5:
      case 10: quad(a(), c(), d(), f());break;
      
      case 6: 
      case 9: quad(a(), b(), e(), f());break;
    }
  }
  
}
