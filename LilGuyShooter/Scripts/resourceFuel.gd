extends Sprite2D

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		print("collected fuel")
		hide()
		GlobalVars.currentFuel = min(20, GlobalVars.currentFuel+1)
		GlobalVars.score += 10
		print(str(GlobalVars.score))
		queue_free()

