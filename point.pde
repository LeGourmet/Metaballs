public class Point{
  public PVector pos;
  public ArrayList<Primitive> prims;
  public int valid;  // 1=valid and 0=invalid
  
  public Point(PVector p_pos, ArrayList<Primitive> p_primitives){
    pos=p_pos;
    prims = p_primitives;
    update();
  }
  
  public void update(){
    float value = 0.f;
    
    for(Primitive primitive : prims)
      value += primitive.evaluate(pos);
    
    valid = (value >= 0.5f ? 1 : 0);
  }
  
}
