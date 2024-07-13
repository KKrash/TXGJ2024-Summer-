extends Node2D
var score

## Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	new_game()
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_score_timer_timeout():
	incrementScore(1)
	$HUD.update_score(score)

func new_game():
	score = 0
	$HUD.update_score(score)
	
func game_over():
	$Score_Timer.stop()
	
func incrementScore(num):
	score+=num

	
