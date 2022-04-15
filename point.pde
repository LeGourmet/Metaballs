public class Point{
  public PVector pos;
  public float value = 0.f;
  public int valid = 0;  // 1=valid and 0=not
  
  public Point(PVector p_pos){pos=p_pos;}
  
  public void update(ArrayList<Primitive> p_primitives){
    value = 0.f;
    for(Primitive primitive : p_primitives){
      value += primitive.evaluate(pos);
    }
    valid = (value >= 0.5f ? 1 : 0);
  }
  
}
