extends Sprite2D
signal obtainedFuel

func _on_area_2d_body_entered(body):
	hide()
	GlobalVars.score+=10

func _on_visibility_changed():
	call_deferred("free")
