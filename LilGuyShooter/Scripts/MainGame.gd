extends Node2D

## Called when the node enters the scene tree for the first time.
func _ready():
	new_game()	
	var bg_music := AudioStreamPlayer.new()
	bg_music.stream = load("res://Assets/Audio/AmbienceMusicV7.mp3")
	bg_music.autoplay = true
	add_child(bg_music)
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GlobalVars.lives != GlobalVars.max_lives:
		decrementBar()
	if GlobalVars.lives == 0:
		game_over()
	if GlobalVars.currentFuel <= 0:
		game_over()
	
func _on_score_timer_timeout():
	GlobalVars.score+=1
	$HUD.update_score(GlobalVars.score)

func new_game():
	GlobalVars.score = 0
	GlobalVars.lives = 3
	GlobalVars.max_lives = 3;
	var size_of_bar = Vector2(GlobalVars.currentFuel, 5)
	$HUD/FuelBar.set_size(size_of_bar)
	var size_of_lives = Vector2(GlobalVars.lives*32, 32)
	$"HUD/sprite for heart".set_size(size_of_lives)
	$ResourceTimer.start()
	$"Fuel Decrease".start()
	$HUD.update_score(GlobalVars.score)
	
func game_over():
	$ScoreTimer.stop()
	get_tree().change_scene_to_file("res://ending_scene.tscn")

func _on_fuel_decrease_timeout():
	GlobalVars.currentFuel-=.20
	var newSize = Vector2(GlobalVars.currentFuel, $HUD/FuelBar.get_size().y)
	$HUD/FuelBar.set_size(newSize)
	#print($HUD/FuelBar.get_size())
	
func decrementBar():
	var anotherSize = Vector2(32*GlobalVars.lives, 32)
	$"HUD/sprite for heart".set_size(anotherSize)
