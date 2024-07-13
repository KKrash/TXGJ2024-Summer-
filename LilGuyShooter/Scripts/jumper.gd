extends RigidBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var on_ground = 0

func _on_Area2D_body_entered(body: Node) -> void:
	on_ground += 1

func _on_Area2D_body_exited(body: Node) -> void:
	on_ground -= 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _ready():
#	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
#	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rng = RandomNumberGenerator.new()
	var waitTime = rng.randf_range(0.3, 2.5)
	var direction = rng.randi_range(1, 3)
	# 2/3 will go left 1/3 go right
	await get_tree().create_timer(waitTime).timeout
	if on_ground>0:
		if direction>1:
			apply_central_impulse(Vector2(-300, -300))
		else:
			apply_central_impulse(Vector2(300, -300))
		
