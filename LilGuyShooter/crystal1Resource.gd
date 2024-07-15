extends Sprite2D

func _on_area_2d_body_entered(_body):
	if _body.is_in_group("player"):
		print("collected crystal 1")
		#GlobalVars.currentFuel = min(20, GlobalVars.currentFuel+1)
		GlobalVars.score += 30
		print(str(GlobalVars.score))

		get_parent().queue_free()

