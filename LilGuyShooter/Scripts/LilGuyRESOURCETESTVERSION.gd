extends CharacterBody2D
signal hit

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var AnimatedGuy = $AnimatedSpaceMan
@onready var hitbox = $Area2D/CollisionShape2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		#AnimatedGuy.play("jump")
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("up") and not is_on_floor() and velocity.y < 0:
		velocity.y += 150

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	#if(is_on_floor()):
		#AnimatedGuy.play("walking")
	#else:
		#AnimatedGuy.play("jump")
	if direction:
		
		velocity.x = direction * SPEED
		#if(velocity.x >0 ):
			#AnimatedGuy.flip_h = false
		#else:
			#AnimatedGuy.flip_h = true
	else:
		#if(is_on_floor()):
			#AnimatedGuy.play("default")
		#else:
			#AnimatedGuy.play("jump")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Boom"):
		print("OW FUCK")
		_takeDamage()
	pass # Replace with function body.
	



func _takeDamage():
	GlobalVars.lives-=1
	#print("BULLET HIT PLAYER "+str(GlobalVars.lives))
