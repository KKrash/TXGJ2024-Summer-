extends CharacterBody2D
const SPEED = 100
func _physics_process(delta):
	var vel: Vector2 =  (get_global_mouse_position()-global_position)
	if(vel.length()>1):
		vel = vel.normalized()*SPEED
	velocity = vel
	move_and_slide()
	
func _process(delta):
	
	return
	
