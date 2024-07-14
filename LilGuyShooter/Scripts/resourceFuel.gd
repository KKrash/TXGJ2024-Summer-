extends Sprite2D

func _on_area_2d_body_entered(_body):
	hide()
	GlobalVars.currentFuel += 1
	GlobalVars.score+=10

func _on_visibility_changed():
	call_deferred("free")
