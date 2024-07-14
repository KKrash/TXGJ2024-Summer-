extends CharacterBody2D
const SPEED = 100
var projectileScene : PackedScene = preload("res://Assets/Misc/Projectiles/LaserBlast.tscn")
var shootForce : float = 400.0
var cooldown_time = 0.5  # Cooldown time in seconds
var last_attack_time = 0  # Time of the last attack
var can_attack = true
var gravity : float = 500.0
func _ready():
	$AnimatedSprite2D.play("default")
	$AudioStreamPlayer2D.play()
func _physics_process(delta):
	if last_attack_time == 0 and !can_attack:
		can_attack = true
	elif last_attack_time > 0:
		can_attack = false
		last_attack_time += delta
		last_attack_time = clamp (last_attack_time, 0, cooldown_time)
		if last_attack_time == cooldown_time:
			last_attack_time = 0
	else:
		pass
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_just_pressed("shoot2"):
		shoot2()
	var vel: Vector2 =  (get_global_mouse_position()-global_position)
	if(vel.length()>1):
		vel = vel.normalized()*SPEED
	velocity = vel
	move_and_slide()
	
func _process(delta):
	
	return
	
func shoot():
	var targetPosition = position+Vector2(100,-10)
	
	if can_attack:
		$AudioStreamPlayer2D2.play(0.0)
		last_attack_time = 0.001
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
		
func shoot2():
	$AudioStreamPlayer2D2.play(0.0)
	var targetPosition = position+Vector2(0,30)
	if can_attack:
		last_attack_time = 0.001
		if projectileScene != null:
			var projectileInstance: RigidBody2D = projectileScene.instantiate()
			
			if projectileInstance != null:
				# Add the projectile to the scene
				get_parent().add_child(projectileInstance)
				projectileInstance.position = targetPosition
				
				# Calculate direction and initial velocity
				var direction = Vector2(0,1)
				var initialVelocity = direction * shootForce
				projectileInstance.linear_velocity = initialVelocity

					
func _damageFuel():
	GlobalVars.fuelPercentage-=10
	#print("ASTEROID HIT SHIP "+str(GlobalVars.fuelPercentage))
