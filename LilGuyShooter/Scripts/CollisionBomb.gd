extends Area2D
var explosionScene : PackedScene = preload("res://Assets/Misc/Projectiles/Explosion.tscn")
func _physics_process(delta):
	pass	

func _on_body_entered(body):
	var x = get_parent()
	var p = x.position
	print(p)
	if explosionScene != null:
		var explosion = explosionScene.instantiate()
		if explosion != null:
			# Set the position of the explosion
			explosion.position = p

			# Add the explosion to the scene
			get_tree().root.add_child(explosion)
	x.queue_free()
