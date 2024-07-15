extends Sprite2D

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		print("collected fuel")
		GlobalVars.currentFuel = min(20, GlobalVars.currentFuel+1)
		GlobalVars.score += 10
		print(str(GlobalVars.score))
		get_parent().queue_free()

