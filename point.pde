public class Point{
  public PVector pos;
  public boolean valid;
  
  public Point(PVector p_pos, ArrayList<Primitive> p_primitives){
    pos = p_pos;
    for(Primitive primitive : p_primitives){
      if(primitive.evaluate(pos)>0.f){valid = true; return;}
    }
    valid = false;
  }
}
