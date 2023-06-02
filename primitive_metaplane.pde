public class Metaplane extends Primitive{
  private float   _height;
  private PVector _normal;
  
  public Metaplane(float p_height, PVector p_normal){
    super();
    this._height = p_height;
    this._normal = p_normal;
  }

  public float getHeight(){ return _height; }
  public PVector getNormal(){ return _normal; }

  public float evaluate(PVector p_point){
    float dst = _height-PVector.dot(p_point,_normal);
    return dst<0.f ? 1.f : blend(dst*dst);
  }
  
  public void move(float p_min, float p_max){}
}
