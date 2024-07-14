extends RigidBody2D
var callable = Callable(self, "_on_BodyEntered")
var explosionScene : PackedScene = preload("res://Assets/Misc/Projectiles/Explosion.tscn")
@onready var sprite = $AnimatedSprite2D
func _ready():
	sprite.play("default")
	connect("body_entered",callable)

func _on_BodyEntered(body):
	# Check if the colliding body should trigger removal

	queue_free()  # Remove the RigidBody2D from the scene

	
func _on_body_entered(body):

	pass # Replace with function body.
