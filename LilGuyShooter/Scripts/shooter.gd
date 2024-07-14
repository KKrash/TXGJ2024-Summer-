extends RigidBody2D
var bullet : PackedScene = preload("res://Assets/Misc/prefabs/bullet.tscn")
@onready var jumpTimer = $Timer
@onready var shootTimer = $Timer

const SPEED = 100.0
const JUMP_VELOCITY = -50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var time=0;
var on_ground = 0
var shootForce : float = 800.0

var rng = RandomNumberGenerator.new()
func _on_Area2D_body_entered(body: Node) -> void:
	on_ground += 1

func _on_Area2D_body_exited(body: Node) -> void:
	on_ground -= 1

# Called when the node enters the scene tree for the first time.
func _ready():
	jumpTimer.timeout.connect(_jump)
	jumpTimer.wait_time = 2.5
	shootTimer.timeout.connect(_shoot)
	shootTimer.wait_time = 2.5
	shootTimer.start()
	jumpTimer.start()

#func _ready():
#	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
#	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
func _jump():
	jumpTimer.stop()
	var direction = rng.randi_range(1, 3)
	#if on_ground>0:
	if direction>1:
		apply_central_impulse(Vector2(-150, -150))
		#print("left gaming")
	else:
		apply_central_impulse(Vector2(150, -150))
		#print("right gaming")
	var waitTime = rng.randf_range(3, 6)
	jumpTimer.wait_time =waitTime
	jumpTimer.start()

func _shoot():
	var targetPosition = position-Vector2(0,25)
	shootTimer.stop()
	
	if bullet != null:
		var bulletInstance: RigidBody2D = bullet.instantiate()
		if bulletInstance != null:
			# Add the projectile to the scene
			get_parent().add_child(bulletInstance)
			bulletInstance.position = targetPosition
			# Calculate direction and initial velocity
			var direction = Vector2(-.5,-.5)
			var initialVelocity = direction * shootForce
			bulletInstance.linear_velocity = initialVelocity
	
	#add_child(load("res://Assets/Misc/prefabs/bullet.tscn").instance())
	var waitTime = rng.randf_range(3, 6)
	shootTimer.wait_time =waitTime
	shootTimer.start()





func _on_area_2d_area_entered(area):
	queue_free()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):	
		#print("SHOOTERHIT")
		if body.has_method("_takeDamage"):
			body._takeDamage()
		queue_free()
