extends Area2D
var callable = Callable(self, "_on_BodyEntered")
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	
	connect("body_entered",callable)
func _process(delta):
	animation.play()
	if(animation.frame == 3):
		queue_free()
func _on_BodyEntered(body):
	print(body)
	# Check if the colliding body should trigger removal
	pass
	
