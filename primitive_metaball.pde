class Metaball extends Primitive{
  private PVector _position;
  private PVector _velocity;
  private float   _radius;
  
  public Metaball(float p_boundMin, float p_boundMax){
    super();
    this._position = new PVector(random(p_boundMin,p_boundMax),random(p_boundMin,p_boundMax),random(p_boundMin,p_boundMax));
    this._velocity = new PVector(random(-1.f,1.f),random(-1.f,1.f),random(-1.f,1.f));
    this._radius   = random(20.f,40.f);
  }
  
  public Metaball(PVector p_center, PVector p_velocity, float p_radius){
    super();
    this._position = p_center;
    this._velocity = p_velocity;
    this._radius   = p_radius;
  }
  
  public PVector getPosition(){ return _position; }
  public PVector getVelocity(){ return _velocity; }
  public float   getRadius()  { return _radius;   }
  
  public float evaluate(PVector p_point){
    return blend(PVector.sub(_position,p_point).magSq()/(_radius*_radius));
  }
  
  public void move(float p_boundMin ,float p_boundMax){
    _position.add(_velocity);
    if(_position.x<p_boundMin){ _position.x = p_boundMin; _velocity.x *= -1.f; }
    if(_position.y<p_boundMin){ _position.y = p_boundMin; _velocity.y *= -1.f; }
    if(_position.z<p_boundMin){ _position.z = p_boundMin; _velocity.z *= -1.f; }
    if(_position.x>p_boundMax){ _position.x = p_boundMax; _velocity.x *= -1.f; }
    if(_position.y>p_boundMax){ _position.y = p_boundMax; _velocity.y *= -1.f; }
    if(_position.z>p_boundMax){ _position.z = p_boundMax; _velocity.z *= -1.f; }
  }
}
