class Metaball extends Primitive{
  public PVector pos;
  public PVector velocity;
  private float radius2;
  
  public Metaball(float p_min, float p_max){
    super();
    this.pos = new PVector(random(p_min,p_max),random(p_min,p_max),random(p_min,p_max));
    this.velocity = new PVector(random(-1,1),random(-1,1),random(-1,1));
    float radius = random(20,40);
    this.radius2 = radius*radius;
  }
  
  public Metaball(PVector p_center, PVector p_velocity, float p_radius){
    super();
    this.pos = p_center;
    this.velocity = p_velocity;
    this.radius2 = p_radius*p_radius;
  }
  
  public float evaluate(PVector p_point){
    PVector vec = new PVector(pos.x-p_point.x,pos.y-p_point.y,pos.z-p_point.z);
    return blend(vec.dot(vec)/radius2);
  }
  
  public void move(float p_min ,float p_max){
    pos.add(velocity);
    if(pos.x<p_min){ pos.x = p_min; velocity.x *=-1; }
    if(pos.y<p_min){ pos.y = p_min; velocity.y *=-1; }
    if(pos.z<p_min){ pos.z = p_min; velocity.z *=-1; }
    if(pos.x>p_max){ pos.x = p_max; velocity.x *=-1; }
    if(pos.y>p_max){ pos.y = p_max; velocity.y *=-1; }
    if(pos.z>p_max){ pos.z = p_max; velocity.z *=-1; }
  }
}
