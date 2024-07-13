extends Area2D
signal hit

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_body_entered(body):
	#pass # Replace with function body.
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	#add a score increment upon item pick up and what kind of item has been picked up
