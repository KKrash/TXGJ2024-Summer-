extends RigidBody2D
var callable = Callable(self, "_on_BodyEntered")
func _ready():
	connect("body_entered",callable)

func _on_BodyEntered(body):
	# Check if the colliding body should trigger removal
	queue_free()  # Remove the RigidBody2D from the scene
func _on_body_entered(body):
	print("hi")
	pass # Replace with function body.
