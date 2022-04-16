public class Metaplane extends Primitive{
  public float h;
  public PVector normal;

  public Metaplane(float p_h){
    super();
    this.h = p_h;
    this.normal = new PVector(0,1,0);
  }
  
  public Metaplane(float p_h, PVector p_normal){
    super();
    this.h = p_h;
    this.normal = p_normal;
  }

  public float evaluate(PVector p_point){
    float dst = h-PVector.dot(p_point,normal);
    return dst<0 ? 1. : blend(dst*dst);
  }
  public void move(float p_min, float p_max){}
}
