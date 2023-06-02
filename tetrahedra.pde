public class Tetrahedra{
  private Point p0;
  private Point p1;
  private Point p2;
  private Point p3;
  
  public Tetrahedra( Point p_p0, Point p_p1, Point p_p2, Point p_p3){
    p0 = p_p0;
    p1 = p_p1;
    p2 = p_p2;
    p3 = p_p3;
  }
  
  private Point lerp(Point p_p1, Point p_p2) {
    Point mid = null;
    Point start = p_p1;
    Point stop = p_p2;
    
    for(int i=0; i<5 ;i++){
      if(start.isValid() == stop.isValid()){break;}
      mid = new Point(PVector.lerp(start.getPosition(), stop.getPosition(), 0.5f));
      if(mid.isValid() == p_p1.isValid()){start=mid;}
      else{stop=mid;}
    }
    
    return mid;
  }
  
  public Point a(){return lerp(p0, p1);}
  public Point b(){return lerp(p0, p2);}
  public Point c(){return lerp(p0, p3);}
  public Point d(){return lerp(p1, p2);}
  public Point e(){return lerp(p1, p3);}
  public Point f(){return lerp(p2, p3);}
  
  public void update(){
    switch((p0.isValid()<<3) | (p1.isValid()<<2) | (p2.isValid()<<1) | p3.isValid()){
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
