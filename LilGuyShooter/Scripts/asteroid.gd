extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2.LEFT * 50
	#add_constant_force (Vector2(-30, -0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity = Vector2.LEFT * 50


func _physics_process(delta):
	pass
