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

func _on_area_2d_body_entered(body):
	if body.is_in_group("ship"):
		#print("ASTEROIDHIT")
		if body.has_method("_damageFuel"):
			#print("damagingfuel")
			body._damageFuel()
	queue_free() 


#func _on_area_2d_area_entered(area):
	#print("ASTEROIDHIT")
	#if area.has_method("_damageFuel"):
		##print("damagingfuel")
		#area._damageFuel()
	#queue_free() 
