abstract class Primitive{
  private float _fact = 8./9.;
  
  public Primitive(){}

  float blend(float p_dist){ // distance au carre
    return (p_dist<1. ? _fact*(1.-p_dist)*(1.-p_dist) : 0.);
  }
  
  public abstract float evaluate(PVector p_point);
  public abstract void move(float p_min, float p_max);
}
