class Metaball extends Primitive{
  public Center center;
  public float radius;
  private float radius2;
  
  public Metaball(){
    super();
    //this.center = new center();
    this.radius = random(20,60);
    this.radius2 = radius*radius;
  }
  
  public Metaball(Center p_center, float p_radius){
    super();
    this.center = p_center;
    this.radius = p_radius;
    this.radius2 = p_radius*p_radius;
  }
  
  public float evaluate(PVector p_point){
    PVector vec = new PVector(center.pos.x-p_point.x,center.pos.y-p_point.y,center.pos.z-p_point.z);
    return blend(vec.dot(vec)/radius2);
  }
  
  public void move(float p_min, float p_max){
    center.move(p_min, p_max);
  }
}
