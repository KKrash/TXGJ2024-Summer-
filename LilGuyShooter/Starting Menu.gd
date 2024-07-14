extends Control
#var root = get_tree().get_root()
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#func _on_button_pressed():
	#var level = get_tree().get_current_scene()
	#root.remove_child(level)
	#level.call_deferred("free")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://combined_resource_+_score.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://credits_menu.tscn")
