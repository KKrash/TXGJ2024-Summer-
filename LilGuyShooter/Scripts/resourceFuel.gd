extends Sprite2D
signal obtainedFuel

func _on_area_2d_body_entered(body):
	hide()
	obtainedFuel.emit()

func _on_visibility_changed():
	call_deferred("free")
