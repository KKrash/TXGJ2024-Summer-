extends CharacterBody2D
const SPEED = 100
var projectileScene : PackedScene = preload("res://Assets/Misc/Projectiles/LaserBlast.tscn")
var shootForce : float = 150.0
var gravity : float = 500.0
func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	var vel: Vector2 =  (get_global_mouse_position()-global_position)
	if(vel.length()>1):
		vel = vel.normalized()*SPEED
	velocity = vel
	move_and_slide()
	
func _process(delta):
	
	return
	
func shoot():
	var targetPosition = position+Vector2(25,0)

	if projectileScene != null:
		var projectileInstance: RigidBody2D = projectileScene.instantiate()
		
		if projectileInstance != null:
			# Add the projectile to the scene
			get_parent().add_child(projectileInstance)
			projectileInstance.position = targetPosition
			
			# Calculate direction and initial velocity
			var direction = Vector2(1,0)
			var initialVelocity = direction * shootForce
			projectileInstance.linear_velocity = initialVelocity
 # Connect collision signal
			
