extends Node2D

## Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	new_game()
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_score_timer_timeout():
	GlobalVars.score+=1
	$HUD.update_score(GlobalVars.score)

func new_game():
	GlobalVars.score = 0
	$ResourceTimer.start()
	$HUD.update_score(GlobalVars.score)
	
func game_over():
	$Score_Timer.stop()

