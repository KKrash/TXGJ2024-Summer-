extends Area2D
func _physics_process(delta):
	pass	

func _on_body_entered(body):
	print("hit")
	var x = get_parent()
	x.queue_free()
