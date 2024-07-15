extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(-1,0) * 50
	#add_constant_force (Vector2(-30, -0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite2D.rotate(0.05)
	linear_velocity = Vector2(-1,0) * 50


func _physics_process(delta):
	pass


func _on_area_2d_body_entered(body):
	#print("ASTEROIDHIT")
	if body.is_in_group("ship"):
		if body.has_method("_damageFuel"):
			body._damageFuel()
	queue_free() 
