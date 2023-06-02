public class Point{
  private PVector _position;
  private boolean _valid;
  
  public Point(PVector p_pos){
    this._position = p_pos;
    update();
  }
  
  public PVector getPosition() { return _position; }
  public int     isValid() { return (_valid) ? 1 : 0; }
  
  public void update(){
    float value = 0.f;
    
    for(Primitive primitive : primitives)
      value += primitive.evaluate(_position);
    
    _valid = value >= 0.5f;
  }
  
}
