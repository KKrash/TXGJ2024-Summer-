extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#connect("body_entered", self.get_node("Area2D"), "_on_Area_body_entered")
	apply_central_impulse(Vector2(-300, -300))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Area_body_entered(body:Node) -> void:
	pass
