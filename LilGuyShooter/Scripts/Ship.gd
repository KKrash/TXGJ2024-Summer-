extends CharacterBody2D
const SPEED = 2500
func _physics_process(delta):
	var vel: Vector2 =  (get_global_mouse_position()-global_position)
	if(vel.length()>SPEED*0.25):
		vel = vel.normalized()*SPEED*2
	velocity = vel
	move_and_slide()
