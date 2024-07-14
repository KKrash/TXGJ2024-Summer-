extends Area2D
var explosionScene : PackedScene = preload("res://Assets/Misc/Projectiles/Explosion.tscn")
func _physics_process(delta):
	if(get_parent().linear_velocity.y <1 ):
		var x = get_parent()
		var p = x.position
		print(p)
		if explosionScene != null:
			var explosion = explosionScene.instantiate()
			if explosion != null:
				# Set the position of the explosion
				explosion.position = p
				explosion.position.y += 350
				explosion.position.x += 35

				# Add the explosion to the scene
				get_tree().root.add_child(explosion)
		x.queue_free()
	pass	

func _on_body_entered(body):
	print(body)
	var x = get_parent()
	var p = x.position
	print(p)
	if explosionScene != null:
		var explosion = explosionScene.instantiate()
		if explosion != null:
			# Set the position of the explosion
			explosion.position = p
			explosion.position.y += 350
			explosion.position.x += 35

			# Add the explosion to the scene
			get_tree().root.add_child(explosion)
	x.queue_free()
