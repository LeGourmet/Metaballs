public class Point{
  public PVector pos;
  public int valid;  // 1=valid and 0=not
  
  public Point(PVector p_pos, ArrayList<Primitive> p_primitives){
    pos=p_pos;
    update(p_primitives);
  }
  
  public void update(ArrayList<Primitive> p_primitives){
    float value = 0.f;
    for(Primitive primitive : p_primitives){
      float tmp = primitive.evaluate(pos);
      if(tmp>0){value += tmp;}
    }
    valid = (value >= 0.5f ? 1 : 0);
  }
  
}
