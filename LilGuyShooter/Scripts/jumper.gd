extends RigidBody2D

@onready var my_timer = $Timer
const SPEED = 100.0
const JUMP_VELOCITY = -50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var time=0;
var on_ground = 0

func _on_Area2D_body_entered(body: Node) -> void:
	on_ground += 1

func _on_Area2D_body_exited(body: Node) -> void:
	on_ground -= 1

# Called when the node enters the scene tree for the first time.
func _ready():
	my_timer.timeout.connect(_on_timer_timeout)
	my_timer.wait_time = 2.5
	my_timer.start()

#func _ready():
#	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
#	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
func _jump(rng):
	#var rng = RandomNumberGenerator.new()
	#var waitTime = rng.randf_range(0.3, 2.5)
	var direction = rng.randi_range(1, 3)
	#if on_ground>0:
	if direction>1:
		apply_central_impulse(Vector2(-300, -300))
		#print("left gaming")
	else:
		apply_central_impulse(Vector2(300, -300))
		#print("right gaming")

func _on_timer_timeout():
	#print("Timer has timed out!")
	my_timer.stop()
	var rng = RandomNumberGenerator.new()
	_jump(rng)
	var waitTime = rng.randf_range(0.3, 2.5)
	my_timer.wait_time =waitTime
	my_timer.start()
