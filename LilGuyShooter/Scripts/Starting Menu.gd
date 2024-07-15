extends Control


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Assets/EnemyTestSceneAndPlayer.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://credits_menu.tscn")
	

func _ready():
	var bg_music := AudioStreamPlayer.new()
	bg_music.stream = load("res://Assets/Audio/AmbienceMusicV7.mp3")
	bg_music.autoplay = true
	add_child(bg_music)
