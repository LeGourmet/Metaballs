public class Metaplane extends Primitive{
  public float size;
  public float h;
  public PVector normal;

  public Metaplane(float p_h){
    super();
    this.normal = new PVector(0,-1,0);
    this.h = p_h;
  }

  public float evaluate(PVector p_point){
    return -1*normal.dot(p_point)+h;
  }
  public void move(float p_min, float p_max){}
}
