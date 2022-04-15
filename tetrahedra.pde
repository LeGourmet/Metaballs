public class Tetrahedra{
  public Point p0;
  public Point p1;
  public Point p2;
  public Point p3;
  
  public Tetrahedra( Point p_p0, Point p_p1, Point p_p2, Point p_p3){
    p0 = p_p0;
    p1 = p_p1;
    p2 = p_p2;
    p3 = p_p3;
  }
  
  public void update(ArrayList<Primitive> p_primitives){
    int val = 8*p0.valid + 4*p1.valid + 2*p2.valid + p3.valid;
    if(val==0 || val==15){return;}
    
    Point a = interp(p0, p1, p_primitives);
    Point b = interp(p0, p2, p_primitives);
    Point c = interp(p0, p3, p_primitives);
    Point d = interp(p1, p2, p_primitives);
    Point e = interp(p1, p3, p_primitives);
    Point f = interp(p2, p3, p_primitives);
  
    if     (val==1 || val==14){triangle(c, e, f);}
    else if(val==2 || val==13){triangle(b, d, f);}
    else if(val==4 || val==11){triangle(a, d, e);}
    else if(val==8 || val==7 ){triangle(a, b, c);}
    
    else if(val==3 || val==12){quad(b, c, d, e);}
    else if(val==5 || val==10){quad(a, c, d, f);}
    else if(val==6 || val==9 ){quad(a, b, e, f);}
  }
  
}
