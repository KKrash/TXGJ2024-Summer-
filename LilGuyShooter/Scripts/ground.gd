extends StaticBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	#translate(Vector2(-50, 0))
	set_constant_linear_velocity(Vector2.LEFT * 50)
	#add_constant_force (Vector2(-30, -0))
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(-.415, 0))
	if self.global_position.x <-100:
		queue_free()


func _physics_process(delta):
	pass
