abstract class Primitive{
  public Primitive(){}

  float blend(float p_distSq){
    return (p_distSq<1.f ? (1.-p_distSq)*(1.-p_distSq)*8.f/9.f : 0.f);
  }
  
  public abstract float evaluate(PVector p_point);
  public abstract void move(float p_min, float p_max);
}
