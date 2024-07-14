extends RigidBody2D

var callable = Callable(self, "_on_BodyEntered")
#var explosionScene : PackedScene = preload("res://Assets/Misc/Projectiles/ExplosionEnemy.tscn")
@onready var sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	#connect("body_entered", self.get_node("Area2D"), "_on_Area_body_entered")
	apply_central_impulse(Vector2(-300, -300))
	connect("body_entered",callable)

func on_Area2D_body_entered(body):
	if body.has_method("hit"):
		body.hit()
	queue_free() 
