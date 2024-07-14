extends Control

func _on_button_pressed():
	get_tree().change_scene_to_file("res://combined_resource_+_score.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://credits_menu.tscn")
