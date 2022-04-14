public class Center{
  public PVector pos;
  public PVector velocity;
  
  public Center(PVector p_pos, PVector p_vel){
    this.pos = p_pos;
    this.velocity = p_vel;
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
