public class Point{
  public PVector pos;
  public boolean valid = false;
  
  public Point(PVector p_pos){pos=p_pos;}
  
    public void update(ArrayList<Primitive> p_primitives){
    for(Primitive primitive : p_primitives){
      if(primitive.evaluate(pos)>0.f){valid = true; return;}
    }
    valid = false;
  }
}
